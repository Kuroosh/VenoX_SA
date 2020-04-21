function getCursorArea (x1,y1,w1,h1)
	if isCursorShowing() then
	local mx,my = getCursorPosition()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
    	if cursorx > x1 and cursorx < x1 + w1 and cursory > y1 and cursory < y1 + h1 then
        	return true
    	else
        	return false
    	end
	else
    	return false
	end
end

starttime44 = {}
endtime44 = {}
local x,y, endx, endy, easing, time = {},{},{},{}, {},{}
function setDxAnimation( x1, y1, endx1, endy1, easing1, time1, id)
	if not id then id = 1 end
	starttime44[id] = getTickCount()
	x[id], y[id], endx[id], endy[id], easing[id], time[id] = x1, y1, endx1, endy1, easing1, time1
	endtime44[id] = starttime44[id]+time[id]
end

function getAnimationValue(id)
		if not id then id = 1 end
		local now = getTickCount()
		local elapsedTime = now - starttime44[id]
		local duration = endtime44[id] - starttime44[id]
		local progress = elapsedTime / duration
		local Sx,Sy = guiGetScreenSize()
		local ex, ey = interpolateBetween(
			x[id], y[id], 0,
			endx[id], endy[id], 0,
			progress, easing[id])
		return ex, ey
end



