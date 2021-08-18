#!/bin/bash

grep -e "^-.-*\[" $1 | sed "s/--/    /g" | sed "s/\[//g" | sed "s/\]/ /g"
