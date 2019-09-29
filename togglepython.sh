#!/bin/bash

# Switches python2 <-> python3

PY="$(which python)"
PY2="$(which python2)"
PY3="$(which python3)"

if [ "$(readlink $PY)" = "$PY3" ];
then
    echo Swithing to python2...
    sudo unlink $PY
    sudo ln -s $PY2 $PY
elif [ "$(readlink $PY)" = "$PY2" ];
then
    echo Swithing to python3...
    sudo unlink $PY
    sudo ln -s $PY3 $PY
else
    echo Error switching python
fi

echo ls -l $(ls -l $(which python))
