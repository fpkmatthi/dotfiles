#!/bin/bash

curl -sL "https://api.elearning.hogent.be/v1/icalendars?token=XDpvFWwQN2PqTZEiR7nz" > icalhogent.ics

content=$(calcurse -i icalhogent.ics | egrep "FATAL|ERROR|Warning|Aborting")

# filter out duplicates
uniq $HOME/.calcurse/apts > $HOME/.calcurse/apts.tmp
mv $HOME/.calcurse/apts.tmp $HOME/.calcurse/apts

[ -n "${content}" ] && dunstify "${content}" || dunstify "Imported ical"

# TODO:
# -i -- import
# -a -- appointments for today
# -t -- todos
# -n -- next appointment
