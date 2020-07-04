#!/bin/sh

rofi_command="rofi -theme themes/scrotmenu.rasi"
screenshotdir="$HOME/Pictures/Screenshot"

# Icons {{{
screen=""
area=""
window=""
# }}}

chosen="$(echo -e "$screen\n$area\n$window" | $rofi_command -dmenu -selected-row 1)"
# time="$(date +%d-%m-%Y_%H-%M-%S)"

copy_to_clipboard() {
  latest=$(find "${screenshotdir}" -printf '%T+ %p\n' | sort -r | head -n 1 | grep -Eo "${screenshotdir}/.*")
  xclip -selection clipboard -t image/png -i "${latest}" && notify-send "Screenshot saved and copied to clipboard"
}

case $chosen in
    $screen)
        flameshot full -c -p "${screenshotdir}"

        # scrot -d 1 "${screenshotdir}/%d-%m-%Y_%H-%M-%S.png"
        # copy_to_clipboard
        ;;
    $area)
        flameshot gui -p "${screenshotdir}"

        # scrot -d 1 -s "${screenshotdir}/%d-%m-%Y_%H-%M-%S.png"
        # copy_to_clipboard
        ;;
    $window)
        # NOTE: flameshot screen produces white screenshot, instead use scrot
        # flameshot screen -c -p "${screenshotdir}"

        scrot -d 1 -u "${screenshotdir}/%d-%m-%Y_%H-%M-%S.png"
        copy_to_clipboard
        ;;
esac

