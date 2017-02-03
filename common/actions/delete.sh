#!/bin/bash

while read -r; do 

echo "Deleting ${1}${REPLY}"; 
bq --nosync rm -f ${1}${REPLY}

done