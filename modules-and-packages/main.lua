local m1 = require "modules_1"
local add = require "self-math.add.add"
local mylib = require "clib.c"
local mylib2 = require "clib.s"

print(add.add(1, 2))
print(mylib.add(1, 3))
print(mylib2.sub(1, 3))

m1.f()
