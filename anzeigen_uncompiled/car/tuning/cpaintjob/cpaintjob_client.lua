
--[[
function loadPaintjobRespawn(paintjobname, vehicle)

   --local paintjobname = getElementData ( vehicle, "cpaintjob", tostring(paintjobname) )
   if paintjobname == "" or paintjobname == nil then 
   else
        myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/"..paintjobname )
        shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
        engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", vehicle )
        engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", vehicle )
        engineApplyShaderToWorldTexture(shader_cars, "?emap*", vehicle)
        dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
        --vnxSetElementData ( vehicle, "cpaintjob", paintjobname )
   end
end 
addEvent( "loadpaintjobrespawn", true )
addEventHandler( "loadpaintjobrespawn", root, loadPaintjobRespawn ) 
]]


addEventHandler("onClientElementStreamIn", root, function()
	if getElementType(source) == "vehicle" then
		local paintjobname = getElementData ( source, tostring("cpaintjob"))
        -- outputDebugString(paintjobname)
			addVehiclePaintjob(paintjobname, source)
	end
end)

addEventHandler("onClientElementStreamOut", root, function()
	if getElementType(source) == "vehicle" then
      local paintjobname = getElementData ( source, tostring("cpaintjob"))
      --outputDebugString(paintjobname)
      if paintjobname == "" or paintjobname == nil or paintjobname == false then 
      else
			removeVehiclePaintjob(source)
		end
	end
end)



function addVehiclePaintjob(paintjobname, source)
   if paintjobname == "" or paintjobname == nil or paintjobname == false then 
   else
        myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/"..paintjobname )
        shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
        engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", source )
        engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", source )
        engineApplyShaderToWorldTexture(shader_cars, "?emap*", source)
        dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
        --vnxSetElementData ( vehicle, "cpaintjob", paintjobname )
   end
end
addEvent( "loadpaintjobrespawn1", true )
addEventHandler( "loadpaintjobrespawn1", getRootElement(), loadPaintjobRespawn ) 

function removeVehiclePaintjob(source)
   engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", source )
end