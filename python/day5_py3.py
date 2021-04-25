#!/usr/bin/python3

import hashlib

s = "abc"
for i in range(4000000):
    # ts = s + str(i)
    ts = "{0}{1}".format(s,i)
    m = hashlib.md5(ts.encode()).hexdigest()
    if m[0:5] == "00000":
        print(ts, m)
