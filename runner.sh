#!/bin/bash

# FULL-AUTOMATIC MODIFIED SCRIPT EXECUTER FOR FAIL-ORIENTED SCRIPTERS AND GIFTED KIDS
#
# Run this in a seperate terminal to automate running your
# script/code/etc. whenever you save it
#
# ./runner.sh <command-to-run> <file_to_track> <arguments>
#
# 2nd arg is always expected the file to be tracked.
#
# Examples:
#       ./runner.sh python3 test.py -t=all --foo=bar
#       ./runner.sh bash script.sh
#       ./runner.sh nasm code.asm                        # nifty live assembler
#       ./runner.sh "gcc main.c && ./a.out" "main.c"     # nifty live compiler
#
# Autosave command for vim :autocmd TextChanged,TextChangedI <buffer> silent write

TRIAL=0

doit() {
        # run
        $@

        # print
        TRIAL=$(($TRIAL+1))
        COLS=$(tput cols)
        COLOR=$(tput setaf $(($TRIAL % 10 + 1)))
        NC=$(tput sgr0)

        printf "${COLOR}%0.s-${NC}" $(seq $COLS)
        printf "\n"
        printf "${COLOR}%0.s ${NC}" $(seq $(($COLS/2 - 6)))
        printf "${COLOR}TRIAL #$TRIAL END\n${NC}"
        printf "${COLOR}%0.s-${NC}" $(seq $COLS)
        printf "\n"
}

# run it in the beginning once
doit $@

# run it on file modification
while (inotifywait -q -e close_write $2 > /dev/null)
do
        doit $@
done
