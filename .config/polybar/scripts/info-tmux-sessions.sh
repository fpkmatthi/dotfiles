#!/bin/dash

sessionlist=$(tmux ls)

get_sessions() {
  if [ "${sessionlist}" ]; then
    nr_of_sessions=$(echo "${sessionlist}" | wc -l)
    printf "tmux: ${nr_of_sessions} \n"
  else
    echo "tmux: none\n"
  fi
}

get_session_list() {
  if [ "${sessionlist}" ]; then
    first=$(echo "${sessionlist}" | head -n 1 | cut -d " " -f 1-3,10 | sed 's/^\(.*\): \([0-9]*\) windows [(attached)]*/ \1[\2  (a)]/g')
    rest=$(echo "${sessionlist}" | tail -n +2 | cut -d " " -f 1-3,10 | sed 's/^\(.*\): \([0-9]*\) windows [(attached)]*/ \1[\2  (a)]/g')

    printf "tmux: ${first}"
    echo "$rest" | while read -r line; do
      printf " | $line"
    done
    printf "\n"
  else
    echo "tmux: none\n"
  fi
}

case $1 in
  -s)
    get_sessions
    ;;
  -n)
    get_session_list
    ;;
  *)
    echo 'Unrecognised command'
    ;;
esac
