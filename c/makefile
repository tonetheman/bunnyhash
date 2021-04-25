
cday5 : day5.c
	gcc -o cday5 day5.c -lssl -lcrypto

bhash.so : bh.go
	go build -buildmode=c-shared -o bhash.so bh.go


clean :
	rm -f cday5
	rm -f cppday5
	rm -f bhash.so
	rm -f bhash.h
