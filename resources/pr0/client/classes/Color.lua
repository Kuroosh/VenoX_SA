Color = {
    White = {255, 255, 255, 255},
    Black = {  0,   0,   0, 255},
    Red   = {255,   0,   0, 255},
    Clan  = {  0, 105, 145, 255}
}

for name, color in pairs(Color) do
    Color[name] = tocolor(unpack(color))
end