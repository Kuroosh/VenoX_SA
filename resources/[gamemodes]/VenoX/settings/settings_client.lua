-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

-- Textdraws --
timeForEveryLetter = 90

-- Playerlist --
factioncount = 14

factionMembers = {}
for i = -1, factioncount do
	factionMembers[i] = {}
end

factionColors = {}
factionColors[-1] = {}
	factionColors[-1][1] = 0
	factionColors[-1][2] = 0
	factionColors[-1][3] = 0
factionColors[0] = {}
	factionColors[0][1] = 200
	factionColors[0][2] = 200
	factionColors[0][3] = 200
factionColors[1] = {}
	factionColors[1][1] = 0
	factionColors[1][2] = 140
	factionColors[1][3] = 183
factionColors[2] = {}
	factionColors[2][1] = 160
	factionColors[2][2] = 40
	factionColors[2][3] = 40
factionColors[3] = {}
	factionColors[3][1] = 255
	factionColors[3][2] = 4
	factionColors[3][3] = 4
factionColors[4] = {}
	factionColors[4][1] = 140
	factionColors[4][2] = 0
	factionColors[4][3] = 0
factionColors[5] = {}
	factionColors[5][1] = 180
	factionColors[5][2] = 130
	factionColors[5][3] = 0
factionColors[6] = {}
	factionColors[6][1] = 0
	factionColors[6][2] = 86
	factionColors[6][3] = 184
factionColors[7] = {}
	factionColors[7][1] = 200
	factionColors[7][2] = 200
	factionColors[7][3] = 0
factionColors[8] = {}
	factionColors[8][1] = 0
	factionColors[8][2] = 100
	factionColors[8][3] = 0
factionColors[9] = {}
	factionColors[9][1] = 100
	factionColors[9][2] = 50
	factionColors[9][3] = 50
factionColors[10] = {}
	factionColors[10][1] = 255
	factionColors[10][2] = 51
	factionColors[10][3] = 51
factionColors[11] = {}
	factionColors[11][1] = 255
	factionColors[11][2] = 100
	factionColors[11][3] = 0
factionColors[12] = {}
	factionColors[12][1] = 138
	factionColors[12][2] = 43
	factionColors[12][3] = 226
factionColors[13] = {}
	factionColors[13][1] = 0
	factionColors[13][2] = 152
	factionColors[13][3] = 0
factionColors[14] = {}
	factionColors[14][1] = 120
	factionColors[14][2] = 120
	factionColors[14][3] = 120
factionColors[15] = {}
	factionColors[15][1] = 119
	factionColors[15][2] = 0
	factionColors[15][3] = 0

nitroprice = 50
tuningpartprice = 75

uncosts = 1.5

schlagringe_price = 50
baseball_price = 30
knife_price = 75
shovels_price = 20
pistol_price = 150
sdpistol_price = 320
pistolammo_price = 15
eagle_price = 500
eagleammo_price = 75
shotgun_price = 250
shotgunammo_price = 3
mp_price = 270
mpammo_price = 50
ak_price = 450
akammo_price = 50
m_price = 550
mammo_price = 75
gewehr_price = 225
gewehrammo_price = 2
sgewehr_price = 750
sgewehrammo_price = 7
rakwerfer_price = 3000
rak_price = 500
spezgun_price = 150
armor_price = 150

schlagringe_gunshop_price = math.floor ( schlagringe_price*uncosts )
baseball_gunshop_price = math.floor ( baseball_price*uncosts )
knife_gunshop_price = math.floor ( knife_price*uncosts )
shovels_gunshop_price = math.floor ( shovels_price*uncosts )
pistol_gunshop_price = math.floor ( pistol_price*uncosts )
sdpistol_gunshop_price = math.floor ( sdpistol_price*uncosts )
pistolammo_gunshop_price = math.floor ( pistolammo_price*uncosts )
eagle_gunshop_price = math.floor ( eagle_price*uncosts )
eagleammo_gunshop_price = math.floor ( eagleammo_price*uncosts )
shotgun_gunshop_price = math.floor ( shotgun_price*uncosts )
shotgunammo_gunshop_price = math.floor ( shotgunammo_price*uncosts )
mp_gunshop_price = math.floor ( mp_price*uncosts )
mpammo_gunshop_price = math.floor ( mpammo_price*uncosts )
ak_gunshop_price = math.floor ( ak_price*uncosts )
akammo_gunshop_price = math.floor ( akammo_price*uncosts )
m_gunshop_price = math.floor ( m_price*uncosts )
mammo_gunshop_price = math.floor ( mammo_price*uncosts )
gewehr_gunshop_price = math.floor ( gewehr_price*uncosts )
gewehrammo_gunshop_price = math.floor ( gewehrammo_price*uncosts )
sgewehr_gunshop_price = math.floor ( sgewehr_price*uncosts )
sgewehrammo_gunshop_price = math.floor ( sgewehrammo_price*uncosts )
rakwerfer_gunshop_price = math.floor ( rakwerfer_price*uncosts )
rak_gunshop_price = math.floor ( rak_price*uncosts )
spezgun_gunshop_price = math.floor ( spezgun_price*uncosts )
armor_gunshop_price = math.floor ( armor_price*uncosts )

-- Skins
copcars = { [598]=true, [596]=true, [597]=true }
copbikes = { [523]=true }
copjeeps = { [599]=true }
cophelis = { [497]=true }
copvehs = { [598]=true, [596]=true, [597]=true, [523]=true, [599]=true, [497]=true }

copskins = { [280]=true, [281]=true, [282]=true, [283]=true, [284]=true, [285]=true, [288]=true }