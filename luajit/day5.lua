
local ffi = require("ffi")

ffi.cdef([[
unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md);
]])
local crypto = ffi.load("crypto")

-- return a hex string
-- repr for the passed buffer
function c_repr(buffer)
	local ts = ""
	for i=0,15 do
			ts = ts .. string.format("%02x", buffer[i]) .. " "
	end
	return ts
end

function fastmd5(input_string)
	-- make a new allocation for a buffer
	local output_buffer = ffi.new("unsigned char[16]")
    crypto.MD5(input_string, #input_string, output_buffer)
	return output_buffer
end

-- only alloc the buffer once
local output_buffer2 = ffi.new("unsigned char[16]")

-- use it here
function fastermd5(input_string)
	ffi.fill(output_buffer2,16)
	crypto.MD5(input_string, #input_string, output_buffer2)
	return output_buffer2
end

function findall()
	local count = 0
	local i = 0
	local finalresult = {}

	while true do
		local input_string = string.format("abc%d",i)


		-- version that allocates here
		-- local res = fastmd5(input_string)

		-- no allocation version here
		local res = fastermd5(input_string)

		if res[0]==0 and res[1]==0 and res[2]<16 then
			finalresult[count] = res[2]
			count = count + 1
			if count>7 then
				break
			end
		end
		i=i+1
	end

	local ts = ""
	for i=0,count-1 do
		ts = ts .. " " .. string.format("%02x",finalresult[i])
	end
	print(ts)
end


findall()