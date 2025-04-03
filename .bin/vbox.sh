#!/bin/bash
# vbox_manager.sh: A simple menu-driven VirtualBox VM manager

# Ensure VBoxManage is available.
if ! command -v VBoxManage &> /dev/null; then
    echo "VBoxManage not found. Please ensure VirtualBox is installed."
    exit 1
fi

# Check if xfreerdp is installed
if ! command -v xfreerdp &> /dev/null; then
    echo "xfreerdp not found. Please ensure it's installed."
    exit 1
fi

# Check if lsof is installed
if ! command -v lsof &> /dev/null; then
    echo "lsof not found. Please ensure it's installed."
    exit 1
fi

# Function to list all VMs with numbered entries.
list_vms() {
    vms=($(VBoxManage list vms | awk -F'"' '{print $2}'))  # Store in a global variable
    if [ ${#vms[@]} -eq 0 ]; then
        echo "No virtual machines found."
        return 1
    fi
    echo "Available VirtualBox VMs:"
    for i in "${!vms[@]}"; do
        echo "$((i + 1)): ${vms[$i]}"
    done
    return 0
}

# Function to list running VMs.
list_running_vms() {
    running_vms=($(VBoxManage list runningvms | awk -F'"' '{print $2}'))  # Store in a global variable
    if [ ${#running_vms[@]} -eq 0 ]; then
        echo "No virtual machines are currently running."
        return 1
    fi
    echo "Running VirtualBox VMs:"
    for i in "${!running_vms[@]}"; do
        echo "$((i + 1)): ${running_vms[$i]}"
    done
    return 0
}

# Function to select a VM by number.
select_vm() {
    local -n vm_list=$1  # Pass array reference
    local num
    if [ ${#vm_list[@]} -eq 0 ]; then
        return 1
    fi
    read -p "Enter the number of the VM: " num
    if [[ "$num" =~ ^[0-9]+$ ]] && (( num >= 1 && num <= ${#vm_list[@]} )); then
        echo "${vm_list[$((num - 1))]}"
        return 0
    else
        echo "Invalid selection."
        return 1
    fi
}

# Get the RDP port of a running VM
get_rdp_port() {
    VM_NAME="$1"
    RDP_PORT=$(VBoxManage showvminfo "$VM_NAME" | grep "VRDE port" | awk '{print $3}')
    
    # if [ -z "$RDP_PORT" ]; then
    #     echo "No RDP port configured for VM '$VM_NAME'. Please ensure VRDE is enabled."
    #     exit 1
    # fi
    echo "$RDP_PORT"
}

# Check if a port is in use.
is_port_in_use() {
    PORT=$1
    if lsof -i :$PORT > /dev/null; then
        return 0  # Port is in use
    else
        return 1  # Port is available
    fi
}

# Configure RDP for the VM.
configure_rdp() {
    VM_NAME="$1"
    
    # Ask the user to specify a port.
    read -p "Please specify a port for VRDE (default: 5900): " port
    port="${port:-5900}"  # Default to 5900 if no port is specified

    # Ensure the port is available.
    if is_port_in_use "$port"; then
        echo "Port $port is already in use. Please choose another port."
        return 1
    fi

    # Set the RDP port for the VM.
    VBoxManage modifyvm "$VM_NAME" --vrde on --vrdeport "$port"
    echo "RDP port $port has been configured for VM '$VM_NAME'."
}

# Main menu loop.
while true; do
    clear
    echo "===================================="
    echo " VirtualBox VM Manager"
    echo "===================================="
    echo "1. List all VMs"
    echo "2. List running VMs"
    echo "3. Start a VM"
    echo "4. Stop a VM"
    echo "5. Show VM info"
    echo "6. Config RDP"
    echo "7. RDP to VM"
    echo "8. Exit"
    echo "===================================="
    read -p "Select an option [1-6]: " option

    case $option in
        1)
            list_vms
            ;;
        2)
            list_running_vms
            ;;
        3)
            if list_vms; then
                vm_name=$(select_vm vms)  # Pass correct variable name
                if [ -n "$vm_name" ]; then
                    echo "Starting VM: $vm_name"
                    VBoxManage startvm "$vm_name" --type headless
                fi
            fi
            ;;
        4)
            if list_running_vms; then
                vm_name=$(select_vm running_vms)  # Pass correct variable name
                if [ -n "$vm_name" ]; then
                    echo "Stopping VM: $vm_name"
                    read -p "Use ACPI shutdown? (y/n): " choice
                    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
                        VBoxManage controlvm "$vm_name" acpipowerbutton
                    else
                        VBoxManage controlvm "$vm_name" poweroff
                    fi
                fi
            fi
            ;;
        5)
            if list_vms; then
                vm_name=$(select_vm vms)  # Pass correct variable name
                if [ -n "$vm_name" ]; then
                    echo "Showing info for VM: $vm_name"
                    VBoxManage showvminfo "$vm_name"
                fi
            fi
            ;;
        6)
            if list_vms; then
                vm_name=$(select_vm vms)  # Pass correct variable name
                if [ -n "$vm_name" ]; then
                    echo "Configure RDP of VM: $vm_name"
                    rdp_port=$(get_rdp_port "$vm_name")
                    echo "RDP port: $rdp_port"
                    
                    # If RDP is not configured, ask to configure it
                    if [ -z "$rdp_port" ]; then
                        if configure_rdp "$vm_name"; then
                            rdp_port=$(get_rdp_port "$vm_name")
                        else
                            exit 1
                        fi
                    fi
                fi
            fi
            ;;
        7)
            if list_running_vms; then
                vm_name=$(select_vm running_vms)  # Pass correct variable name
                if [ -n "$vm_name" ]; then
                    echo "RDP to VM: $vm_name"
                    rdp_port=$(get_rdp_port "$vm_name")
                    echo "RDP port: $rdp_port"
                    
                    # If RDP is not configured, ask to configure it
                    if [ -z "$rdp_port" ]; then
                        echo "RDP not configured, configure first"
                        exit 1
                    fi
                    
                    VM_IP="127.0.0.1"  # Adjust if using a different network mode
                    echo "Connecting to VM '$vm_name' at $VM_IP:$rdp_port with dynamic resolution..."
                    xfreerdp /v:$VM_IP /port:$rdp_port /dynamic-resolution /size:1920x1080 /cert:ignore /clipboard +clipboard > /dev/null 2>&1 &
                    disown
                fi
            fi
            ;;
        8)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select a valid option."
            ;;
    esac
    echo ""
    read -p "Press Enter to continue..."
done

