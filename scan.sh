#!/bin/bash

first=1
second=1
third=1
four=1


four_max=0
third_max=0
second_max=0
first_max=0


for i in {1..}; do
actual_Ip="$first.$second.$third.$four"
echo
echo ========================================
echo \|
echo \|  SCANNING $actual_Ip IN PROGRESS...
echo \|
echo ========================================
echo

if [ $first -eq 255 -a $second -eq 255 -a $third -eq 255 -a $four -eq 254 ]
then
echo EVERY IP HAS BEEN SCAN
break
fi

if [ $four -eq 254 ]
then
four_max=1
four=0
let "third=third+1"
else
four_max=0
fi

if [ $third -eq 256 ]
then
third_max=1
third=0
let "second=second+1"
else
third_max=0
fi

if [ $second -eq 256 ]
then
second_max=1
second=0
let "first=first+1"
else
second_max=0
fi

#need to add grep function for specific open ports
if [ $four_max -eq 0 ]
then
sudo nmap -Pn -sS --append-output -oG /home/Lucas/ScanNmap.txt --open $actual_Ip
let "four=four+1"
fi

done
