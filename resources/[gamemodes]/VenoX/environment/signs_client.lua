--|-------------------------------------------------------------------|--
--|                      (c) by Florian                               |--
--|-------------------------------------------------------------------|--

local noparksign1 = dxCreateTexture("images/roadsign01_128.png")
local noparksign2 = dxCreateTexture("images/noparking2_128.png")

addEventHandler("onClientResourceStart",resourceRoot,function()
local NoParkShader1 = dxCreateShader("shaders/NoParkShader.fx")
local NoParkShader2 = dxCreateShader("shaders/NoParkShader.fx")
	if NoParkShader1 and NoParkShader2 then
		dxSetShaderValue(NoParkShader1, "signs", noparksign1)
		dxSetShaderValue(NoParkShader2, "signs", noparksign2)
		
		engineApplyShaderToWorldTexture(NoParkShader1, "roadsign01_128")
		engineApplyShaderToWorldTexture(NoParkShader2, "NoParking2_128")
	end 
end)

--|-------------------------------------------------------------------|--
--|                      (c) by Florian                               |--
--|-------------------------------------------------------------------|--