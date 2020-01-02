local function printResult(a)
    local str = table.concat(a, ' ')
    print(str)
end

-- traverse all permutations of a given array
local function permgen(a, n)
    n = n or #a 
    if n <= 1 then 
        coroutine.yield(a)
        return 
    end

    for i = 1, n do 
        a[i], a[n] = a[n], a[i] -- put each array element in the last position

        permgen(a, n - 1) -- hand it's subarray recursively.

        a[i], a[n] = a[n], a[i] -- restore i-th element for hand next i-th element.
    end
end

local function permutations(a)
    local co = coroutine.create(function() permgen(a) end)
    return function() -- returns a factory that generator permutation of a array.
        local ok, res = coroutine.resume(co)
        return res
    end
end

for k in permutations{'a', 'b', 'c'} do 
    printResult(k)
end