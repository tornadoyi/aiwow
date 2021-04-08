function class(name, super)
    local clazz = { __cname = name, super = super }
    if super then
        setmetatable(clazz, { __index = super })
    end
    clazz.new = function(...)
        local instance = {}
        setmetatable(instance, { __index = clazz })
        if clazz.ctor then
            clazz.ctor(instance, ...)
        end
        return instance
    end
    return clazz
end

Zerg.class = class
