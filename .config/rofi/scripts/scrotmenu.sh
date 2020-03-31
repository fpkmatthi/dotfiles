#!/bin/sh

rofi_command="rofi -theme themes/scrotmenu.rasi"
screenshotdir="$HOME/Pictures/Screenshot"

# Icons {{{
screen=""
area=""
window=""
# }}}

chosen="$(echo -e "$screen\n$area\n$window" | $rofi_command -dmenu -selected-row 1)"

case $chosen in
    $screen)
        scrot -d 1 "${screenshotdir}/%d-%m-%Y_%H-%M-%S.png"
        latest=$(find ~/Pictures/Screenshot -printf '%T+ %p\n' | sort -r | head -n 1 | grep -Eo "${screenshotdir}/.*")
        xclip -selection clipboard -t image/png -i "${latest}" && notify-send "Screenshot saved and copied to clipboard"
        ;;
    $area)
        # scrot -s
        scrot -d 1 -s "${screenshotdir}/%d-%m-%Y_%H-%M-%S.png"
        latest=$(find ~/Pictures/Screenshot -printf '%T+ %p\n' | sort -r | head -n 1 | grep -Eo "${screenshotdir}/.*")
        xclip -selection clipboard -t image/png -i "${latest}" && notify-send "Screenshot saved and copied to clipboard"
        ;;
    $window)
        scrot -d 1 -u "${screenshotdir}/%d-%m-%Y_%H-%M-%S.png"
        latest=$(find ~/Pictures/Screenshot -printf '%T+ %p\n' | sort -r | head -n 1 | grep -Eo "${screenshotdir}/.*")
        xclip -selection clipboard -t image/png -i "${latest}" && notify-send "Screenshot saved and copied to clipboard"
        ;;
esac

