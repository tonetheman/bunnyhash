
import md5

let pre = "abc"
const COUNT : int =4000000
var i : int = 0
while true:
  let md = toMD5("abc" & $(i))
  if md[0] == 0 and md[1] == 0 and md[2]<16:
    echo(md)
  i = i + 1
  if i>COUNT:
    break
