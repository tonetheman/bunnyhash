package main

import (
	"crypto/md5"
	"fmt"
	"unsafe"
)

func checkone(s string) bool {
	bts := []byte(s)
	h := md5.New()
	h.Write(bts)
	digest := h.Sum(nil)
	if digest[0] == 0 && digest[1] == 0 && digest[2] < 16 {
		fmt.Printf("%x", digest[2])
		return true
	}
	return false
}

func part1() {
	s := "abc"
	count := 0
	i := 0
	for count < 8 {
		// create a string
		ts := fmt.Sprintf("%s%d", s, i)

		// THIS IS NOT A CAST
		// it reallocs a copy of the bytes from ts
		bts := []byte(ts)

		h := md5.New()
		h.Write(bts)
		digest := h.Sum(nil)
		if digest[0] == 0 && digest[1] == 0 && digest[2] < 16 {
			fmt.Printf("%x", digest[2])
			count++
		}
		i++
	}
	fmt.Println()
}

// vain attempt to make go more like
// c version
func part1a() {
	s := "abc"
	count := 0
	i := 0

	// declare buffer that can be used over and over
	// in loop below
	var bytebuffer = make([]byte, 32, 32)

	for count < 8 {
		// create a string
		ts := fmt.Sprintf("%s%d", s, i)

		// copy the string bytes into a byte array
		// that is statically allocated
		copy(bytebuffer, ts)

		h := md5.New()

		// only use the part of the bytearray we need here
		// need to get the string len
		// still worried here that the slice is copying?
		h.Write(bytebuffer[0:len(ts)])

		digest := h.Sum(nil)
		if digest[0] == 0 && digest[1] == 0 && digest[2] < 16 {
			fmt.Printf("%x", digest[2])
			count++
		}
		i++
	}
	fmt.Println()
}

func testing() {
	s := "this is a test"
	fmt.Println(unsafe.Pointer(&s))
	fmt.Println("%x", &s)

	/*
			I think the code below is calling this?
			https://github.com/golang/go/blob/master/src/runtime/slice.go

		also this gave me an idea
		https://github.com/golang/go/blob/master/src/runtime/string.go
	*/
	bs := []byte(s)
	fmt.Println(unsafe.Pointer(&bs))

	var bytebuffer = make([]byte, 32, 32)
	copy(bytebuffer, s)
	fmt.Println(bytebuffer)

	ts := fmt.Sprintf("%s%d", "abc", 123)
	fmt.Println("str size", len(ts))
}

func main() {
	//testing()
	//part1()
	part1a()
}
