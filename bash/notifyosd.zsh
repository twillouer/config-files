#!/bin/zsh
# https://gist.github.com/ihashacks/4576452
# end and compare timer, notify-send if needed
function notifyosd-precmd() {
    if [ ! -z "$cmd" ]; then
        cmd_end=`date +%s`
        ((cmd_time=$cmd_end - $cmd_start))
        if [ $cmd_time -gt 10 ]; then
            notify-send -i utilities-terminal -u low "$cmd_basename completed" "\"$cmd\" took $cmd_time seconds"
        fi
    fi                                                                                                                              
    unset cmd
}

# make sure this plays nicely with any existing precmd
precmd_functions+=( notifyosd-precmd )

# get command name and start the timer
function notifyosd-preexec() {
    cmd=$1
    cmd_basename=${cmd[(ws: :)1]}
    cmd_start=`date +%s`
}

# make sure this plays nicely with any existing preexec
preexec_functions+=( notifyosd-preexec )
