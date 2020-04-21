web = ("http://venox-reallife.com/http/reg.html")
trailer = false
alpha1 = 0
alpha2 = 0
alpha3 = 0
alpha4 = 0
alpha5 = 0
alhpa6 = 0
rot1 = 0 
used1 = false
used2 = true
used3 = true
show = false
local sx, sy = guiGetScreenSize()
local spx, spy= 1920, 1080
local px, py = (sx/spx) , (sy/spy)

local _dxDrawLine = dxDrawLine
local function dxDrawLine ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    array[6] = array[6]*py
    return _dxDrawLine ( unpack ( array ) )
end

local _dxDrawRectangle = dxDrawRectangle
local function dxDrawRectangle ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawRectangle ( unpack ( array ) )
end

local _dxDrawText = dxDrawText
local function dxDrawText ( ... )
    local array = { ... }
    array[2] = array[2]*px
    array[3] = array[3]*py
    array[4] = array[4]*px
    array[5] = array[5]*py
    array[7] = array[7]*py
    return _dxDrawText ( unpack ( array ) )
end

local _dxDrawImage = dxDrawImage
local function dxDrawImage ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawImage ( unpack ( array ) )
end


addEvent("showTrailerVenoXReallife", true)
addEventHandler( "showTrailerVenoXReallife", getLocalPlayer(), function()
trailer = true
end)
addEvent("ShowRegisterGui", true)
function back()
showChat(false)
--screenWidth, screenHeight = guiGetScreenSize()
webBrowser = createBrowser(1980, 1080, false, false)
addEventHandler("onClientBrowserCreated", webBrowser, 
	function()
		loadBrowserURL(webBrowser, web)
		if trailer == true then
			trailerfunc()
			addEventHandler("onClientRender", root, rtrailer)
			addEventHandler("onClientRender", root, rendertrailer)
		else
			addEventHandler("onClientRender", root, webBrowserRender)
		end
	end)
end
addEventHandler("ShowRegisterGui", root, back) 
function webBrowserRender()
	dxDrawImage(0, 0, 1980, 1080, webBrowser, 0, 0, 0, tocolor(255,255,255,255), false)
end

function rtrailer()
dxDrawImage(0, 0, 1980, 1080, webBrowser, 0, 0, 0, tocolor(255,255,255,255), false)
end
function trailerfunc()
	setTimer(function()
		-- TRAILER 1--
		if used1 == false then
			if alpha1 == 80 then
				used1 = true
					setTimer(function()
							if not alpha1 == 0 then
								alpha1 = alpha1-1
							else
								used2 = false
								alpha1 = 0
								used1 = true
							end
					end, 70, 0)
			end
			alpha1 = alpha1+1
		end	
		--TRAILER 2--
		if used2 == false then
			if alpha2 == 80 then
				used2 = true
					setTimer(function()
							if not alpha2 == 0 then
								alpha2 = alpha2-1
							else
								used3 = false
								alpha2 = 0
								used2 = true
							end
					end, 70, 0)
			end
			alpha2 = alpha2+1
		end	
		--TRAILER 3--
		if used3 == false then
			if alpha3 == 80 then
				used3 = true
					setTimer(function()
							if not alpha3 == 0 then
								alpha3 = alpha3-1
							else
								alpha3 = 0
								used3 = true
								if not show == true then
									show = true
									removeEventHandler("onClientRender", root, rendertrailer)
									addEventHandler("onClientRender", root, render1)
									setTimer(function() addEventHandler("onClientRender", root, render3) end, 1000, 1)
									setTimer(function() 
										addEventHandler("onClientRender", root, render0) 
											setTimer(function()
												if rot1 == 0 then
													setTimer(function()
													setTimer(function()
														rot1 = rot1+1
													end, 50, 360)
													end, 50, 4)
												end
											end, 1000, 0)
									end, 3000, 1)
									setTimer(function() removeEventHandler("onClientRender", root, render3) end, 10000, 1)
									setTimer(function() removeEventHandler("onClientRender", root, render0) end, 10000, 1)
									setTimer(function() removeEventHandler("onClientRender", root, render1) end, 10000, 1)
									setTimer(function() addEventHandler("onClientRender", root, renderreggui) end, 10000, 1)
									setTimer(staticregui,10000, 1)
								end
							end
					end, 70, 0)
			end
			alpha3 = alpha3+1
		end	
	end, 100,0)
end
function rendertrailer()
        --dxDrawRectangle(0, 0, 1920, 1080, tocolor(0, 0, 0, 255), false)
        dxDrawText("Als wir sagten, der 01.12.2017 wird euch umhauen", 404, 443, 1550, 525, tocolor(255, 255, 255, alpha1), 4.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("haben wir das nicht nur aus Promotion gesagt sondern", 381, 443, 1613, 519, tocolor(254, 254, 254, alpha2), 4.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("weil wir es einfach nur ernst meinten.", 561, 445, 1396, 509, tocolor(254, 254, 254, alpha3), 4.00, "default", "left", "top", false, false, false, false, false)
end
function render1()
        --dxDrawRectangle(0, 0, 1920, 1080, tocolor(0, 0, 0, 255), false)
        dxDrawImage(343, 331, 591, 285, "anzeigen/register/trailerstuff/1.png", 0, 0, 0, tocolor(0, 171, 237, 255), false)
end

function render3()
dxDrawImage(554, 331, 517, 265, "anzeigen/register/trailerstuff/3.png", rot1, 0, 0, tocolor(255, 255, 255, 255), false)
end

function render0()
dxDrawImage(783, 298, 713, 378, "anzeigen/register/trailerstuff/0.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

function renderreggui()
        dxDrawLine(843 - 1, 474 - 1, 843 - 1, 505, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(1089, 474 - 1, 843 - 1, 474 - 1, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(843 - 1, 505, 1089, 505, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(1089, 505, 1089, 474 - 1, tocolor(29, 192, 255, 199), 1, true)
        dxDrawRectangle(843, 474, 246, 31, tocolor(17, 188, 255, 10), true)
        dxDrawText("Passwort", 913, 438, 1013, 464, tocolor(29, 192, 255, 199), 1.60, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("", 848, 479, 1079, 505, tocolor(255, 255, 255, 255), 1.30, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Passwort (WDH)", 877, 537, 1056, 565, tocolor(29, 192, 255, 199), 1.60, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(843 - 1, 575 - 1, 843 - 1, 605, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(1089, 575 - 1, 843 - 1, 575 - 1, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(843 - 1, 605, 1089, 605, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(1089, 605, 1089, 575 - 1, tocolor(29, 192, 255, 199), 1, true)
        dxDrawRectangle(843, 575, 246, 30, tocolor(17, 188, 255, 10), true)
        dxDrawText("", 848, 579, 1079, 605, tocolor(255, 255, 255, 255), 1.30, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Alter", 933, 622, 989, 648, tocolor(29, 192, 255, 199), 1.70, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(938 - 1, 673 - 1, 938 - 1, 706, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(979, 673 - 1, 938 - 1, 673 - 1, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(938 - 1, 706, 979, 706, tocolor(29, 192, 255, 199), 1, true)
        dxDrawLine(979, 706, 979, 673 - 1, tocolor(29, 192, 255, 199), 1, true)
        dxDrawRectangle(938, 673, 41, 33, tocolor(17, 188, 255, 10), true)
        dxDrawText("", 943, 677, 984, 701, tocolor(255, 255, 255, 255), 1.50, "clear", "left", "top", false, false, false, false, false)
        dxDrawImage(729, 42, 462, 374, "anzeigen/register/trailerstuff/2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine(878 - 1, 810 - 1, 878 - 1, 855, tocolor(29, 192, 255, 199), 1, false)
        dxDrawLine(1047, 810 - 1, 878 - 1, 810 - 1, tocolor(29, 192, 255, 199), 1, false)
        dxDrawLine(878 - 1, 855, 1047, 855, tocolor(29, 192, 255, 199), 1, false)
        dxDrawLine(1047, 855, 1047, 810 - 1, tocolor(29, 192, 255, 199), 1, false)
        dxDrawRectangle(878, 810, 169, 45, tocolor(17, 188, 255, 10), false)
        dxDrawText("Registrieren", 910, 820, 1020, 845, tocolor(255, 255, 255, 255), 1.40, "clear", "left", "top", false, false, false, false, false)
    	dxDrawText("", 854, 721, 1109, 763, tocolor(255, 0, 0, 255), 1.20, "clear", "left", "top", false, false, false, false, false)
end

function staticregui()
        passwortedt = guiCreateEdit(843, 473, 247, 42, "", false)
        addEventHandler("onClientMouseEnter", passwortedt, function() guiSetAlpha(passwortedt, 0.40) end)
		addEventHandler("onClientMouseLeave", passwortedt, function() guiSetAlpha(passwortedt, 0.00) end)
        guiSetAlpha(passwortedt, 0.00)
        guiEditSetMasked(passwortedt, true)


        passwortwdhbtn = guiCreateEdit(842, 570, 247, 42, "", false)
        guiSetAlpha(passwortwdhbtn, 0.00)
        guiEditSetMasked(passwortwdhbtn, true)


        alteredt = guiCreateEdit(933, 667, 56, 42, "", false)
        guiSetAlpha(alteredt, 0.00)
        guiEditSetMasked(alteredt, true)
        guiEditSetMaxLength(alteredt, 22)


        passwortbtn = guiCreateStaticImage(842, 473, 247, 32, "App/files/white.png", false)
        addEventHandler("onClientMouseEnter", passwortbtn, function() guiSetAlpha(passwortbtn, 0.40) end)
		addEventHandler("onClientMouseLeave", passwortbtn, function() guiSetAlpha(passwortbtn, 0.00) end)
        guiSetAlpha(passwortbtn, 0.00)


        passwortbtnwdh = guiCreateStaticImage(843, 573, 247, 32, "App/files/white.png", false)
        addEventHandler("onClientMouseEnter", passwortbtnwdh, function() guiSetAlpha(passwortbtnwdh, 0.40) end)
		addEventHandler("onClientMouseLeave", passwortbtnwdh, function() guiSetAlpha(passwortbtnwdh, 0.00) end)
        guiSetAlpha(passwortbtnwdh, 0.00)


        alterbtnreg = guiCreateStaticImage(938, 674, 41, 32, "App/files/white.png", false)
        addEventHandler("onClientMouseEnter", alterbtnreg, function() guiSetAlpha(alterbtnreg, 0.40) end)
		addEventHandler("onClientMouseLeave", alterbtnreg, function() guiSetAlpha(alterbtnreg, 0.00) end)
        guiSetAlpha(alterbtnreg, 0.00)


        regbtn = guiCreateStaticImage(879, 810, 168, 45, "App/files/white.png", false)
        addEventHandler("onClientMouseEnter", regbtn, function() guiSetAlpha(regbtn, 0.40) end)
		addEventHandler("onClientMouseLeave", regbtn, function() guiSetAlpha(regbtn, 0.00) end)
        guiSetAlpha(regbtn, 0.00) 
end