#!/bin/dash

rofi_command="rofi -theme themes/scrotmenu.rasi"

# Icons {{{
screen=""
area=""
window=""
# }}}

chosen="$(echo "$screen\n$area\n$window" | $rofi_command -dmenu -selected-row 1)"

case $chosen in
    $screen)
        # sleep1 && scrot
        scrot -d 1 "$HOME/Pictures/screenshot/%d-%m-%Y_%H-%M-%S.png"
        ;;
    $area)
        # scrot -s
        scrot -d 1 -s "$HOME/Pictures/screenshot/%d-%m-%Y_%H-%M-%S.png"
        ;;
    $window)
        # sleep 1 && scrot -u
        scrot -d 1 -u "$HOME/Pictures/screenshot/%d-%m-%Y_%H-%M-%S.png"
        ;;
esac

