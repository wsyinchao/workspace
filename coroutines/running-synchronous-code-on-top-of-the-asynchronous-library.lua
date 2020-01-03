local lib = require "An-ugly-asynchronous-iolib"

local function run(code)
    local co = coroutine.wrap(function()
        code()
        lib.stop()
    end)
    co()
    lib.runloop()
end

local function putline(stream, line)
    local co = coroutine.running()
    local callback = function(l)
        coroutine.resume(co, l)
    end
    lib.writeline(stream, line, callback)
    local line = coroutine.yield()
    return line 
end

local function getline(stream, line)
    local co = coroutine.running()
    local callback = function(l)
        coroutine.resume(co, l)
    end
    lib.readline(stream, callback)
    local line = coroutine.yield()
    return line 
end

run(function()
    local t = {}
    local inp = io.input("reversing-a-file-in-event-driven-fashion.lua")
    local out = io.output("output.txt")

    while true do 
        local line = getline(inp)
        if not line then break end
        t[#t + 1] = line
    end

    for i = #t, 1, -1 do 
        putline(out, t[i] .. '\n')
    end
end)
