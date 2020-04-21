-- #######################################
-- ## Name: 	Radar				    ##
-- ## Author:	Vandam					##
-- #######################################

-- dxMoveable
screenW, screenH = guiGetScreenSize()

sWidth, sHeight = guiGetScreenSize()
Auflosung_x = 1600
Auflosung_y = 900
px = sWidth/Auflosung_x
py = sHeight/Auflosung_y

local lp = getLocalPlayer()

local zoomwert= 1
local RadarisVisible = false
radarRenderTarget = dxCreateRenderTarget(500*px, 500*py, true)
radarRenderTarget2 = dxCreateRenderTarget(360*px, 230*py, true)
radarRenderTarget3 = dxMoveable:createMoveable(368*px, 255*py, true)
radarRenderTarget3.posX, radarRenderTarget3.posY = 0*px, 691*py

wegTable={}
function Radar_func ()
	if getElementInterior(getLocalPlayer()) == 0 then
		local posx,  posy, posz = getElementPosition(lp)
		local rotx, roty, rotz = getElementRotation(lp)
		local leben=getElementHealth(lp)
		local ruestung=getPedArmor(lp)
		local cam = getCamera()
		local _, _, camRotZ = getElementRotation(cam)
		
		if isPedInVehicle(lp) then
			if (not getPedOccupiedVehicle(lp)) then return end
			local speedx, speedy, speedz = getElementVelocity(getPedOccupiedVehicle(lp))
			local actualspeed = ((speedx^2 + speedy^2 + speedz^2)^(0.5))*180
			if actualspeed<120 then
				if zoomwert>1 then 
					zoomwert=zoomwert-0.03
				else
					zoomwert=1
				end
			else
				if zoomwert<2 then
					zoomwert=zoomwert+0.03
				else
					zoomwert=2
				end
			end
		else
			zoomwert = zoomwert
		end		
		
		local minStreamPosX,maxStreamPosX,minStreamPosY,maxStreamPosY=posx-300*px*zoomwert,posx+300*px*zoomwert,posy-300*py*zoomwert,posy+300*py*zoomwert
		local mapx = math.floor(posx*-1-3000)
		local mapy = math.floor(posy-3000)
		
		if radarRenderTarget  then
			dxSetRenderTarget(radarRenderTarget)
			dxDrawImage (0*px,  0*px, 500*px, 500*py,"images/water.jpg")
			dxDrawImage ((mapx/zoomwert+250)*px,(mapy/zoomwert+250)*py, (6000/zoomwert)*px, (6000/zoomwert)*py,"images/radar.jpg")
			if (#wegTable > 0) then
				for i,wayPoint in ipairs(wegTable) do
					if minStreamPosX<wegTable[i].posX and maxStreamPosX >wegTable[i].posX and minStreamPosY<wegTable[i].posY and maxStreamPosY>wegTable[i].posY then
						if wegTable[i+1] then
							local umgerechnetx1 = (wegTable[i].posX-posx)/zoomwert+251-1/zoomwert
							local umgerechnety1 = (posy-wegTable[i].posY)/zoomwert+251-1/zoomwert
							local umgerechnetx2 = (wegTable[i+1].posX-posx)/zoomwert+251-1/zoomwert
							local umgerechnety2 = (posy-wegTable[i+1].posY)/zoomwert+251-1/zoomwert
							dxDrawLine(umgerechnetx1*px,umgerechnety1*py,umgerechnetx2*px,umgerechnety2*py,gpsColorRed,8/zoomwert)
						else
							local umgerechnetx1 = (wegTable[i].posX-posx)/zoomwert+254-4/zoomwert
							local umgerechnety1 = (posy-wegTable[i].posY)/zoomwert+254-4/zoomwert
							local umgerechnetx2 = (lastMarkerPositionX-posx)/zoomwert+254-4/zoomwert
							local umgerechnety2 = (posy-lastMarkerPositionY)/zoomwert+254-4/zoomwert
							dxDrawLine(umgerechnetx1*px,umgerechnety1*py,umgerechnetx2*px,umgerechnety2*py,gpsColorRed,8/zoomwert)
						end
					end
				end
			end
			for i, row in pairs(getElementsByType("blip")) do
				local blipx, blipy, blipz=getElementPosition(row)
				if minStreamPosX<blipx and maxStreamPosX>blipx and minStreamPosY<blipy and maxStreamPosY>blipy then
					local blipicon=getBlipIcon(row)
					if blipicon == 0 then
						if posz<blipz-5 then
							blipicon="up"
						elseif posz>blipz+5 then
							blipicon="down"
						else
							blipicon="square"
						end
					end
					local blipsize=getBlipSize(row)
					local blippath = "images/"..blipicon..".png"
					local umgerechnetx = (blipx-posx)/zoomwert+250-blipsize*7.5/zoomwert
					local umgerechnety = (posy-blipy)/zoomwert+250-blipsize*7.5/zoomwert
					if blipicon == "up" or blipicon == "down" or blipicon == "square" then
						local r, g, b = getBlipColor(row)
						dxDrawImage(umgerechnetx*px,  umgerechnety*py, (15*(blipsize/zoomwert))*px, (15*(blipsize/zoomwert))*py, blippath, camRotZ*-1, 0, 0, tocolor(r, g, b, 255))
					else
						dxDrawImage(umgerechnetx*px,  umgerechnety*py, (15*(blipsize/zoomwert))*px, (15*(blipsize/zoomwert))*py, blippath, camRotZ*-1)
					end
				end
			end
			
			for i, row in pairs(getElementsByType("radararea")) do
				local areaX, areaY=getElementPosition(row)
				local areaSizeX,areaSizeY=getRadarAreaSize(row)
				if minStreamPosX<areaX+areaSizeX and maxStreamPosX>areaX and minStreamPosY<areaSizeY+areaSizeY and maxStreamPosY>areaSizeY then
					local areaR,areaG,areaB,areaA=getRadarAreaColor(row)
					local umgerechnetAreaX1 = (areaX+areaSizeX-posx)/zoomwert+250
					local umgerechnetAreaY1 = (posy-areaSizeY-areaY)/zoomwert+250
					local umgerechnetAreaX2 = (areaX-posx)/zoomwert+250
					local umgerechnetAreaY2 = (posy-areaY)/zoomwert+250
					dxDrawRectangle(umgerechnetAreaX1*px,  umgerechnetAreaY1*py,(umgerechnetAreaX2-umgerechnetAreaX1)*px,(umgerechnetAreaY2-umgerechnetAreaY1)*py, tocolor(areaR,areaG,areaB,areaA))
				end
			end
			dxDrawImage( 235*px, 235*py, 30*px, 30*py,"images/spielerpfeil.png",rotz*-1,  0,  0,  tocolor(255, 255, 255, 255))            
			dxSetRenderTarget()  
			
			if getElementInterior(getLocalPlayer()) == 0 then
				dxSetRenderTarget(radarRenderTarget2, true)
					dxDrawImage(-70*px, -77.5*py, 500*px, 500*py, radarRenderTarget, camRotZ)
				dxSetRenderTarget()
				dxSetRenderTarget(radarRenderTarget3.renderTarget, true)
				dxSetBlendMode("modulate_add")
				dxDrawRectangle(0*px, 0*py, 338*px, 208*py, tocolor(0, 187, 0, 200))
				
				dxSetBlendMode("blend")
				dxDrawImage(4*px, 4*py, 330*px, 200*py, radarRenderTarget2)
				local x, y, z = getElementPosition ( getLocalPlayer() )
				dxDrawText ( getZoneName(x, y, z, true)..", "..getZoneName(x, y, z), 170*px, 5*py, 58*px, 188*py, tocolor(0, 0, 0, 255), 1, "default-bold", "left", "top", false, false  )
				dxSetRenderTarget()
				
				--dxDrawImage( 50*px, 620*py, 360*px, 230*py, radarRenderTarget2,0,0,0 )
				dxDrawImage(radarRenderTarget3.posX, radarRenderTarget3.posY, radarRenderTarget3.w, radarRenderTarget3.h, radarRenderTarget3.renderTarget, 0, 0, 0, tocolor(255, 255, 255, gpsAlpha))
			end
		end
	end
end


function toggleRadar (state)
	if (state == true) then
		if (not RadarisVisible) then
			addEventHandler('onClientRender', root,  Radar_func)
			RadarisVisible = true
		else
			RadarisVisible = false
			outputDebugString("Das Radar für "..getPlayerName(lp).." konnte nicht eingeblendet werden! Es ist bereits eingeblendet!", 2)
		end
	elseif (state == false) then
		if (RadarisVisible) then
			removeEventHandler('onClientRender', root,  Radar_func)
			RadarisVisible = false
		else
			RadarisVisible = true
			outputDebugString("Das Radar für "..getPlayerName(lp).." konnte nicht ausgeblendet werden! Es ist bereits ausgeblendet!", 2)
		end
	end
end
        
local bool = true
toggleRadar(bool)
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function ()
	setPlayerHudComponentVisible("radar", false)
	bindKey("F11", "down", function ()
		bool = (not RadarisVisible)
		toggleRadar(bool)
	end)
end
)
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), function ()
	setPlayerHudComponentVisible("radar", true)
end
)

