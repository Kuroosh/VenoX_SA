--
-- c_car_paint.lua
--

addEventHandler( "onClientResourceStart", resourceRoot,
	function()

		-- Version check
		if getVersion ().sortable < "1.1.0" then
			outputChatBox( "Version nicht kompatibel." )
			return
		end

		-- Create shader
		local myShader, tec = dxCreateShader ( "car_paint.fx" )

		if not myShader then
			outputChatBox( "Konnte Carshader nicht laden!" )
		else

			-- Set textures
			local textureVol = dxCreateTexture ( "images/smallnoise3d.dds" );
			local textureCube = dxCreateTexture ( "images/cube_env256.dds" );
			dxSetShaderValue ( myShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( myShader, "sReflectionTexture", textureCube );

			-- Apply to world texture
			engineApplyShaderToWorldTexture ( myShader, "vehiclegrunge256" )
			engineApplyShaderToWorldTexture ( myShader, "?emap*" )
		end
	end
)
