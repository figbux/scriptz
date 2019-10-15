#!/bin/bash
#
# Usage: ./keytobin.sh private.pem | hd
#        ./keytobin.sh public.pub | hd
#
# (Credits: https://unix.stackexchange.com/a/284364)
sed -e '/----.* KEY----\|^[[:space:]]*$/d' $1 | base64 -d
