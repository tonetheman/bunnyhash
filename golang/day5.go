package main

import (
	"bytes"
	"crypto/md5"
	"fmt"
)

// this one seems more like go would be written
// if I were in fact a good programmer
func part1() {
	s := "abc"
	count := 0
	i := 0
	h := md5.New()
	buffer := bytes.NewBuffer(make([]byte, 64))

	for count < 8 {
		// create a string
		//ts := fmt.Sprintf("%s%d", s, i)
		buffer.Reset()
		fmt.Fprintf(buffer, "%s%d", s, i)

		// THIS IS NOT A CAST
		// it reallocs a copy of the bytes from ts
		// i think
		//bts := []byte(ts)

		h.Reset()
		h.Write(buffer.Bytes())
		digest := h.Sum(nil)
		if digest[0] == 0 && digest[1] == 0 && digest[2] < 16 {
			fmt.Printf("%x", digest[2])
			count++
		}
		i++
	}
	fmt.Println()
}

func main() {
	part1()
}
