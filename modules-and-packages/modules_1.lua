local M = {}

local print = _G.print

_ENV = M

-- package.loaded[...] = M

-- print(type(...)) -- it's type is string.(It's wrong, It's type is not string... It similarly.)
-- print(...)
-- print('------------')

-- for k, v in pairs(package.loaded) do 
--     print(k) -- exist a string and it's name is 'modules_1'
-- end

f = function()
    print("Here is calling funtion f.")
end

return M
