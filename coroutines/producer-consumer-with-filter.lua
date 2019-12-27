local function receive(prod)
    local ok, sth = coroutine.resume(prod)
    if ok then 
        return  sth
    else 
        io.write("resume producer error")
    end
end

local function send(x)
    coroutine.yield(x)
end

local function producer()
    return coroutine.create(function()
        local x = math.random(1, 100)
        send(x)
    end)
end

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
    while true do 
        local x = receive(prod)
        io.write(x, "\n")
    end
end

consumer(filter(producer()))
