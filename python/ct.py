

import ctypes

ssl = ctypes.CDLL("libssl.so")

# call into the shared object
"""
unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md);
"""

ssl.MD5.argtypes = [ctypes.c_char_p, ctypes.c_size_t, ctypes.c_char_p]
output_buffer = ctypes.create_string_buffer(16)
input_buffer = ctypes.create_string_buffer("abc123")
# call it
# res = ssl.MD5(input_buffer,6,output_buffer)
# print res
# for c in output_buffer:
#    print "{:02x}".format(ord(c)),

s = "abc"
count = 0
i = 0
final_res = ""
output_buffer = ctypes.create_string_buffer(16)
input_buffer = ctypes.create_string_buffer(16)
while True:
    ts = "{0}{1}".format(s,i)
    
    for i in range(16):
        input_buffer[i] = '\0'
        output_buffer[i] = '\0'

    for i in range(len(ts)):
        input_buffer[i] = ts[i]
    
    res = ssl.MD5(input_buffer,len(ts),output_buffer)
    print(res,output_buffer[0],output_buffer[1], output_buffer[2])
    if output_buffer[0]==0 and output_buffer[1]==0 and output_buffer[2]<16:
        final_res = final_res + output_buffer[5]
        count = count + 1
        if count>7:
            break
    i = i + 1
print final_res

