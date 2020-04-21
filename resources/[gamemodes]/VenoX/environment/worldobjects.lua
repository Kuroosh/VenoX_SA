-- Mechanikerbase -- 

removeWorldModel ( 673, 8.8485546, -2404.1484, -179.97656, 34.36719 )
removeWorldModel ( 705, 27.506569, -2402.5078, -164.90625, 34.35938 )
removeWorldModel ( 708, 25.636084, -2394.7187, -138.28906, 34.63281 )
removeWorldModel ( 708, 25.636084, -2405.2109, -108.72656, 34.63281 )
removeWorldModel ( 708, 25.636084, -2386.6719, -85.64844, 34.63281 )
removeWorldModel ( 669, 12.05397, -2398.8047, -83.65625, 34.61719 )
removeWorldModel ( 10411, 72.561302, -2396.5937, -144.44531, 34.3125 )
removeWorldModel ( 10554, 72.561302, -2396.5937, -144.44531, 34.3125 )
removeWorldModel ( 10394, 34.132038, -2336.9297, -105.28906, 37 )
removeWorldModel ( 10553, 34.132038, -2336.9297, -105.28906, 37 )

-----------------------------------------------------

-- Baseballstadion-Zäune --

removeWorldModel ( 7418, 200, 1345, 2143.5, 17.7, 0 )

-- Drogenlabor --

local containerkartbahn = createObject ( 3073, -2093.8999, -209.7, 35.7, 0, 0, 180 )
setElementDimension ( containerkartbahn, 14 )
local muellcontainerdrogenlabor = createObject ( 1365, -2134.8, -278.10001, 35.5, 0, 0, 0 )
setElementDimension ( muellcontainerdrogenlabor, 14 )
local muellcontainerkartbahn = createObject ( 1365, -2092.2, -278.79999, 35.4, 0, 0, 2 )
setElementDimension ( muellcontainerkartbahn, 14 )
--[[local drogenlaborgeb = createObject ( 11012, -2166.3, -236.5, 40.8, 0, 0, 0 )
local drogenlaborint = createObject ( 11085, -2163.8999, -237.60001, 41.3, 0, 0, 0 )
removeWorldModel ( 11012, 50, -2166.8671875, -236.5078125, 40.8671875 )
removeWorldModel ( 11270, 50, -2166.8671875, -236.5078125, 40.8671875 )
removeWorldModel ( 11088, 50, -2166.8671875, -236.5078125, 40.8671875 )
removeWorldModel ( 11282, 50, -2166.8671875, -236.5078125, 40.8671875 )]]

-- Raffinerie Zäune --
local raffizaun = {
	[1] = createObject ( 7191, 288.10000610352, 1443.8000488281, 12.10000038147 ),
	[2] = createObject ( 7191, 287.599609375, 1462.900390625, 12.10000038147 ),
	[3] = createObject ( 7191, 288.70001220703, 1358.8000488281, 12 ),
	[4] = createObject ( 7191, 288.70001220703, 1378.0999755859, 12 ),
	[5] = createObject ( 7017, 250.89999389648, 1485, 10.10000038147, 0, 0, 179.99450683594 ),
	[6] = createObject ( 7017, 211.5, 1485, 10.10000038147, 0, 0, 179.99450683594 ),
	[7] = createObject ( 7017, 147.099609375, 1485, 10.10000038147, 0, 0, 179.99450683594 ),
	[8] = createObject ( 7017, 110.59999847412, 1448.1999511719, 10.109999656677, 0, 0, 90.399993896484 ),
	[9] = createObject ( 7017, 111, 1372.5, 10.109999656677, 0, 0, 90.3955078125 ),
	[10] = createObject ( 7017, 111.09999847412, 1375.9000244141, 10.109999656677, 0, 0, 90.3955078125 ),
	[11] = createObject ( 7017, 148, 1335.7998046875, 10.10000038147, 0, 0, 179.99450683594 ),
	[12] = createObject ( 7017, 219.5, 1335.8000488281, 10.109999656677, 0, 0, 180 ),
	[13] = createObject ( 7017, 251.89999389648, 1335.8000488281, 10.109999656677, 0, 0, 179.99450683594 )
}
for k, v in pairs ( raffizaun ) do
	setElementAlpha ( v, 0 )
	setElementDimension ( v, 14 )
end

-----------------------------------------------------

-- Gegenüber Burgershot (GW Gebiet) --

removeWorldModel ( 10394, 34.132038, -2336.9297, -105.28906, 37)

-----------------------------------------------------

-- Atzenbase --

removeWorldModel ( 11440, 12.740976, -1321.2109, 2503.3438, 85.46094 )
removeWorldModel ( 11444, 7.1118073, -1325.6719, 2527.7031, 86.125 )
removeWorldModel ( 11446, 6.6559663, -1334.3828, 2524.6016, 86.16406 )
removeWorldModel ( 11442, 10.151631, -1314.8359, 2526.4688, 86.39844 )
removeWorldModel ( 11457, 12.740932, -1303.7734, 2550.2344, 86.22656 )
removeWorldModel ( 11458, 8.6534834, -1316.8516, 2542.6719, 86.82813 )
removeWorldModel ( 11443, 8.6534834, -1301.7187, 2527.4922, 86.61719 )
removeWorldModel ( 11441, 6.6641035, -1310.7734, 2514.0078, 86.16406 )
removeWorldModel ( 11459, 7.1115866, -1292.7969, 2529, 86.53125 )
removeWorldModel ( 11445, 8.6534834, -1289.3672, 2513.6094, 86.61719 )
removeWorldModel ( 11447, 7.1109967, -1309.6016, 2492.4766, 86.00781 )
removeWorldModel ( 858, 4.1892939, -1299.1462, 2474.3042, 88.12889 )
removeWorldModel ( 858, 4.1892939, -1299.2062, 2474.4285, 87.73983 )
removeWorldModel ( 747, 4.8647504, -1356.6671, 2464.9883, 86.19545 )
removeWorldModel ( 904, 3.933352, -1355.9999, 2514.9341, 85.91533 )
removeWorldModel ( 904, 3.933352, -1356.0223, 2515.0063, 86.21096 )
removeWorldModel ( 904, 3.933352, -1355.995, 2515.0305, 85.93123 )
removeWorldModel ( 858, 4.1892939, -1355.7412, 2513.3625, 86.29834 )
removeWorldModel ( 747, 4.8647504, -1250.7413, 2507.8118, 87.6307 )

-----------------------------------------------------

-- Army-Base --

removeWorldModel ( 16094, 120.60289001465, 191.14063, 1870.03902, 21.47656 )
removeWorldModel ( 16671, 88.900527954102, 193.95313, 2051.79688, 20.17969 )
removeWorldModel ( 16668, 84.015480041504, 357.9375, 2049.42188, 16.84375 )
removeWorldModel ( 16669, 58.52091217041, 380.25781, 1914.96094, 17.42969 )
removeWorldModel ( 16670, 60.778125762939, 330.78906, 1813.21875, 17.82813 )
removeWorldModel ( 1411, 5.38907289505, 347.62677, 1799.81848, 19.73457 )
removeWorldModel ( 1411, 5.38907289505, 342.70169, 1796.2655, 19.86304 )
removeWorldModel ( 16096, 7.8205938339233, 120.50781, 1934.03125, 19.82813 )
removeWorldModel ( 3267, 3.8754134178162, 187.83499, 2082.11426, 23.14034 )
removeWorldModel ( 3277, 5.482813835144, 188.24219, 2081.64844, 22.40625 )
removeWorldModel ( 16095, 7.8205671310425, 279.13281, 1829.78125, 16.63281 )
removeWorldModel ( 3279, 13.529054641724, 267.0625, 1895.29688, 16.82031 )
removeWorldModel ( 3279, 13.529054641724, 262.09375, 1807.67188, 16.82031 )
removeWorldModel ( 3279, 13.529054641724, 113.38281, 1814.45313, 16.82031 )
removeWorldModel ( 3279, 13.529054641724, 103.89063, 1901.10156, 16.82031 )
removeWorldModel(966,1000,-1526.390625,481.3828125,6.1796875)
removeWorldModel(968,1000,-1526.4375,481.3828125,6.90625)

-----------------------------------------------------

-- Bahnhof --

--[[removeWorldModel ( 1226, 6.6149273, -2011.7523, 158.55151, 29.0698 )
removeWorldModel ( 673, 8.8485546, -1998.5625, 164.90625, 26.80469 )
removeWorldModel ( 11247, 19.916306, -1998.4687, 158.39063, 27.28125 )
removeWorldModel ( 1226, 6.6149273, -2011.6932, 158.23962, 28.86283 )
removeWorldModel ( 1226, 6.6149273, -2011.6552, 158.32428, 27.36808 )
removeWorldModel ( 1226, 6.6149273, -2011.6932, 158.34645, 31.19457 )
removeWorldModel ( 1264, 2.5976815, -1981.4561, 148.70731, 27.10619 )
removeWorldModel ( 672, 11.469559, -1965.1172, 210.85156, 26.33594 )
removeWorldModel ( 672, 11.469559, -1965.1172, 210.85156, 26.33594 )
removeWorldModel ( 1264, 2.5976815, -1977.2092, 162.19896, 27.11496 )
removeWorldModel ( 1235, 2.674829, -1962.5587, 162.08424, 27.23386 )
removeWorldModel ( 1235, 2.674829, -1978.1202, 162.0175, 27.22281 )
removeWorldModel ( 1235, 2.674829, -1978.421, 151.2993, 27.23083 )
removeWorldModel ( 1235, 2.674829, -1978.4104, 125.29148, 27.26061 )
removeWorldModel ( 1235, 2.674829, -1962.3087, 122.0412, 27.26805 )
removeWorldModel ( 1235, 2.674829, -1962.3087, 132.44698, 27.05766 )
removeWorldModel ( 1235, 2.674829, -1962.193, 143.2377, 27.35064 )
removeWorldModel ( 1289, 2.6594846, -1978.4403, 134.24182, 27.47285 )]]

-----------------------------------------------------

-- Fahrschule --

removeWorldModel ( 11014, 31.869303, -2076.4375, -107.92969, 36.96875 )
removeWorldModel ( 11372, 31.869303, -2076.4375, -107.92969, 36.96875 )

-----------------------------------------------------

-- AoD Base --

removeWorldModel ( 1333, 5, -2216.6157226563, -2338.07, 30.625 )  -- Mülltonnen rote

-----------------------------------------------------

-- Andere Dimensionen --

local grasinotherdims
local baustellenebenburgershot
local copydrog
local copydrogint
local fahrschule1otherdims
local fahrschule2otherdims

for i = 1, 50 do
	grasinotherdims = createObject ( 10411, -2396.5937, -144.44531, 34.3125 )
	baustellenebenburgershot = createObject ( 10394, -2336.9297, -105.28906, 37 )
	fahrschule1otherdims = createObject ( 11014, -2076.4375, -107.92969, 36.96875 )
	fahrschule2otherdims = createObject ( 11372, -2076.4375, -107.92969, 36.96875 )
	setElementDimension ( grasinotherdims, i )
	setElementDimension ( baustellenebenburgershot, i )
	setElementDimension ( fahrschule1otherdims, i )
	setElementDimension ( fahrschule2otherdims, i )
end


