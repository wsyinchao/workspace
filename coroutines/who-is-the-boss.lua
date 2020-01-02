local io = io
local coroutine = coroutine
local math = math
local string = string
local print = print

_ENV = {}

function receive(producer)
    local ok, sth = coroutine.resume(producer)
    if ok then 
        return  sth
    end
end

function send(x)
    coroutine.yield(x)
end

function producer()
    while true do 
        local x = math.random(1, 100)
        send(x)
    end
end

local prod = coroutine.create(producer)

function consumer()
    while true do 
        local x = receive(prod)
        print(x)
    end
end

local consum = coroutine.create(consumer)
coroutine.resume(consum)

-- function producer()
--     return coroutine.create(function ()
--         while true do 
--             local x = io.read("a")
--             send(x)
--         end
--     end)
-- end

-- function filter(prod)
--     return coroutine.create(function()
--         for line = 1, math.huge do 
--             local x = receive(prod)
--             x = string.format("%5d %s", line, x)
--             send(x)
--         end
--     end)
-- end

-- function consumer(prod)
--     while true do 
--         local x = receive(prod)
--         io.write(x, '\n')
--     end
-- end

-- consumer(filter(producer()))
