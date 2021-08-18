#!/bin/bash
CTR1=0
CTR2=0
CTR3=0
CTR4=0
CTR5=0

CUR_LVL=1
PREV_LVL=1

level_decrease() {
        for i in $(seq $PREV_LVL -1 $(($CUR_LVL+1))); do
                export CTR$i=0
        done
}

while IFS= read -r line; do

        if ( echo "$line" | grep -e "^--\[.*\]" >/dev/null ); then
                CUR_LVL=1
                if (( $CUR_LVL < $PREV_LVL )); then
                        level_decrease
                fi
                PREV_LVL=1
                CTR1=$(($CTR1 + 1))
                echo "$line" | sed "s/^--\[.*\]/--[$CTR1]/"
        elif ( echo "$line" | grep -e "^----\[.*\]" >/dev/null ); then
                CUR_LVL=2
                if (( $CUR_LVL < $PREV_LVL )); then
                        level_decrease
                fi
                PREV_LVL=2
                CTR2=$(($CTR2 + 1))
                echo "$line" | sed "s/^----\[.*\]/----[$CTR1.$CTR2]/"
        elif ( echo "$line" | grep -e "^------\[.*\]" >/dev/null ); then
                CUR_LVL=3
                if (( $CUR_LVL < $PREV_LVL )); then
                        level_decrease
                fi
                PREV_LVL=3
                CTR3=$(($CTR3 + 1))
                echo "$line" | sed "s/^------\[.*\]/------[$CTR1.$CTR2.$CTR3]/"
        elif ( echo "$line" | grep -e "^--------\[.*\]" >/dev/null ); then
                CUR_LVL=4
                if (( $CUR_LVL < $PREV_LVL )); then
                        level_decrease
                fi
                PREV_LVL=4
                CTR4=$(($CTR4 + 1))
                echo "$line" | sed "s/^--------\[.*\]/--------[$CTR1.$CTR2.$CTR3.$CTR4]/"
        elif ( echo "$line" | grep -e "^----------\[.*\]" >/dev/null ); then
                CUR_LVL=5
                if (( $CUR_LVL < $PREV_LVL )); then
                        level_decrease
                fi
                PREV_LVL=5
                CTR5=$(($CTR5 + 1))
                echo "$line" | sed "s/^----------\[.*\]/----------[$CTR1.$CTR2.$CTR3.$CTR4.$CTR5]/"
        else
                echo "$line"
        fi

done < $1
