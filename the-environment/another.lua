-- To restrict assignment to new global variable only inside functions, allowing 
-- free assignments in the outer level of a chunk.
setmetatable(_G, {
    __index = function(_, n)
        error("attempt to read undeclared varicable " .. n, 2)
    end,
    __newindex = function(t, n, v)
        local w = debug.getinfo(2, "S").what
        print(w) -- main
        if w ~= "main" and w ~= "C" then
            error("attempt to wirte to undelared variable " .. n, 1)
        end
        rawset(t, n, v)
    end
})
