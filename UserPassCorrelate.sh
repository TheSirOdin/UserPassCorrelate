#!/bin/bash

MINPARAMS=3
if [ $# -lt "$MINPARAMS" ]
then
  echo "This program takes $MINIPRAMS arugments: the DC hashdump filename, the cracked password filename, and 0utput filename."
  echo "Usage: `basename $0` {arg} {arg} {arg}"
  exit 0
fi  


sort -t':' -k 4 $1 >> $1_Sorted.txt
sort -t':' -k 4 $2 >> $2_Sorted.txt

join -1 4 -2 1 -t':' $1_Sorted.txt $2_Sorted.txt | awk -F':' '{print $2":"$8}' >> $3

cat $3 | awk -F':' '{print $2}' | sort | uniq -c | sort -rn | head -n 15

rm $1_Sorted.txt $2_Sorted.txt
