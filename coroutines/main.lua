local co = coroutine.create(function()
    for i = 1, 10 do 
        print("co -> ", i)
        local result = coroutine.yield("yield") -- When we resume the coroutine, this call to yeild finally returns and coroutines 
                        -- continues its execution until the next yield or until its end.
        print("result -> ", result)
    end
end)

-- Note that, 'resume' runs in protected mode, like pcall.
print( coroutine.resume(co) )
print( coroutine.resume(co, "yinchao calling this") )
print( coroutine.resume(co) )
