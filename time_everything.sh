#!/bin/bash

echo "checking c..."
cd c
rm -f times.txt
make clean
make
for i in {0..10}
do
	echo "running loop $i"
	{ time  ./cday5 ; } &>> times.txt
done
cd ..

echo "checking golang..."
cd golang
rm -f times.txt
make clean
make
for i in {0..10}
do
	echo "running loop $i"
	{ time ./day5 ; } &>>times.txt
done
cd ..

echo "checking java..."
cd java
rm -f times.txt
make clean
make
for i in {0..10}
do
	echo "running loop $i"
	{ time java Bh ; } &>>times.txt
done
cd ..

echo "checking nim..."
cd nim 
rm -f times.txt
make clean
make prod
for i in {0..10}
do
	echo "running loop $i"
	{ time ./prog ; } &>>times.txt
done
cd ..

# this script assumes there are 10 runs in each text file
echo "java average time"
grep real java/times.txt | awk '{sum += substr($2,3,length($2)-1)} END {print sum/10.0}'

echo "go average time"
grep real golang/times.txt | awk '{sum += substr($2,3,length($2)-1)} END {print sum/10.0}'

echo "c average time"
grep real c/times.txt | awk '{sum += substr($2,3,length($2)-1)} END {print sum/10.0}'

echo "nim (release)  average time"
grep real nim/times.txt | awk '{sum += substr($2,3,length($2)-1)} END {print sum/10.0}'

