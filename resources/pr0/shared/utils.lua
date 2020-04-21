function table.find(tbl, value)
    for k, v in pairs(tbl) do 
        if v == value then
            return k
        end
    end
    return false
end