#!/usr/bin/python2

import md5

s = "abc"
for i in range(4000000):
    # ts = s + str(i)
    ts = "{0}{1}".format(s,i)
    m = md5.new(ts).hexdigest()
    if m[0:5] == "00000":
        print ts, m
