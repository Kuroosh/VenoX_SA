local achievment = {}
achievmentSound = false

function showAchievment (id, name, desc, xp, money, pic)

    achievment[#achievment+1] = { name, desc, xp, money, pic, getTickCount(), id }
    print(#achievment)
    print(name)

end
addEvent ( "showAchievment", true )
addEventHandler ( "showAchievment", getRootElement(), showAchievment )



local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 16)
local dxfont1_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 14)

function drawAchievment ()
    if achievment[1] then
        for i=1, 1, -1 do
            if getTickCount() - achievment[i][6] < 10000 then
                local screenX, screenY = guiGetScreenSize()
                local sx, sy = screenX/1366, screenY/768
                dxDrawRectangle(sx*430, sy*10, sx*508, sy*155, tocolor(0, 0, 0, 165), false)
                dxDrawRectangle(sx*430, sy*7, sx*508, sy*3, tocolor(0, 105, 145, 254), false)
                dxDrawText("ACHIEVMENT UNLOCKED", sx*430, sy*10, sx*938, sy*53, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
                dxDrawImage(sx*436, sy*58, sx*111, sy*102, "anzeigen/achievments/achievmentPictures/"..achievment[i][5], 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawText("Achievment: "..achievment[i][1].."", sx*551, sy*53, sx*938, sy*89, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "center", false, false, false, false, false)
                dxDrawText("Achievment: "..achievment[i][1].."", sx*551, sy*53, sx*938, sy*89, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "center", false, false, false, false, false)
                dxDrawRectangle(sx*430, sy*50, sx*508, sy*3, tocolor(0, 105, 145, 254), false)
                dxDrawText(" "..achievment[i][2].."", sx*551, sy*89, sx*938, sy*125, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "left", "center", false, false, false, false, false)
                dxDrawRectangle(sx*551, sy*86, sx*387, sy*3, tocolor(0, 105, 145, 254), false)
               
                dxDrawText(" + "..achievment[i][4].." $", sx*551 + sx*1, sy*125 + sy*1, sx*701 + sx*1, sy*165 + sy*1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
                dxDrawText(" + "..achievment[i][4].." $", sx*551, sy*125, sx*701, sy*165, tocolor(0, 125, 0, 254), 1.00, "pricedown", "center", "top", false, false, false, false, false)
                
                dxDrawText("+ "..achievment[i][3].." EXP", sx*711 + sx*1, sy*125 + sy*1, sx*861 + sx*1, sy*165 + sy*1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
                dxDrawText("+ "..achievment[i][3].." EXP", sx*711, sy*125, sx*861, sy*165, tocolor(0, 103, 137, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)

				if achievmentSound == false then
					if tonumber(achievment[i][7]) == 13 then
						playSound("anzeigen/achievments/weed.mp3")
					else
						playSound("anzeigen/achievments/achievment.mp3")
					end
					createTrayNotification( "Erolg: "..achievment[i][1], "info" )
					achievmentSound = true
				end
            else
                table.remove ( achievment, i )
				
				if achievment[1] then
					achievment[1][6] = getTickCount()
					achievmentSound = false
				end
            end
        end
    end
end
addEventHandler ( "onClientRender", root, drawAchievment )
