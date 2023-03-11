#!/bin/bash


ls -1 *.pal | while read file
do 
	echo Assembling $file
	../tools/palbart -a -d -x -r $file
	if [ "$?" -ne 0  ]; then exit; fi
done

ls -1 *.rim | while read file
do
	echo Converting $file to .eep
	../tools/tape2bin.sh < $file > $(basename $file .rim).eep 2> /dev/null
done


ls -1 *.BN | while read file
do
	echo Converting $file to .eep
	../tools/tape2bin.sh < $file > $(basename $file .BN).eep 2> /dev/null
done

ls -1 *.pt | while read file
do
	echo Converting $file to .eep
	../tools/tape2bin.sh < $file > $(basename $file .pt).eep 2> /dev/null
done
