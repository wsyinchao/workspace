-- The environment...

-- require "another"

-- for n in pairs(_G) do 
--     print(n)
-- end

-- local function declare(key, value)
--     rawset(_G, key, value or false)
-- end
-- declare("yinchao", "zachary")
-- _G.yinchao = 1
-- print(_G.yinchao)

--[[
    _ENV and _G refers to the same table?
]]

a = {} -- It will be translate to _ENV.a by complier.
local a = 13
print(a) -- 13

print(_ENV.a) -- 12
print(_G.a) -- 12 -- why this statement will print 12 this result? I have not understanded it.

