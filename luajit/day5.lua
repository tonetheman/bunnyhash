
local ffi = require("ffi")

ffi.cdef([[
unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md);
]])
local crypto = ffi.load("crypto")
