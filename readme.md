# bunny hash in different languages

## yup bunnyhash

I was sitting around as most people do thinking about bunny hash yesterday. I figured I could not be the only one.

See here: https://adventofcode.com/2016/day/5

I think that this problem is really the pre-cursor to bunny hash.., so maybe I was sitting around thinking about the things that lead to bunny hash... :shrug:

I implemented the example from day5 (part1) in a couple of languages and was surprised that golang was slow.

## requirements

For the C version you need to make sure you have openssl-dev installed.

## other notes


### C
The king of speed

### java
Nothing interesting here.

### golang
I do not like my implementation in go. Not sure why.

### nim
When you compile the nim version if you just take the defaults (aka just run make) you will get a slow version. If you run ```make prod``` it is very fast.

### python
Need to add a version of python that uses ctypes and calls into openssl shared lib. It should be faster?
