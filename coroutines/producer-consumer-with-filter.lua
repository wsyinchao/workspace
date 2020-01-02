local function receive(prod)
    local ok, sth = coroutine.resume(prod)
    return sth
end

local function send(x)
    coroutine.yield(x)
end

local function producer()
    return coroutine.create(function()
        while true do 
            local x = math.random(1, 100)
            send(x)
        end
    end)
end

-- It can be producer and consumer at same time.
local function filter(prod)
    return coroutine.create(function()
        for i = 1, math.huge do 
            local x = receive(prod)
            local str = string.format("%5d %s", i, x)
            send(str)
        end
    end)
end

local function consumer(prod)
    for i = 1, 100 do 
        local x = receive(prod)
        print(x)
    end
end

consumer(filter(producer()))
