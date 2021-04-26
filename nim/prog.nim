
import md5
import strutils

var i : int = 0
var count : int = 0
var res = ""
while true:
  let md = toMD5("abc" & $(i))
  if md[0] == 0 and md[1] == 0 and md[2]<16:
    res = res & toHex(md[2])
    count = count + 1
  i = i + 1
  if count>7:
    break
echo(res)
