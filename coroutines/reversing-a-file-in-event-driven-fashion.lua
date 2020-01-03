local lib = require "An-ugly-asynchronous-iolib"

local t = {}
local inp = io.input("An-ugly-asynchronous-iolib.lua") -- when called without arguments, It returns the current 
                        -- default input file.
local out = io.output("output.txt") -- similar to io.input
local i

-- write-line handler
local function putline()
    i = i - 1
    if i == 0 then 
        lib.stop()
    else 
        lib.writeline(out, t[i] .. '\n', putline)
    end
end

-- read-line handler
local function getline(line)
    if line then 
        t[#t + 1] = line
        lib.readline(inp, getline)
    else 
        i = #t + 1
        putline()
    end
end


lib.readline(inp, getline)
lib.runloop()
