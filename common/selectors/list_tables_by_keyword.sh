#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: `basename "$0"` <dataset> <keyword>"
    exit 1
fi

bq ls -n 9999 $1 | grep $2 | awk '{print $1}'