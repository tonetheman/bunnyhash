#!/usr/bin/python2

import md5

s = "abc"
count = 0
i = 0
final_res = ""
while True:
    ts = "{0}{1}".format(s,i)
    m = md5.new(ts).hexdigest()
    if m[0:5] == "00000":
        final_res = final_res + m[5]
        count = count + 1
        if count>7:
            break
    i = i + 1
print final_res
