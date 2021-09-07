#!/bin/dash

insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=A3BE8C
bshlcolor=EBCB8B
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=D08770
ringvercolor=D08770
ringwrongcolor=D08770
verifcolor=D08770
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
font="FireCode Nerd Font Mono"
locktext='Type password to unlock...'
wallpaper_cmd='feh --bg-fill --no-fehbg'
time_format='%H:%M:%S'

i3lock \
-c 00000000 \
-t -i "~/.config/deathstar-landscape.png" \
--time-pos='x+110:h-70' \
--date-pos='x+43:h-45' \
--clock --date-align 1 --date-str "$locktext" --time-str "$time_format" \
--inside-color=$insidecolor --ring-color=$ringcolor --line-uses-inside \
--keyhl-color=$keyhlcolor --bshl-color=$bshlcolor --separator-color=$separatorcolor \
--insidever-color=$insidevercolor --insidewrong-color=$insidewrongcolor \
--ringver-color=$ringvercolor --ringwrong-color=$ringwrongcolor --ind-pos='x+280:h-70' \
--radius=20 --ring-width=4 --verif-text='' --wrong-text='' \
--verif-color="$verifcolor" --time-color="$timecolor" --date-color="$datecolor" \
--time-font="$font" --date-font="$font" --layout-font="$font" --verif-font="$font" --wrong-font="$font" \
--noinput-text='' --force-clock --pass-media-keys "$lockargs"

# i3lock \
# --insidevercolor=$C   \
# --ringvercolor=$V     \
# \
# --insidewrongcolor=$C \
# --ringwrongcolor=$W   \
# \
# --insidecolor=$B      \
# --ringcolor=$D        \
# --linecolor=$B        \
# --separatorcolor=$D   \
# \
# --verifcolor=$T        \
# --wrongcolor=$T        \
# --timecolor=$T        \
# --datecolor=$T        \
# --layoutcolor=$T      \
# --keyhlcolor=$W       \
# --bshlcolor=$W        \
# \
# --screen 1            \
# --blur 5              \
# --clock               \
# --indicator           \
# --timestr="%H:%M:%S"  \
# --datestr="%A, %m %Y" \
# --keylayout 2         \
# \
# --veriftext="Hmmmm..." \
# --wrongtext="Nope!"   \
# # --textsize=20
# # --modsize=10
# # --timefont=comic-sans
# # --datefont=monofur
# # etc
