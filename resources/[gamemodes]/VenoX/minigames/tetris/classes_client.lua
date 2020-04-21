class = {}
classIDs = {
 [1]="box",
 [2]="bar",
 [3]="j",
 [4]="l",
 [5]="z1",
 [6]="z2",
 [7]="t"
 }
 
models = {}
 models[1]="images/tetris/blue.bmp"
 models[2]="images/tetris/green.bmp"
 models[3]="images/tetris/orange.bmp"
 models[4]="images/tetris/red.bmp"
 models[5]="images/tetris/yellow.bmp"

--[[
Box
[_][x][x][_]
[_][x][x][_]
[_][_][_][_]
[_][_][_][_]
]]
class["box"] = {}
for i = 1, 4 do
	class["box"][i] = {}
	class["box"][i]["x1"] = 2
	class["box"][i]["x2"] = 3
	class["box"][i]["x3"] = 2
	class["box"][i]["x4"] = 3
	class["box"][i]["y1"] = 1
	class["box"][i]["y2"] = 1
	class["box"][i]["y3"] = 2
	class["box"][i]["y4"] = 2
end

--[[
Bar1/2
[_][_][x][_]
[_][_][x][_]
[_][_][x][_]
[_][_][x][_]

Bar2/4
[_][_][_][_]
[_][_][_][_]
[x][x][x][x]
[_][_][_][_]
]]

class["bar"] = {}

i = 1
class["bar"][i] = {}
class["bar"][i]["x1"] = 3
class["bar"][i]["x2"] = 3
class["bar"][i]["x3"] = 3
class["bar"][i]["x4"] = 3
class["bar"][i]["y1"] = 1
class["bar"][i]["y2"] = 2
class["bar"][i]["y3"] = 3
class["bar"][i]["y4"] = 4

i = 3
class["bar"][i] = {}
class["bar"][i]["x1"] = 3
class["bar"][i]["x2"] = 3
class["bar"][i]["x3"] = 3
class["bar"][i]["x4"] = 3
class["bar"][i]["y1"] = 1
class["bar"][i]["y2"] = 2
class["bar"][i]["y3"] = 3
class["bar"][i]["y4"] = 4

i = 2
class["bar"][i] = {}
class["bar"][i]["x1"] = 1
class["bar"][i]["x2"] = 2
class["bar"][i]["x3"] = 3
class["bar"][i]["x4"] = 4
class["bar"][i]["y1"] = 3
class["bar"][i]["y2"] = 3
class["bar"][i]["y3"] = 3
class["bar"][i]["y4"] = 3

i = 4
class["bar"][i] = {}
class["bar"][i]["x1"] = 1
class["bar"][i]["x2"] = 2
class["bar"][i]["x3"] = 3
class["bar"][i]["x4"] = 4
class["bar"][i]["y1"] = 3
class["bar"][i]["y2"] = 3
class["bar"][i]["y3"] = 3
class["bar"][i]["y4"] = 3

--[[
J1
[_][_][x][_]
[_][_][x][_]
[_][x][x][_]
[_][_][_][_]
J2
[_][x][_][_]
[_][x][x][x]
[_][_][_][_]
[_][_][_][_]
J3
[_][x][x][_]
[_][x][_][_]
[_][x][_][_]
[_][_][_][_]
J4
[_][x][x][x]
[_][_][_][x]
[_][_][_][_]
[_][_][_][_]
]]

class["j"] = {}

i = 1
class["j"][i] = {}
class["j"][i]["x1"] = 3
class["j"][i]["x2"] = 3
class["j"][i]["x3"] = 2
class["j"][i]["x4"] = 3
class["j"][i]["y1"] = 1
class["j"][i]["y2"] = 2
class["j"][i]["y3"] = 3
class["j"][i]["y4"] = 3

i = 2
class["j"][i] = {}
class["j"][i]["x1"] = 2
class["j"][i]["x2"] = 2
class["j"][i]["x3"] = 3
class["j"][i]["x4"] = 4
class["j"][i]["y1"] = 1
class["j"][i]["y2"] = 2
class["j"][i]["y3"] = 2
class["j"][i]["y4"] = 2

i = 3
class["j"][i] = {}
class["j"][i]["x1"] = 2
class["j"][i]["x2"] = 3
class["j"][i]["x3"] = 2
class["j"][i]["x4"] = 2
class["j"][i]["y1"] = 1
class["j"][i]["y2"] = 1
class["j"][i]["y3"] = 2
class["j"][i]["y4"] = 3

i = 4
class["j"][i] = {}
class["j"][i]["x1"] = 2
class["j"][i]["x2"] = 3
class["j"][i]["x3"] = 4
class["j"][i]["x4"] = 4
class["j"][i]["y1"] = 1
class["j"][i]["y2"] = 1
class["j"][i]["y3"] = 1
class["j"][i]["y4"] = 2

--[[
L1
[_][x][_][_]
[_][x][_][_]
[_][x][x][_]
[_][_][_][_]
L2
[_][x][x][x]
[_][x][_][_]
[_][_][_][_]
[_][_][_][_]
L3
[_][x][x][_]
[_][_][x][_]
[_][_][x][_]
[_][_][_][_]
L4
[_][_][_][x]
[_][x][x][x]
[_][_][_][_]
[_][_][_][_]
]]

class["l"] = {}

i = 1
class["l"][i] = {}
class["l"][i]["x1"] = 2
class["l"][i]["x2"] = 2
class["l"][i]["x3"] = 2
class["l"][i]["x4"] = 3
class["l"][i]["y1"] = 1
class["l"][i]["y2"] = 2
class["l"][i]["y3"] = 3
class["l"][i]["y4"] = 3

i = 2
class["l"][i] = {}
class["l"][i]["x1"] = 2
class["l"][i]["x2"] = 3
class["l"][i]["x3"] = 4
class["l"][i]["x4"] = 2
class["l"][i]["y1"] = 1
class["l"][i]["y2"] = 1
class["l"][i]["y3"] = 1
class["l"][i]["y4"] = 2

i = 3
class["l"][i] = {}
class["l"][i]["x1"] = 2
class["l"][i]["x2"] = 3
class["l"][i]["x3"] = 3
class["l"][i]["x4"] = 3
class["l"][i]["y1"] = 1
class["l"][i]["y2"] = 1
class["l"][i]["y3"] = 2
class["l"][i]["y4"] = 3

i = 4
class["l"][i] = {}
class["l"][i]["x1"] = 4
class["l"][i]["x2"] = 2
class["l"][i]["x3"] = 3
class["l"][i]["x4"] = 4
class["l"][i]["y1"] = 1
class["l"][i]["y2"] = 2
class["l"][i]["y3"] = 2
class["l"][i]["y4"] = 2

--[[
Z1 1/3
[_][x][x][_]
[x][x][_][_]
[_][_][_][_]
[_][_][_][_]
Z1 2/4
[_][x][_][_]
[_][x][x][_]
[_][_][x][_]
[_][_][_][_]
]]

class["z1"] = {}

i = 1
class["z1"][i] = {}
class["z1"][i]["x1"] = 2
class["z1"][i]["x2"] = 3
class["z1"][i]["x3"] = 1
class["z1"][i]["x4"] = 2
class["z1"][i]["y1"] = 1
class["z1"][i]["y2"] = 1
class["z1"][i]["y3"] = 2
class["z1"][i]["y4"] = 2

i = 3
class["z1"][i] = {}
class["z1"][i]["x1"] = 2
class["z1"][i]["x2"] = 3
class["z1"][i]["x3"] = 1
class["z1"][i]["x4"] = 2
class["z1"][i]["y1"] = 1
class["z1"][i]["y2"] = 1
class["z1"][i]["y3"] = 2
class["z1"][i]["y4"] = 2

i = 2
class["z1"][i] = {}
class["z1"][i]["x1"] = 2
class["z1"][i]["x2"] = 2
class["z1"][i]["x3"] = 3
class["z1"][i]["x4"] = 3
class["z1"][i]["y1"] = 1
class["z1"][i]["y2"] = 2
class["z1"][i]["y3"] = 2
class["z1"][i]["y4"] = 3

i = 4
class["z1"][i] = {}
class["z1"][i]["x1"] = 2
class["z1"][i]["x2"] = 2
class["z1"][i]["x3"] = 3
class["z1"][i]["x4"] = 3
class["z1"][i]["y1"] = 1
class["z1"][i]["y2"] = 2
class["z1"][i]["y3"] = 2
class["z1"][i]["y4"] = 3

--[[
Z2 1/3
[_][x][x][_]
[_][_][x][x]
[_][_][_][_]
[_][_][_][_]
Z2 2/4
[_][_][_][x]
[_][_][x][x]
[_][_][x][_]
[_][_][_][_]
]]

class["z2"] = {}

i = 1
class["z2"][i] = {}
class["z2"][i]["x1"] = 2
class["z2"][i]["x2"] = 3
class["z2"][i]["x3"] = 3
class["z2"][i]["x4"] = 4
class["z2"][i]["y1"] = 1
class["z2"][i]["y2"] = 1
class["z2"][i]["y3"] = 2
class["z2"][i]["y4"] = 2

i = 3
class["z2"][i] = {}
class["z2"][i]["x1"] = 2
class["z2"][i]["x2"] = 3
class["z2"][i]["x3"] = 3
class["z2"][i]["x4"] = 4
class["z2"][i]["y1"] = 1
class["z2"][i]["y2"] = 1
class["z2"][i]["y3"] = 2
class["z2"][i]["y4"] = 2

i = 2
class["z2"][i] = {}
class["z2"][i]["x1"] = 4
class["z2"][i]["x2"] = 3
class["z2"][i]["x3"] = 4
class["z2"][i]["x4"] = 3
class["z2"][i]["y1"] = 1
class["z2"][i]["y2"] = 2
class["z2"][i]["y3"] = 2
class["z2"][i]["y4"] = 3

i = 4
class["z2"][i] = {}
class["z2"][i]["x1"] = 4
class["z2"][i]["x2"] = 3
class["z2"][i]["x3"] = 4
class["z2"][i]["x4"] = 3
class["z2"][i]["y1"] = 1
class["z2"][i]["y2"] = 2
class["z2"][i]["y3"] = 2
class["z2"][i]["y4"] = 3

--[[
T1
[_][x][x][x]
[_][_][x][_]
[_][_][_][_]
[_][_][_][_]
T2
[_][_][x][_]
[_][_][x][x]
[_][_][x][_]
[_][_][_][_]
T3
[_][_][x][_]
[_][x][x][x]
[_][_][_][_]
[_][_][_][_]
T4
[_][_][x][_]
[_][x][x][_]
[_][_][x][_]
[_][_][_][_]
]]

class["t"] = {}

i = 1
class["t"][i] = {}
class["t"][i]["x1"] = 2
class["t"][i]["x2"] = 3
class["t"][i]["x3"] = 4
class["t"][i]["x4"] = 3
class["t"][i]["y1"] = 1
class["t"][i]["y2"] = 1
class["t"][i]["y3"] = 1
class["t"][i]["y4"] = 2

i = 2
class["t"][i] = {}
class["t"][i]["x1"] = 2
class["t"][i]["x2"] = 2
class["t"][i]["x3"] = 3
class["t"][i]["x4"] = 2
class["t"][i]["y1"] = 1
class["t"][i]["y2"] = 2
class["t"][i]["y3"] = 2
class["t"][i]["y4"] = 3

i = 3
class["t"][i] = {}
class["t"][i]["x1"] = 3
class["t"][i]["x2"] = 2
class["t"][i]["x3"] = 3
class["t"][i]["x4"] = 4
class["t"][i]["y1"] = 1
class["t"][i]["y2"] = 2
class["t"][i]["y3"] = 2
class["t"][i]["y4"] = 2

i = 4
class["t"][i] = {}
class["t"][i]["x1"] = 3
class["t"][i]["x2"] = 2
class["t"][i]["x3"] = 3
class["t"][i]["x4"] = 3
class["t"][i]["y1"] = 1
class["t"][i]["y2"] = 2
class["t"][i]["y3"] = 2
class["t"][i]["y4"] = 3