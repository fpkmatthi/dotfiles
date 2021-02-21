#!/bin/sh

rofi_command="rofi -theme themes/i3layoutmenu.rasi"

# Icons {{{
monotile="/﬿"
tabbed="ﬓ"
split=""
# }}}

chosen="$(echo -e "$monotile\n$tabbed\n$split" | $rofi_command -dmenu -selected-row 1)"

# TODO: switch to bspwm
case $chosen in
    $monotile)
        # bspwm layout monotile
        bspc desktop -l next
        ;;
    $tabbed)
        # bspwm layout tabbed
        ;;
    $split)
        # bspwm layout toggle split
        ;;
esac

