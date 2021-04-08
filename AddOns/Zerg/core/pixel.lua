
Zerg.pixel = {
    str2pixel = function(s)
        bytes = {}
        for i=1, #s do
            c = string.sub(s, i, i)
            c = string.byte(c)
            table.insert(bytes, c)
        end
        return bytes
    end,

    int2pixel = function (d)
        mask = 0x000000ff
        bytes = {}
        for i=1, 4 do
            table.insert(bit.band(b, mask))
            d = bit.rshift(d, 8)
        end
        return bytes
    end,

    padding = function (bytes)
        pads = #bytes % 3
        for i=1, pads do table.insert(bytes, 0) end
        return bytes
    end
}