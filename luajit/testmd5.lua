
local ffi = require("ffi")

ffi.cdef[[
unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md);
]]

local crypto = ffi.load("crypto")

function c_pb(buffer)
	-- print a c buffer
	-- really it makes a lua string
	-- from a fixed 16 byte c-buffer from ffi
	local ts = ""
	for i=0,15 do
			ts = ts .. string.format("%02x", buffer[i]) .. " "
	end
	return ts
end

local input_buffer = "abc" 
local output_buffer = ffi.new("unsigned char[16]")

crypto.MD5(input_buffer, 3, output_buffer)

print(c_pb(output_buffer))

expected = [[
>>> import md5
>>> m =md5.new()
>>> m.update("abc")
>>> m.hexdigest()
'900150983cd24fb0d6963f7d28e17f72'
]]


