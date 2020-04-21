createBlip ( 2337.1750488281, 2459.0568847656, 13.948640823364, 30, 2, 0, 0, 0, 255, 0, 200 )

local size = 1
-- Strasse -> Interior
local x1, y1, z1, x2, y2, z2, int1, int2, rot
x1, y1, z1 = 2337.1750488281, 2459.0568847656, 13.948640823364
x2, y2, z2 = 288.63903808594, 168.15808105469, 1006.821105957
int1, int2 = 0, 3
rot = 0
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 1, 6, 8 )

-- Interior -> Strasse
local x1, y1, z1, x2, y2, z2, int1, int2, rot
x1, y1, z1 = 288.72134399414, 167.14605712891, 1006.146484375
x2, y2, z2 = 2337.1799316406, 2457.6237792969, 14.617975234985
int1, int2 = 3, 0
rot = 180
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 1, 6, 8 )

-- Interior -> Garage
local x1, y1, z1, x2, y2, z2, int1, int2, rot
x1, y1, z1 = 238.61047363281, 139.08728027344, 1002.01171875
x2, y2, z2 = 2268.0358886719, 2447.0505371094, 3.1804757118225
int1, int2 = 3, 0
rot = 180
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 1, 6, 8 )

-- Garage -> Interior
local x1, y1, z1, x2, y2, z2, int1, int2, rot
x1, y1, z1 = 2268.056640625, 2448.818359375, 2.5142693519592
x2, y2, z2 = 238.65237426758, 140.17637634277, 1002.672668457
int1, int2 = 0, 3
rot = 0
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 1, 6, 8 )