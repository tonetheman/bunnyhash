
import ctypes

tt = ctypes.CDLL("./tonytest.so")

# tt.testme.argtypes = [ctypes.c_char_p, ctypes.c_int, ctypes.c_char_p]

input_buffer = ctypes.create_string_buffer("abc123")
output_buffer = ctypes.create_string_buffer(16)
print tt.testme(input_buffer,16,output_buffer)
print "buffer 0 is", ord(output_buffer[0])
