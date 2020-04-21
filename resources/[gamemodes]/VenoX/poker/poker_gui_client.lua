local img
local pokerCards = {}

function createPokerCard ( card, x, y, w, h, parentElement )

	if card then
		if card > -1 and card <= 52 and formPokerNumber ( card ) == card then
			if card == 0 then
				img = guiCreateStaticImage(x,y,w,h,"images/cards/images/back.png",false,parentElement)
				guiSetAlpha(img,1)
			elseif not ( getCardType ( card ) == 10 or getCardType ( card ) == 11 or getCardType ( card ) == 12 ) then
				img = guiCreateStaticImage(x,y,w,h,"images/cards/images/bg.png",false,parentElement)
				guiSetAlpha(img,1)
				local pfad = "images/cards/"..pokerColors[getCardColor(card)].."/"..cardIDTypeName[getCardType(card)].."_"..pokerColorsShort[getCardColor(card)]..".png"
				
				gImage["cardDeko1"..cardNR] = guiCreateStaticImage(0.0373,0.0306,0.1716,0.1179,pfad,true,img)
				guiSetAlpha(gImage["cardDeko1"..cardNR],1)
				gImage["cardDeko2"..cardNR] = guiCreateStaticImage(0.7985,0.8646,0.1866,0.1266,pfad,true,img)
				guiSetAlpha(gImage["cardDeko2"..cardNR],1)
				gImage["cardDeko3"..cardNR] = guiCreateStaticImage(0.291,0.3231,0.4403,0.3231,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
				guiSetAlpha(gImage["cardDeko3"..cardNR],1)
				gImage["cardDeko4"..cardNR] = guiCreateStaticImage(0.0448,0.8515,0.2015,0.1354,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
				guiSetAlpha(gImage["cardDeko4"..cardNR],1)
				gImage["cardDeko5"..cardNR] = guiCreateStaticImage(0.7687,0.0218,0.2015,0.1354,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
				guiSetAlpha(gImage["cardDeko5"..cardNR],1)
			else
				img = guiCreateStaticImage(x,y,w,h,"images/cards/images/bg.png",false,parentElement)
				guiSetAlpha(img,1)
				local pfad = "images/cards/"..pokerColors[getCardColor(card)].."/"..cardIDTypeName[getCardType(card)].."_"..pokerColorsShort[getCardColor(card)]..".png"
				
				gImage["cardDeko1"..cardNR] = guiCreateStaticImage(0.0694,0.1398,0.8681,0.75,"images/cards/images/"..getFittingPicture(card)..".png",true,img)
				gImage["cardDeko2"..cardNR] = guiCreateStaticImage(0.792,0.8475,0.168,0.1243,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,gImage["cardDeko1"..cardNR])
				gImage["cardDeko3"..cardNR] = guiCreateStaticImage(0.0347,0.0339,0.125,0.0975,pfad,true,img)
				gImage["cardDeko4"..cardNR] = guiCreateStaticImage(0.8542,0.9025,0.125,0.0975,pfad,true,img)
				gImage["cardDeko5"..cardNR] = guiCreateStaticImage(0.0903,0.1568,0.1458,0.0847,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
			end
			if img then
				blackJackCardImages[img] = true
				return img
			end
		end
	end
	return false
end