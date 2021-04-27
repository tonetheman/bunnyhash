#!/bin/bash

COUNT=5

echo "checking c..."
cd c
rm -f times.txt
make
for i in {0.."$COUNT"}
do
	{ time  ./cday5 ; } &>> times.txt
done
cd ..

echo "checking java..."
cd java
rm -f times.txt
javac Bh.java
for i in {0.."$COUNT"}
do
	{ time java Bh ; } &>> times.txt
done
cd ..

echo "checking golang..."
cd golang
rm -f times.txt
for i in {0.."$COUNT"}
do
	{ time go run day5.go ; } &>> times.txt
done
cd ..

echo "checking python3..."
cd python
rm -f times.txt
for i in {0.."$COUNT"}
do
	{ time python3 day5_py3.py ; } &>> times.txt
done


