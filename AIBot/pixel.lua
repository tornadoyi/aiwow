
function str2pixel(s)
    bytes = {}
    for i=1, #s do
        c = string.sub(s, i, i)
        c = string.byte(c)
        table.insert(bytes, c)
    end
    return bytes
end

function int2pixel(d)
    mask = 0x000000ff
    bytes = {}
    for i=1, 4 do
        table.insert(d & mask)
        d = d >> 8
    end
    return bytes
end

function padding(bytes)
    pads = #bytes % 3
    for i=1, pads do table.insert(bytes, 0) end
    return bytes
end
