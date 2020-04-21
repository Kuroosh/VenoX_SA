addEvent ( "openClothShop_Bonus", true )
addEvent ( "boughtCloth_Bonus", true )
addEvent ( "addedremovedCloth_Bonus", true)

local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1920, screenY/1080
local chosentype = 0
local chosenindex = 0
local picswidth = 0
local picslength = 0
local picswidthint = 0
local picslengthint = 0
local originaltype = {}
local indexespertype = {}
local boughtindexes = { [0] = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }
local mouseontypeint = false
local mouseonindexint = false
local showing = false


local picpath = { "clothes/cjshop/Bilder/", ".jpg" }		-- AUCH SERVERSEITIG ÄNDERN
local typesactivated = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, 
						[9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [17] = true }
local typeprices =  { [0] = 5000, [1] = 5000, [2] = 5000, [3] = 5000, [4] = 5000, [5] = 5000, [6] = 5000, [7] = 5000, [8] = 5000, 
					[9] = 5000, [10] = 5000, [11] = 5000, [12] = 5000, [13] = 5000, [14] = 5000, [15] = 5000, [16] = 5000, [17] = 50000 }   -- AUCH SERVERSEITIG ÄNDERN
local colors = { 
	["typechoice"] = { rectangle = tocolor ( 20, 20, 20, 187 ), text = tocolor ( 255, 255, 255 ), chosen = tocolor ( 0, 200, 0, 187 ), mouseon = tocolor ( 200, 200, 200, 187 ) },
	["pictures"] = { rectangle = tocolor ( 0, 0, 180, 187 ), picture = tocolor ( 255, 255, 255 ), chosen = tocolor ( 0, 200, 0, 187 ), mouseon = tocolor ( 200, 200, 200, 187 ) },
	["rightside"] = { 	rectangle = tocolor ( 20, 20, 20, 187 ), price = tocolor ( 255, 255, 255 ),
						textbuy = tocolor ( 255, 255, 255 ), textadd = tocolor ( 255, 255, 255 ), textremove = tocolor ( 255, 255, 255 ), textclose = tocolor ( 255, 255, 255 ),
						rectanglebuy = tocolor ( 0, 200, 0, 187 ), rectangleadd = tocolor ( 0, 0, 200, 187 ), rectangleremove = tocolor ( 255, 0, 0, 187 ), rectangleclose = tocolor ( 150, 0, 0 ),
						previewpicture = tocolor ( 255, 255, 255 ) } }
local fonts = { typechoice = "default", buy = "default", add = "default", remove = "default", close = "default", price = "default" }
local textsizes = { typechoice = 1.2*sy, buy = 1.5*sy, add = 1.5*sy, remove = 1.5*sy, close = 1.5*sy, price = 1.5*sy }
local totalwidth = screenX*0.6
local totallength = screenY*0.6
local widths = { clothestype = totalwidth*0.15, picstotal = totalwidth*0.65, rightsidetotal = totalwidth*0.2, rightsidepic = totalwidth*0.2*0.9, rightbutton = totalwidth*0.2*0.9 } 
local lengths = { clothestype = totallength/18, rightpic = totallength*0.6 }
local widthgapbetweenpics = screenX*0.005
local lengthgapbetweenpics = screenY*0.005
local postGUI = false
local typesname = { [0] = "Shirt", "Kopf", "Hose", "Schuhe", "Tattoo linker Oberarm", "Tattoo linker Unterarm", "Tattoo rechter Oberarm", "Tattoo rechter Unterarm", "Tattoo Rücken", "Tattoo linke Brust", "Tattoo rechte Brust",
	"Tattoo Bauch", "Tattoo Hüfte", "Schmuck", "Armbanduhr", "Brille", "Hut", "Extra" }  

local function drawClothesShop ( )
	dxDrawRectangle ( screenX*0.5 - totalwidth/2, screenY*0.5-totallength/2, widths.clothestype, totallength, colors["typechoice"].rectangle, postGUI )	-- LINKS
	dxDrawRectangle ( screenX*0.5 - totalwidth/2 + widths.clothestype, screenY*0.5-totallength/2, widths.picstotal, totallength, colors["pictures"].rectangle, postGUI ) 	-- MITTE
	dxDrawRectangle ( screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal, screenY*0.5-totallength/2, widths.rightsidetotal, totallength, colors["rightside"].rectangle, postGUI )	-- RECHTS
if isCursorShowing () then
		local x, y = getCursorPosition ( )
		x, y = x*screenX, y*screenY
		if x >= screenX*0.5 - totalwidth/2 and x <= screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal + widths.rightsidetotal and y >= screenY*0.5-totallength/2 and y <= screenY*0.5-totallength/2+totallength then
			if x <= screenX*0.5 - totalwidth/2 + widths.clothestype then
				local newmouseontypeint = math.floor ( ( y - (screenY*0.5-totallength/2) ) / totallength * 18 )
				if mouseontypeint ~= newmouseontypeint then
					playSoundFrontEnd ( 1 )
					mouseontypeint = newmouseontypeint
				end
			elseif x <= screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal then
				local newmouseonindexint = math.floor ( ( x - (screenX*0.5 - totalwidth/2 + widths.clothestype) ) / ( widths.picstotal-2*widthgapbetweenpics ) * picswidthint )  +  picswidthint * math.floor ( ( y - (screenY*0.5-totallength/2) ) / ( totallength-2*lengthgapbetweenpics ) * picslengthint )   
				mouseontypeint = false
				if mouseonindexint ~= newmouseonindexint then
					playSoundFrontEnd ( 2 )
					mouseonindexint = newmouseonindexint
				end
			else
				mouseontypeint = false
			end
		else
			mouseontypeint = false
		end
	else
		mouseontypeint = false
	end
for i=0, #originaltype do
		if chosentype == originaltype[i] then
			dxDrawRectangle ( screenX*0.5 - totalwidth/2, screenY*0.5-totallength/2+totallength/18*i, widths.clothestype, totallength/18, colors["typechoice"].chosen, postGUI )
		elseif mouseontypeint == i then
			dxDrawRectangle ( screenX*0.5 - totalwidth/2, screenY*0.5-totallength/2+totallength/18*i, widths.clothestype, totallength/18, colors["typechoice"].mouseon, postGUI )
		end
		dxDrawText ( typesname[originaltype[i]], screenX*0.5 - totalwidth/2, screenY*0.5-totallength/2+totallength/18*i, screenX*0.5 - totalwidth/2+widths.clothestype, screenY*0.5-totallength/2+totallength/18*(i+1), colors["typechoice"].text, textsizes.typechoice, fonts.typechoice, "center", "center", false, false, postGUI  )
	end
for i=1, picswidthint do
		for j=1, picslengthint do
			local int = (j-1)*picswidthint + i - 1
			if fileExists ( picpath[1].."Type"..chosentype.."index"..int ..picpath[2] ) then
				if chosenindex == int then
					dxDrawRectangle ( screenX*0.5 - totalwidth/2 + widths.clothestype + widthgapbetweenpics*(i-1) + picswidth*(i-1), screenY*0.5-totallength/2 + lengthgapbetweenpics*(j-1) + picslength*(j-1), picswidth+widthgapbetweenpics*2, picslength+lengthgapbetweenpics*2, colors["pictures"].chosen, postGUI )
				elseif mouseonindexint == int then
					dxDrawRectangle ( screenX*0.5 - totalwidth/2 + widths.clothestype + widthgapbetweenpics*(i-1) + picswidth*(i-1), screenY*0.5-totallength/2 + lengthgapbetweenpics*(j-1) + picslength*(j-1), picswidth+widthgapbetweenpics*2, picslength+lengthgapbetweenpics*2, colors["pictures"].mouseon, postGUI )
				end
				dxDrawImage ( screenX*0.5 - totalwidth/2 + widths.clothestype + widthgapbetweenpics*i + picswidth*(i-1), screenY*0.5-totallength/2 + lengthgapbetweenpics*j + picslength*(j-1), picswidth, picslength, picpath[1].."Type"..chosentype.."index"..int ..picpath[2], 0, 0, 0, colors["pictures"].picture, postGUI )
			end
		end
	end
local rightsideX = screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal
	dxDrawText ( "€"..typeprices[chosentype], rightsideX, screenY*0.5-totallength/2, rightsideX + widths.rightsidetotal, screenY*0.5-totallength/2 + totallength*0.1, colors["rightside"].price, textsizes.price, fonts.price, "center", "center", false, false, postGUI )
	dxDrawImage ( rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2, screenY*0.5-totallength/2 + totallength*0.1, widths.rightsidepic, totallength*0.6, picpath[1].."Type"..chosentype.."index"..chosenindex ..picpath[2], 0, 0, 0, colors["rightside"].previewpicture, postGUI )
	dxDrawRectangle ( rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2, screenY*0.5-totallength/2 + totallength*0.76, widths.rightsidepic, totallength*0.08, boughtindexes[chosentype][chosenindex] and ( boughtindexes[chosentype][chosenindex] == "added" and colors["rightside"].rectangleremove or colors["rightside"].rectangleadd ) or colors["rightside"].rectanglebuy, postGUI  )
	dxDrawText ( boughtindexes[chosentype][chosenindex] and ( boughtindexes[chosentype][chosenindex] == "added" and "Ausziehen" or "Anziehen" ) or "Kaufen", 
		rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2, screenY*0.5-totallength/2 + totallength*0.76, rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2+widths.rightsidepic, screenY*0.5-totallength/2 + totallength*0.76+totallength*0.08, 
		boughtindexes[chosentype][chosenindex] and ( boughtindexes[chosentype][chosenindex] == "added" and colors["rightside"].textremove or colors["rightside"].textadd ) or colors["rightside"].textbuy, 
		boughtindexes[chosentype][chosenindex] and ( boughtindexes[chosentype][chosenindex] == "added" and textsizes.remove or textsizes.add ) or textsizes.buy, 
		boughtindexes[chosentype][chosenindex] and ( boughtindexes[chosentype][chosenindex] == "added" and fonts.remove or fonts.add ) or fonts.buy, "center", "center", false, false, postGUI )
	dxDrawRectangle ( rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2, screenY*0.5-totallength/2 + totallength*0.86, widths.rightsidepic, totallength*0.08, colors["rightside"].rectangleclose, postGUI )
	dxDrawText ( "Schließen", rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2, screenY*0.5-totallength/2 + totallength*0.86, rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2+widths.rightsidepic, screenY*0.5-totallength/2 + totallength*0.86+totallength*0.08, colors["rightside"].textclose, textsizes.close, fonts.close, "center", "center", false, false, postGUI )
end

local function calculatePicWidthLength ( )
	picswidthint = math.ceil ( math.sqrt ( indexespertype[chosentype] ) )
	picslengthint = math.ceil ( indexespertype[chosentype] / picswidthint )
	picswidth = ( widths.picstotal - ( picswidthint + 1 ) * widthgapbetweenpics ) / picswidthint
	picslength = ( totallength - ( picslengthint + 1 ) * lengthgapbetweenpics ) / picslengthint
end

local function clickClothesShop ( button, state, x, y )
	if button =="left" and state == "down" then
		if x >= screenX*0.5 - totalwidth/2 and x <= screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal + widths.rightsidetotal and y >= screenY*0.5-totallength/2 and y <= screenY*0.5-totallength/2+totallength then
			local rightsideX = screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal
			if x <= screenX*0.5 - totalwidth/2 + widths.clothestype then
				chosenindex = 0
				chosentype = math.floor ( ( y - (screenY*0.5-totallength/2) ) / totallength * 18 )
				calculatePicWidthLength ( )
			elseif x <= screenX*0.5 - totalwidth/2 + widths.clothestype + widths.picstotal then
				local newchosenindex = math.floor ( ( x - (screenX*0.5 - totalwidth/2 + widths.clothestype) ) / ( widths.picstotal-2*widthgapbetweenpics ) * picswidthint )  +  picswidthint * math.floor ( ( y - (screenY*0.5-totallength/2) ) / ( totallength-2*lengthgapbetweenpics ) * picslengthint )   
				if newchosenindex ~= chosenindex then
					chosenindex = newchosenindex
				end
			elseif x >= rightsideX +(widths.rightsidetotal-widths.rightsidepic)/2 and y >= screenY*0.5-totallength/2 + totallength*0.76 and x <= rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2+widths.rightsidepic and y <= screenY*0.5-totallength/2 + totallength*0.76+totallength*0.08 then
				if boughtindexes[chosentype][chosenindex] then
					triggerServerEvent ( "addremoveCloth_Bonus", localPlayer, chosentype, chosenindex )
				else
					triggerServerEvent ( "buyCloth_Bonus", localPlayer, chosentype, chosenindex )
				end
			elseif x >= rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2 and y >= screenY*0.5-totallength/2 + totallength*0.86 and x <= rightsideX + (widths.rightsidetotal-widths.rightsidepic)/2+widths.rightsidepic and y <= screenY*0.5-totallength/2 + totallength*0.86+totallength*0.08 then
				closeClothesShop()
			end
		end
	end
end

function closeClothesShop ( )
	removeEventHandler ( "onClientRender", root, drawClothesShop )
	removeEventHandler ( "onClientClick", root, clickClothesShop )
	showCursor ( false )
	showing = false
end

addEventHandler ( "openClothShop_Bonus", root, function ( array )
	if not showing then
		chosentype = 0
		chosenindex = 0
		showing = true
		local counter = 0
		for i=0, 17 do
			if typesactivated[i] then
				originaltype[counter] = i
				counter = counter + 1
			end
		end
		boughtindexes = {}
		if type ( array ) == "table" then
			for clothtype=0, 17 do
				boughtindexes[clothtype] = {}
				if array[clothtype] then
					for index, value in pairs ( array[clothtype] ) do
						boughtindexes[clothtype][index] = value	
					end
				end
			end
		end
		calculatePicWidthLength()
		showCursor ( true )
		addEventHandler ( "onClientRender", root, drawClothesShop )
		addEventHandler ( "onClientClick", root, clickClothesShop )
	end
end )

addEventHandler ( "onClientResourceStart", resourceRoot, function ( )
	for i=0, 17 do
		for j=0, 100 do
			if fileExists ( picpath[1].."Type"..i.."index"..j..picpath[2] ) then
				indexespertype[i] = ( indexespertype[i] or 0 ) + 1
			else
				break
			end
		end
	end
end )

addEventHandler ( "boughtCloth_Bonus", root, function ( type, index )
	boughtindexes[type][index] = true
end )

addEventHandler ( "addedremovedCloth_Bonus", root, function ( type, index, added )
	if added == "added" then
		for i, v in pairs ( boughtindexes[type] ) do
			if v == "added" then
				boughtindexes[type][i] = true
			end
		end
	end
	boughtindexes[type][index] = added
end )