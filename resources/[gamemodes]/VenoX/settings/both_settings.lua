levelSys = {
	[1] = 150, 
	[2] = 200,
	[3] = 900,
	[4] = 1250,
	[5] = 1750,
	[6] = 2500,
	[7] = 3500,
	[8] = 5000,
	[9] = 5500,
	[10] = 6500,
	[11] = 8000,
	[12] = 9500,
	[13] = 11000,
	[14] = 14000,
	[15] = 17500,
	[16] = 19000,
	[17] = 23000,
	[18] = 25000,
	[19] = 28000,
	[20] = 35000,
	[21] = 42000,
	[22] = 48000,
	[23] = 58000,
	[24] = 69000,
	[25] = 70000,
	[26] = 75000,
	[27] = 80000,
	[28] = 90000,
	[29] = 95000,
	[30] = 100000
	}
	maxlevel = 30


isHalloween = false
noobtime = 0

VIPXP 				= 2 
DoubleXP			= 1

rangedWeapons = {}
	for i = 0, 50 do
		rangedWeapons[i] = false
	end
	rangedWeapons[22] = true
	rangedWeapons[23] = true
	rangedWeapons[24] = true
	rangedWeapons[25] = true
	rangedWeapons[26] = true
	rangedWeapons[27] = true
	rangedWeapons[28] = true
	rangedWeapons[29] = true
	rangedWeapons[32] = true
	rangedWeapons[30] = true
	rangedWeapons[31] = true
	rangedWeapons[33] = true
	rangedWeapons[34] = true
	rangedWeapons[35] = true
	rangedWeapons[36] = true
	rangedWeapons[37] = true
	rangedWeapons[38] = true

weaponsWithSpeacialAmmo = {}
	weaponsWithSpeacialAmmo[22] = true
	weaponsWithSpeacialAmmo[23] = true
	weaponsWithSpeacialAmmo[24] = true
	--weaponsWithSpeacialAmmo[25] = true
	weaponsWithSpeacialAmmo[26] = true
	weaponsWithSpeacialAmmo[27] = true
	weaponsWithSpeacialAmmo[28] = true
	weaponsWithSpeacialAmmo[29] = true
	weaponsWithSpeacialAmmo[32] = true
	weaponsWithSpeacialAmmo[30] = true
	weaponsWithSpeacialAmmo[31] = true
	weaponsWithSpeacialAmmo[33] = true
	weaponsWithSpeacialAmmo[34] = true

specialAmmoName = {}
	specialAmmoName[1] = "Phosphor"
	specialAmmoName[2] = "Dum-Dum"
	specialAmmoName[3] = "Panzerbrechend"
	specialAmmoName[4] = "Vulcano"
	specialAmmoName[5] = "Pfeffer"
	specialAmmoName[6] = "Halloween-Munition"
	specialAmmoName[7] = false
	
evilFraction = { [2] = true, [3] = true, [4] = true, [7] = true, [9] = true, [12] = true, [13] = true, [14] = true }
goodFraction = { [1] = true, [6] = true, [8] = true }
	

socialNeeds = {
 ["VenoX"]="-",
 ["Illegaler Immigrant"]="\nNeuer Skin\n30 Spielminuten",
 ["Immigrant"]="Personalausweiss\n45 Spielminuten",
 ["Bürger"]="Neuer Spawnpunkt\n3 Spielstunden",
 ["Arbeiter"]="Job\neigenes Fahrzeug\n5 Spielstunden",
 ["Neuling"]="Fraktion\n30 Spielstunden",
 ["Aufsteiger"]="Fraktion Rang 2\n75 Spielstunden",
 ["Dealer"]="Dealer als Job",
 ["Hausbesitzer"]="Eigenes Haus",
 ["Finanzhai"]="500.000 $",
 ["Millionär"]="1.000.000 $",
 ["Multimillionär"]="3.000.000 $",
 ["Fädenzieher"]="Fraktion Rang 4\n250 Spielstunden",
 ["Geschäftsmann"]="Eigenes Biz",
 ["Wirtschaftsboss"]="Finanzhai\nEigenes Biz\n400 Spielstunden",
 ["Reich & Schön"]="Eigenes Haus\nYacht\n200 Spielstunden",
 ["God of VenoX"]="30 Stunden Spielzeit\nAlle 25 Paeckchen\nEigene Yacht\n250.000 $\nEigenes Auto",
 ["Rentner"]="750 Spielstunden\nKeinen Job\nKeine Fraktion",
 ["Kettenraucher"]="Zigaretten-\nsucht LVL 3",
 ["Saufbruder"]="Alkohol-\nsucht LVL 3",
 ["Junkie"]="Drogensucht\nLVL 3",
 ["Glücksschmied"]="\nAlle 25 Hufeisen",
 ["Hasadeur"]="\nJe 100.000 $\nim Casino gewinnen\nund verlieren",
 ["Blumenkind"]="\n\nMitglied im\nGartenclub",
 ["Ferngesteuert"]="\n\nMitglied im\nRC-Club",
 ["Silent Assasin"]="Truth-Mission\nabgeschlossen\nohne entdeckt\worden zu sein"
}

curVersion = "3.2"

-- Handy
prePaidPrices = {
 ["low"]=50,
 ["middle"] = 100,
 ["large"] = 250
 }

-- Fahrzeuge
singleTrunkWeapons = { [16]=true, [17]=true, [18]=true, [39]=true }

-- 24/7
flowers_price = 5
cam_price = 40
camammo_price = 36
nvgoogles_price = 150
tgoogles_price = 150
wuerfel_price = 10
rubbellos_price = 10
zigarett_price = 100
beer_price = 40

fishingPolePrice = 500
fishingHookPrice = 3
fishingWormPrice = 5

-- Marker
markerPositions = {}

-- Baumarkt
placeablePrices = {}
 placeablePrices[841] = 495 -- Lagerfeuer #1
 placeablePrices[842] = 495 -- Lagerfeuer #2
 placeablePrices[3461] = 249 -- Fackel
 placeablePrices[1946] = 75 -- Basketball
 placeablePrices[1598] = 50 -- Strandball
 placeablePrices[1481] = 650 -- Grill
 placeablePrices[1255] = 300 -- Liege
 placeablePrices[1640] = 50 -- Handtuch Gruen
 placeablePrices[1641] = 50 -- Handtuch Lila
 placeablePrices[1642] = 50 -- Handtuch Rot
 placeablePrices[1643] = 50 -- Handtuch Gelb
 placeablePrices[2103] = 1450 -- Stereoanlage
 
serverip = "51.68.175.173:22123"
tsip = "VenoX-Reallife"
forumURL = "www.VenoX-reallife.com"

-- Spawns
noobspawn1 = -2517.1049804688
noobspawn2 = 718.59204101563
noobspawn3 = 123

-- DayNames
daynames = { [1]="Mo", [2]="Di", [3]="Mi", [4]="Do", [5]="Fr", [6]="Sa", [7]="So" }

-- Skins
malehomeless = { [1]=78, [2]=79, [3]=134, [4]=135, [4]=136, [5]=137 }
femalehomeless = { [1]=77 }

-- Placeables to be saved
placeAblesToBeSaved = {
 [3515]="Springbrunnen",
 [827]="Bambus",
 [859]="Agave",
 [871]="Lila Blume",
 [870]="Rote Blume"
 }
placeAblesPrices = {
 [3515]=1500,
 [827]=350,
 [859]=149,
 [871]=149,
 [870]=149
 }

maxPlaceAbleObjectsPerPlayer = 3

-- Animationen --
animationCMDs = {
"handsup",
"phoneout",
"phonein",
"drunk",
"robman",
"bomb",
"getarrested",
"laugh",
"lookout",
"crossarms",
"lay",
"hide",
"vomit",
"wave",
"slapass",
"deal",
"crack",
"smoke",
"smokef",
"ground",
"fucku",
"chat",
"taichi",
"chairsit",
"dance",
"piss",
"wank"
}

-- License --
evelse = { [594]=true }
trailers = { [606]=true,  [607]=true, [610]=true, [590]=true, [569]=true, [611]=true, [584]=true, [608]=true, [435]=true, [450]=true, [591]=true}
rc_vehs = { [464]=true, [501]=true, [465]=true, [564]=true }
trains = { [537]=true, [538]=true, [569]=true, [590]=true, [537]=true, [449]=true, }
cars = { [579]=true, [400]=true, [404]=true, [489]=true, [505]=true, [479]=true, [442]=true, [458]=true, [429]=true, [411]=true, [559]=true, [541]=true, [415]=true, [561]=true, [480]=true, [560]=true, [562]=true, [506]=true, [565]=true, 
[451]=true, [434]=true, [558]=true, [555]=true, [477]=true, [503]=true, [502]=true, [494]=true, [434]=true, [565]=true, [568]=true, [557]=true, [424]=true, [504]=true, [495]=true, [539]=true, [483]=true, [508]=true, [500]=true,  [444]=true,
[556]=true, [536]=true, [575]=true, [534]=true, [567]=true, [535]=true, [576]=true, [412]=true, [459]=true, [422]=true, [482]=true, [605]=true, [530]=true, [418]=true, [582]=true, [413]=true, [440]=true, [543]=true, [583]=true, [478]=true,
[554]=true, [602]=true, [496]=true, [401]=true, [518]=true, [527]=true, [589]=true, [419]=true, [533]=true, [526]=true, [474]=true, [545]=true, [517]=true, [410]=true, [600]=true, [436]=true, [580]=true, [439]=true, [549]=true, [491]=true,
[445]=true, [604]=true, [507]=true, [585]=true, [466]=true, [492]=true, [546]=true, [551]=true, [516]=true, [467]=true, [426]=true, [547]=true, [405]=true, [409]=true, [550]=true, [566]=true, [540]=true, [529]=true, [485]=true,
[574]=true, [420]=true, [525]=true, [552]=true, [416]=true, [596]=true, [597]=true, [499]=true, [428]=true, [598]=true, [470]=true, [528]=true, [590]=true }
lkws = { [499]=true, [609]=true, [498]=true, [524]=true, [532]=true, [578]=true, [486]=true, [406]=true, [573]=true, [455]=true, [588]=true, [403]=true, [514]=true, [423]=true, [414]=true, [443]=true, [515]=true, [531]=true, [456]=true,
[433]=true, [427]=true, [407]=true, [544]=true, [432]=true, [431]=true, [437]=true, [408]=true, }

motorboats = { [472]=true, [473]=true, [493]=true, [595]=true, [430]=true, [453]=true, [452]=true, [446]=true }
bikes = { [471]=true, [523]=true, [581]=true, [521]=true, [463]=true, [522]=true, [461]=true, [468]=true, [586]=true }
raftboats = { [484]=true, [454]=true }
helicopters = { [548]=true, [425]=true, [417]=true, [487]=true, [488]=true, [497]=true, [563]=true, [447]=true, [469]=true }
planea = { [512]=true, [593]=true, [476]=true, [460]=true, [513]=true }	-- Propeller
planeb = { [592]=true, [577]=true, [511]=true, [520]=true, [553]=true, [519]=true }	-- Düsenjets
nolicense = { [457]=true, [539]=true, [571]=true, [572]=true, [509]=true, [481]=true, [462]=true, [510]=true, [448]=true, [438]=true }

-- Trucker --
tour1Price = 75
tour2Price = 125
tour3Price = 175
tour4Price = 250
maxdamage = 100
trucks = { [515]=true, [514]=true, [403]=true }
truckTrailer = { [435]=true, [450]=true, [591]=true }
fahrzeugslotprice = { [5]=30000, [7]=40000, [9]=50000, [11]=70000, [13]=100000, [15]=0, [20]=0 }

-- Farben --
markerred = 125, 0, 0, 255

-- Tankstelle & Burgershot --
literPrice = 15
kannisterPrice = 450
sprunkheal = 40
snackPrice = 6
burgerPrice = 10

-- Bikerclub --
outfitPrice = 200
quePrice = 60
freewayPrice = 11950

-- Fraktionen --
fraktionsNamen = { [1]="S.F.P.D", [2]="Mafia", [3]="Triaden", [4]="Terroristen", [5]="Reporter", [6]="F.B.I", [7]="Los Aztecas", [8]="U.S Army", [9]="Angels of Death", [10]="Medic", [11]="Ordnungsamt", [12]="Rollin' Heights", [13]="Compton", [14]="Italian Mafia" , [15]="Feuerwehr"}

-- Jobs --
jobNames = { ["none"]="Arbeitslos",
["fischer"]="Fischer",
["trucker"]="Trucker",
["airport"]="Flughafen",
["wdealer"]="Waffendealer",
["mechaniker"]="Mechaniker",
["dealer"]="Drogendealer",
["taxifahrer"]="Taxifahrer",
["hitman"]="Hitman",
["hotdog"]="Hotdogverkaeufer",
["streetclean"]="Straßenreiniger",
["farmer"]="Farmer",
["tramfuehrer"] = "Tramfahrer",
["bauarbeiter"] = "Bauarbeiter",
["transporteur"] = "Transporteur" }

taxiPricePerInterval = 30

-- Items --
foodImages = { 
 [1]="aid",
 [2]="beer",
 [3]="burger",
 [4]="snack",
 [5]="easteregg"
 }
foodName = {
 [1]="Erste Hilfe",
 [2]="Bier",
 [3]="Burger",
 [4]="Snack",
 [5]="Süßigkeiten"
 }
foodHeal = {
 [1]=50,
 [2]=15,
 [3]=25,
 [4]=10,
 [5]=100
}
foodHunger = {
 [1]=0,
 [2]=15,
 [3]=25,
 [4]=10,
 [5]=100
}

donutPrices = { [1]=5, [2]=10, [3]=15 }

-- Waffen
meeleweapons = { [0]=true, [1]=true, [2]=true, [3]=true, [4]=true, [5]=true, [6]=true, [7]=true, [8]=true, [9]=true, [15]=true, [10]=true, [11]=true, [12]=true, [14]=true }
	-- Waffenpreise
		uncosts = 2
		
		schlagringe_price = 50
		baseball_price = 30
		knife_price = 75
		shovels_price = 20
		pistol_price = 150
		sdpistol_price = 320
		pistolammo_price = 15
		eagle_price = 750
		eagleammo_price = 150
		shotgun_price = 400
		shotgunammo_price = 3
		mp_price = 540
		mpammo_price = 140
		ak_price = 740
		akammo_price = 340
		m_price = 840
		mammo_price = 340
		gewehr_price = 400
		gewehrammo_price = 20
		sgewehr_price = 750
		sgewehrammo_price = 7
		rakwerfer_price = 3000
		rak_price = 500
		spezgun_price = 150
		armor_price = 75

		schlagringcap = 20
		baseballcap = 20
		knifecap = 15
		shovelscap = 10
		pistolcap = 35
		sdpistolcap = 10
		pistolammocap = 125
		eaglecap = 5
		eagleammocap = 50
		shotguncap = 15
		shotgunammocap = 1200
		mpcap = 20
		mpammocap = 50
		akcap = 7
		akammocap = 20
		mcap = 5
		mammocap = 15
		gewehrcap = 10
		gewehrammocap = 150
		sgewehrcap = 3
		sgewehrammocap = 50
		raketenwerfercap = 3
		raketencap = 15
		spezguncap = 10
		
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

--skins 


copskins = { [265]=true, [266]=true, [267]=true, [280]=true, [281]=true, [282]=true, [283]=true, [284]=true, [285]=true, [288]=true}

fbiSkins = { [163]=true, [164]=true, [165]=true, [295]=true, [285]=true, [286]=true }

armySkins = { [191]=true, [287]=true, [312]=true }

function table.reverse(t) 
    local reversedTable = {} 
    local itemCount = #t  
    for k, v in ipairs(t) do 
        reversedTable[itemCount + 1 - k] = v  
    end 
    return reversedTable  
end 

if (not localPlayer) then
	function infoShow(player, typ, msg, args)
		triggerClientEvent(player, "infoShow", player, typ, msg, args)
	end
end