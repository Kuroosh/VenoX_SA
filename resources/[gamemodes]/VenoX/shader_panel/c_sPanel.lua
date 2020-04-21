--
-- c_sPanel.lua
--

bEffectEnabled = false

Settings = {}
Settings.var = {}
--------------------------------
-- Start Resource
--------------------------------
addEventHandler( "onClientResourceStart", resourceRoot,
	function()
    enablePanelFx()
end
)
---------------------------------
-- DepthBuffer error handling
---------------------------------
function isDepthBufferAccessible()
 local info=dxGetStatus()
 local depthStatus=false
 Settings.var.isDepthSupported=true
    for k,v in pairs(info) do
		if string.find(k, "DepthBufferFormat") then
		depthStatus=true
		if tostring(v)=='unknown' then depthStatus=false
		  end
		end
    end
	if depthStatus==false then 
	 Settings.var.isDepthSupported=false
	end
	return depthStatus
end

---------------------------------
-- PS version
---------------------------------
function vCardPSVer()
if  Settings.var.forceSm2==true then return 2 end
 local info=dxGetStatus()
    for k,v in pairs(info) do
		if string.find(k, "VideoCardPSVersion") then
		smVersion=tostring(v)
		end
    end
	return smVersion
end


function removeDepthBufferOptions()
	
	for w,asli in ipairs(GUISP.zRemoveList) do 
	backHeight = GUISP.optionHeight[w] 
	for v,_ in ipairs(GUISP.zRemoveList[w]) do if GUISP.zRemoveList[w]=={} then return end
		for i,_ in ipairs(GUISP.optionList[w]) do  
			if guiComboBoxGetItemText(GUISP.combo[w], i)==GUISP.zRemoveList[w][v] then 
				guiComboBoxRemoveItem (GUISP.combo[w], i ) backHeight=backHeight-16 
				end 
			end
		end
	guiSetSize ( GUISP.combo[w],295,backHeight, false )
     end
 end
--------------------------------
-- Enable effects
--------------------------------
function enablePanelFx()	
	if bEffectEnabled then return end
	-- Version check
	local ver = getVersion ().sortable
	local build = string.sub( ver, 9, 13 )
	if ver < "1.3.1" then
		outputChatBox( "Version ist nicht kompatibel." )
		return
	end
	
	-- Get effect variables
	setEffectType1()
	
	-- Input texture
    myScreenSourceFull = dxCreateScreenSource( scx, scy )
	myScreenSourceBloom = dxCreateScreenSource( scx/2, scy/2 )
    myScreenSourceReflect = dxCreateScreenSource( Settings.var.CarPaintRefW, Settings.var.CarPaintRefH)
	-- Shaders
	contrastShader = dxCreateShader( "shaders/contrast.fx" )
	addBlendShader = dxCreateShader("shaders/addBlend.fx")
	bloomCombineShader = dxCreateShader( "shaders/bloom_combine.fx" )
	bloomExtractShader = dxCreateShader( "shaders/bloom_extract.fx" )
	blurHShader= dxCreateShader( "shaders/blurH.fx" )
	blurVShader = dxCreateShader( "shaders/blurV.fx" )
	brightPassShader = dxCreateShader( "shaders/brightPass.fx" )
	modulationShader = dxCreateShader( "shaders/modulation.fx" )
	paletteShader = dxCreateShader( "shaders/addPalette.fx")
	brightnessShader = dxCreateShader( "shaders/brightness.fx" )
	
	if  (build > "04811") then  if not isDepthBufferAccessible() then removeDepthBufferOptions() end
	end
	
	if Settings.var.PaletteON~=0 then palette = dxCreateTexture ( "palettes/enbpalette"..Settings.var.PaletteON..".png" ) end

	-- 1 pixel render target to store the result of scene luminance calculations
	lumTarget = dxCreateRenderTarget( 1, 1 )
	myLumina = dxCreateScreenSource( 1, 1 )
	nextLumSampleTime = 0

	-- Overlay texture
	textureVignette = dxCreateTexture ( "images/vignette1.dds" );
	textureVol = dxCreateTexture ( "images/smallnoise3d.dds" )
    textureCube = dxCreateTexture ( "images/cube_env256.dds" )
    textureCubeVeh = dxCreateTexture ( "images/cube_veh256.dds" )

	lumTemp = dxCreateScreenSource( 512, 512 )
	lumSamples = {}
	currLumSample=0
	
	-- Get list of all elements used
	effectParts = {
						myScreenSourceFull,
						myScreenSourceReflect,
						contrastShader,
						addBlendShader,
						bloomCombineShader,
						bloomExtractShader,
						brightPassShader,
						blurHShader,
						blurVShader,
						paletteShader,
						brightnessShader,
						modulationShader,
						lumTarget,
						lumTemp,
						textureVignette,
						textureVol
					}
	-- Check list of all elements used
	bAllValid = true
	for _,part in ipairs(effectParts) do
		bAllValid = part and bAllValid
	end

	bEffectEnabled = true

	if not bAllValid then
		outputChatBox( "Konnte einige Shader nicht laden." )
		disablePanelFx()
		else
	    if Settings.var.PaletteON~=0 then dxSetShaderValue( paletteShader, "sPaletteTexture", palette ) end
	end
end

--------------------------------
-- Switch effects off
--------------------------------
function disablePanelFx()
	if not bEffectEnabled then return end

	-- Destroy all shaders
	for _,part in ipairs(effectParts) do
		if part then
			destroyElement( part )
		end
	end
	effectParts = {}
	bAllValid = false
	RTPool.clear()

	-- Flag effect as stopped
	bEffectEnabled = false
end


---------------------------------
-- Settings for effect
---------------------------------
function setEffectType1()
    local v = Settings.var
	local scrX,scrY = guiGetScreenSize()
	
	v.BlurEN=0
    v.DetailEN=0
	v.ContrastON=0
	v.BloomON=0
    v.Power = 1.6 
    v.Brightness=0.32 
    v.Contrast=2.24 
	v.CutOff = 0.08
    v.ExtractThreshold=0.72

    v.DownSampleSteps=2
    v.GBlurHBloom=1.68
    v.GBlurVBloom=1.52

    v.BloomIntensity=0.94
    v.BloomSaturation=1.66
    v.BaseIntensity=0.94
    v.BaseSaturation=-0.38

    v.LumSpeed=51
    v.LumChangeAlpha=27

    v.MultAmount=0.46
    v.Mult=0.70
    v.Add=0.10
    v.ModExtraFrom=0.11
    v.ModExtraTo=0.58
    v.ModExtraMult=4

    v.MulBlend=0.82
    v.BloomBlend=0.25

    v.Vignette=0.47
	
	--Contrast speciffic
	v.BloomSaturationCO=1.66
	v.BloomIntensityCO=0.94
	v.BaseIntensityCO=0.94 
	v.BaseSaturationCO=-0.38 
	v.ExtractThresholdCO=0.72
	v.GBlurHBloomCO=1.68
	v.GBlurVBloomCO=1.52
	
	--Bloom speciffic
	v.BloomSaturationBL=0.7 
	v.BloomIntensityBL=1.0 
	v.BaseIntensityBL=1.0
	v.BaseSaturationBL=0 
	v.ExtractThresholdBL=0.08  
	v.GBlurHBloomBL=1.8
	v.GBlurVBloomBL=1.8

    -- Palette
	-- Palette 0-off 1,2 
	v.PaletteON=0
    v.timeGap = 5
    v.maxLumSamples = 50
	-- Screen
	v.R=255
    v.G=255
    v.B=255
	
	-- Carpaint 0-off 1,2 
    v.CarPaintVers=0
	v.renderDistance=50
    v.CarPaintRefW=scrX
    v.CarPaintRefH=scrY
    v.brightnessFactorPaint=0.1
	v.reflectionTranspLite=0.6
    v.brightnessFactorWShield= 0.49
    v.bumpSize=0.02 -- for car paint
    v.bumpSizeWnd=0 -- for windshields
    v.normal=1.5 -- the lower , the more normalised 0-2 (1.25)
    v.brightnessAdd=0.5 -- before bright pass
    v.brightnessMul=1.5 -- multiply after brightpass
    v.brightpassCutoff=0.16 -- 0-1
    v.brightpassPower=2 -- 1-5
    v.reflectionFlip=1 -- 0 or 1
    v.reflectionFlipAngle=0.25 -- -1,1
    v.dirtTexture=1 -- 0 or 1

	v.sProjectedXsize=0.5
	v.sProjectedXvecMul=1
	v.sProjectedXoffset=0.021
	v.sProjectedYsize=0.5
	v.sProjectedYvecMul=1
	v.sProjectedYoffset=-0.22

    -- Water
    v.WaterVers=0
	v.normalMult=0.55 
	v.gBuffAlpha= 0.39
	v.gDepthFactor= 0.035
	
	--DoF
	v.DoFON=0
	v.isDepthSupported=true
	v.blurFactor = 0.0012
	v.blurDiv = 5.2
	v.depthFactor = 0.0016

	-- Debugging
	v.forceSm2=false
    v.PreviewEnable=0
    v.PreviewPosY=0
    v.PreviewPosX=100
    v.PreviewSize=70

function toggleBloom()

    local v = Settings.var

	if v.ContrastON~=1 then
		v.BloomSaturation=v.BloomSaturationBL 
		v.BloomIntensity=v.BloomIntensityBL 
		v.BaseIntensity=v.BaseIntensityBL
	    v.BaseSaturation=v.BaseSaturationBL 
        v.ExtractThreshold=v.ExtractThresholdBL 
	    v.GBlurHBloom=v.GBlurHBloomBL
        v.GBlurVBloom=v.GBlurVBloomBL
else
		v.BloomSaturation=v.BloomSaturationCO
		v.BloomIntensity=v.BloomIntensityCO
    	v.BaseIntensity=v.BaseIntensityCO 
        v.BaseSaturation=v.BaseSaturationCO 
		v.ExtractThreshold=v.ExtractThresholdCO
		v.GBlurHBloom=v.GBlurHBloomCO
        v.GBlurVBloom=v.GBlurVBloomCO
	end
		
end	
	
-- Apply carpaint texture list
			texturegrun = {
			"predator92body128", "monsterb92body256a", "monstera92body256a", "andromeda92wing","fcr90092body128",
			"hotknifebody128b", "hotknifebody128a", "rcbaron92texpage64", "rcgoblin92texpage128", "rcraider92texpage128", 
			"rctiger92body128","rhino92texpage256", "petrotr92interior128","artict1logos","rumpo92adverts256","dash92interior128",
			"coach92interior128","combinetexpage128","hotdog92body256",
			"raindance92body128", "cargobob92body256", "andromeda92body", "at400_92_256", "nevada92body256",
			"polmavbody128a" , "sparrow92body128" , "hunterbody8bit256a" , "seasparrow92floats64" , 
			"dodo92body8bit256" , "cropdustbody256", "beagle256", "hydrabody256", "rustler92body256", 
			"shamalbody256", "skimmer92body128", "stunt256", "maverick92body128", "leviathnbody8bit256" 
			               }
--	triggerEvent("onClientChangedSettings", resourceRoot)
end

-----------------------------------------------------------------------------------
-- Carpaint , Dof and water
-----------------------------------------------------------------------------------
function depthOfField_start()
	if not dBlurHShader and not dBlurVShader then
		dBlurHShader = dxCreateShader( "shaders/dBlurH.fx" )
		dBlurVShader,tecName = dxCreateShader( "shaders/dBlurV.fx" )
		end
end
	
function depthOfField_stop()
	if dBlurHShader and dBlurVShader then
		destroyElement(dBlurHShader)
		destroyElement(dBlurVShader)
		dBlurHShader=nil
		dBlurVShader=nil
		end
end

function carpaint_staCla()
			if not carPaintShader then carPaintShader = dxCreateShader ( "shaders/car_paint.fx" ) end
			dxSetShaderValue ( carPaintShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( carPaintShader, "sReflectionTexture", textureCubeVeh );
			engineApplyShaderToWorldTexture ( carPaintShader, "vehiclegrunge256" )
			engineApplyShaderToWorldTexture ( carPaintShader, "?emap*" )
			 for _,addList in ipairs(texturegrun) do
			  engineApplyShaderToWorldTexture (carPaintShader, addList )
		     end
end		
	
function carpaint_stopCla()
	  if carPaintShader then
	         engineRemoveShaderFromWorldTexture( carPaintShader, "vehiclegrunge256" )
	         engineRemoveShaderFromWorldTexture( carPaintShader, "?emap*" )
			 for _,addList in ipairs(texturegrun) do
			     engineRemoveShaderFromWorldTexture(carPaintShader, addList )
		     end
			destroyElement(carPaintShader)
			carPaintShader=nil
	   end
end
	
function carpaint_RefSettings()
				--Set for carreflect
			dxSetShaderValue ( carGrunShader, "sCutoff",Settings.var.brightpassCutoff)
			dxSetShaderValue ( carGrunShader, "sPower", Settings.var.brightpassPower)			
			dxSetShaderValue ( carGrunShader, "sAdd", Settings.var.brightnessAdd)
			dxSetShaderValue ( carGrunShader, "sMul", Settings.var.brightnessMul)
			dxSetShaderValue ( carGrunShader, "sRefFl", Settings.var.reflectionFlip)
			dxSetShaderValue ( carGrunShader, "sRefFlan", Settings.var.reflectionFlipAngle)
			dxSetShaderValue ( carGrunShader, "sNorFac", Settings.var.normal)
			dxSetShaderValue ( carGrunShader, "minusAlpha", Settings.var.reflectionTranspLite)
		    if Settings.var.CarPaintVers==2 then dxSetShaderValue ( carGrunShader, "brightnessFactor",Settings.var.brightnessFactorPaint)  end
			if Settings.var.CarPaintVers==3 then dxSetShaderValue ( carGrunShader, "brightnessFactor",Settings.var.brightnessFactorPaint/2)  end
			dxSetShaderValue ( carGeneShader, "sCutoff",Settings.var.brightpassCutoff)
			dxSetShaderValue ( carGeneShader, "sPower", Settings.var.brightpassPower)	
			dxSetShaderValue ( carGeneShader, "sAdd", Settings.var.brightnessAdd)
			dxSetShaderValue ( carGeneShader, "sMul", Settings.var.brightnessMul)
			dxSetShaderValue ( carGeneShader, "sRefFl", Settings.var.reflectionFlip)
			dxSetShaderValue ( carGeneShader, "sRefFlan", Settings.var.reflectionFlipAngle)
			dxSetShaderValue ( carGeneShader, "sNorFac", Settings.var.normal)
            dxSetShaderValue ( carGeneShader, "brightnessFactor",Settings.var.brightnessFactorWShield) 
			
		    dxSetShaderValue ( carShatShader, "sCutoff",Settings.var.brightpassCutoff)
			dxSetShaderValue ( carShatShader, "sPower", Settings.var.brightpassPower)	
			dxSetShaderValue ( carShatShader, "sAdd", Settings.var.brightnessAdd)
			dxSetShaderValue ( carShatShader, "sMul", Settings.var.brightnessMul)
			dxSetShaderValue ( carShatShader, "sRefFl", Settings.var.reflectionFlip)
			dxSetShaderValue ( carShatShader, "sRefFlan", Settings.var.reflectionFlipAngle)
			dxSetShaderValue ( carShatShader, "sNorFac", Settings.var.normal)
			dxSetShaderValue ( carShatShader, "brightnessFactor",Settings.var.brightnessFactorWShield) 		
			
			dxSetShaderValue ( carGrunShader, "dirtTex",Settings.var.dirtTexture)
		    dxSetShaderValue ( carGrunShader, "bumpSize",Settings.var.bumpSize)
			dxSetShaderValue ( carGrunShader, "bumpSize",Settings.var.bumpSizeWnd)
				
			dxSetShaderValue ( carGrunShader, "sProjectedXsize",Settings.var.sProjectedXsize)
			dxSetShaderValue ( carGrunShader, "sProjectedXvecMul",Settings.var.sProjectedXvecMul)
			dxSetShaderValue ( carGrunShader, "sProjectedXoffset",Settings.var.sProjectedXoffset)
			dxSetShaderValue ( carGrunShader, "sProjectedYsize",Settings.var.sProjectedYsize)
			dxSetShaderValue ( carGrunShader, "sProjectedYvecMul",Settings.var.sProjectedYvecMul)
			dxSetShaderValue ( carGrunShader, "sProjectedYoffset",Settings.var.sProjectedYoffset)
			
			dxSetShaderValue ( carGeneShader, "sProjectedXsize",Settings.var.sProjectedXsize)
			dxSetShaderValue ( carGeneShader, "sProjectedXvecMul",Settings.var.sProjectedXvecMul)
			dxSetShaderValue ( carGeneShader, "sProjectedXoffset",Settings.var.sProjectedXoffset)
			dxSetShaderValue ( carGeneShader, "sProjectedYsize",Settings.var.sProjectedYsize)
			dxSetShaderValue ( carGeneShader, "sProjectedYvecMul",Settings.var.sProjectedYvecMul)
			dxSetShaderValue ( carGeneShader, "sProjectedYoffset",Settings.var.sProjectedYoffset)

			dxSetShaderValue ( carShatShader, "sProjectedXsize",Settings.var.sProjectedXsize)
			dxSetShaderValue ( carShatShader, "sProjectedXvecMul",Settings.var.sProjectedXvecMul)
			dxSetShaderValue ( carShatShader, "sProjectedXoffset",Settings.var.sProjectedXoffset)
			dxSetShaderValue ( carShatShader, "sProjectedYsize",Settings.var.sProjectedYsize)
			dxSetShaderValue ( carShatShader, "sProjectedYvecMul",Settings.var.sProjectedYvecMul)
			dxSetShaderValue ( carShatShader, "sProjectedYoffset",Settings.var.sProjectedYoffset)
					
			dxSetShaderValue ( carGrunShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( carGrunShader, "sReflectionTexture", myScreenSourceReflect );
			dxSetShaderValue ( carGeneShader, "gShatt", 0 );
			dxSetShaderValue ( carGeneShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( carGeneShader, "sReflectionTexture", myScreenSourceReflect );
			dxSetShaderValue ( carShatShader, "gShatt", 1 );
            dxSetShaderValue ( carShatShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( carShatShader, "sReflectionTexture", myScreenSourceReflect );			
			
end
	
function carpaint_staRef()
			if not carGeneShader then carGeneShader = dxCreateShader ( "shaders/car_refgene.fx",1,Settings.var.renderDistance,true) end
			if not carShatShader then carShatShader = dxCreateShader ( "shaders/car_refgene.fx",1,Settings.var.renderDistance,true) end
			-- Apply to world texture
			if Settings.var.CarPaintVers==3 then carGrunShader=dxCreateShader ( "shaders/car_refgrunL.fx",1,Settings.var.renderDistance,true) end
			if Settings.var.CarPaintVers==2 then carGrunShader=dxCreateShader ( "shaders/car_refgrun.fx",1,Settings.var.renderDistance,false) end
			
			carpaint_RefSettings()
			
			engineApplyShaderToWorldTexture ( carGrunShader, "vehiclegrunge256" )
			engineApplyShaderToWorldTexture ( carGrunShader, "?emap*" )
			engineApplyShaderToWorldTexture ( carGeneShader, "vehiclegeneric256" )
			engineApplyShaderToWorldTexture ( carShatShader, "vehicleshatter128" )
	        engineApplyShaderToWorldTexture ( carGeneShader, "hotdog92glass128" )
			engineApplyShaderToWorldTexture ( carGeneShader, "okoshko" )
			
			for _,addList in ipairs(texturegrun) do
			engineApplyShaderToWorldTexture (carGrunShader, addList )
		    end	
end

function carpaint_stopRef()
	if carGrunShader and carGeneShader and carShatShader then
			engineRemoveShaderFromWorldTexture ( carGrunShader, "vehiclegrunge256" )
			engineRemoveShaderFromWorldTexture ( carGrunShader, "?emap*" )
			engineRemoveShaderFromWorldTexture ( carGeneShader, "vehiclegeneric256" )
			engineRemoveShaderFromWorldTexture ( carShatShader, "vehicleshatter128" )
	        engineRemoveShaderFromWorldTexture ( carGeneShader, "hotdog92glass128" )
			engineRemoveShaderFromWorldTexture ( carGeneShader, "okoshko" )
		 for _,addList in ipairs(texturegrun) do
			engineRemoveShaderFromWorldTexture(carGrunShader, addList )
		end
		destroyElement(carGrunShader)
		destroyElement(carGeneShader)
		destroyElement(carShatShader)
		carGrunShader=nil
		carGeneShader=nil
		carShatShader=nil
	  end
end

	
function water_startCla()
	if Settings.var.WaterVers == 2 then waterShader=dxCreateShader ( "shaders/water_ref.fx" )
			dxSetShaderValue ( waterShader, "normalMult", Settings.var.normalMult);
			dxSetShaderValue ( waterShader, "gBuffAlpha", Settings.var.gBuffAlpha);
			dxSetShaderValue ( waterShader, "gDepthFactor", Settings.var.gDepthFactor);
	end
	if Settings.var.WaterVers == 1 then waterShader=dxCreateShader ( "shaders/water.fx" ) end
	
			dxSetShaderValue ( waterShader, "sRandomTexture", textureVol )
			dxSetShaderValue ( waterShader, "sReflectionTexture", textureCube )
			engineApplyShaderToWorldTexture ( waterShader, "waterclear256" )

			setTimer(	function()
							if waterShader then
								local r,g,b,a = getWaterColor()
								if bEffectEnabled==true then dxSetShaderValue ( waterShader, "sWaterColor", r/255, g/255, b/255, a/255 ) end
							end
						end
						,100,0 )

end

function water_stopCla()
	if waterShader then
	       engineRemoveShaderFromWorldTexture(waterShader, "waterclear256" )
		   destroyElement(waterShader)
		   waterShader=nil
	end
end

----------------------------------------------------------------
-- Render
----------------------------------------------------------------
addEventHandler( "onClientHUDRender", root,
    function()
		if not bAllValid or not Settings.var or not bEffectEnabled then return end
		local v = Settings.var
		RTPool.frameStart()
		DebugResults.frameStart()
		dxUpdateScreenSource( myScreenSourceBloom )
		dxUpdateScreenSource( myScreenSourceFull )
		dxUpdateScreenSource( lumTemp )
		
		-- Get source textures
		local current1 = myScreenSourceFull
		local current2 = myScreenSourceBloom
		local sceneLuminance = lumTarget
		local tempLum

		local myPixel=countLuminanceForPalette(lumTemp,v.timeGap,v.maxLumSamples) ---- 5-time gap, 50 - table elements
		
		-- Effect path 1 (contrast, dof,palette)
		if v.ContrastON==1 then
		current1 = applyModulation( current1, sceneLuminance, v.MultAmount, v.Mult, v.Add, v.ModExtraFrom, v.ModExtraTo, v.ModExtraMult )
		current1 = applyContrast( current1, v.Brightness, v.Contrast )
		end
        
		
		if Settings.var.isDepthSupported==true then
		 if v.DoFON==1 then 
		 current1 = applyGDepthBlurH( current1, Settings.var.blurDiv,Settings.var.blurFactor,Settings.var.depthFactor )
		 current1 = applyGDepthBlurV( current1, Settings.var.blurDiv,Settings.var.blurFactor,Settings.var.depthFactor )
		 end
		end
		if (v.PaletteON)>0 then 
			current1 = applyPalette(current1,myPixel) 
		end
		
		-- Effect path 2 (bloom, palette)
		if v.BloomON==1 or v.ContrastON==1  then
		if v.ContrastON==1 and v.BloomON~=1  then tempLum=sceneLuminance 
		current2 = applyBloomExtract( current2, tempLum, v.ExtractThreshold )
		end
		if v.BloomON==1 then
		current2 = applyBrightPass( current2, v.CutOff, v.Power )
		end
		current2 = applyDownsampleSteps( current2, v.DownSampleSteps ) 
		

		current2 = applyGBlurH( current2, v.GBlurHBloom )
		current2 = applyGBlurV( current2, v.GBlurVBloom )
		if v.ContrastON==1 and v.BloomON~=1 then 
		  current2 = applyBloomCombine( current2, current1, v.BloomIntensity, v.BloomSaturation, v.BaseIntensity, v.BaseSaturation ) 
		 end
		  if (v.PaletteON)>0 then 
			current2 = applyPalette(current2,myPixel) 
	      end
		end
		-- Update texture used to calculate the scene luminance level
		if v.ContrastON==1 then updateLumSource( current1, v.LumSpeed, v.LumChangeAlpha ) end
		
		dxSetRenderTarget()
		if v.ContrastON==1 or (v.PaletteON)>0 or v.DoFON==1 then dxDrawImage( 0, 0, scx, scy, current1, 0, 0, 0, tocolor(v.R,v.G,v.B,255) ) end

		-- Bloom
		if v.BloomON==1 then
		if current2 then
				dxSetShaderValue( addBlendShader, "TEX0", current2 )
				local colA=160
				if v.ContrastON==1 then colA=100 end
				local col = tocolor(204*(v.R/255), 153*(v.G/255), 130*(v.B/255), colA)
				dxDrawImage( 0, 0, scx, scy, addBlendShader, 0,0,0, col )
			end
		end
		
		-- Draw border texture
		if v.ContrastON==1 then dxDrawImage( 0, 0, scx, scy, textureVignette, 0, 0, 0, tocolor(v.R,v.G,v.B,v.Vignette*255) ) end
		-- Get carpaint reflection
		   if Settings.var.CarPaintVers==2 or Settings.var.CarPaintVers==3 then
		      if myScreenSourceReflect then
               dxUpdateScreenSource( myScreenSourceReflect)
              end
           end
		   
		-- Debug stuff
		if v.PreviewEnable > 0.5 then
			DebugResults.drawItems ( v.PreviewSize, v.PreviewPosX, v.PreviewPosY )
		end
    end
)

----------------------------------------------------------------
-- post process items
----------------------------------------------------------------
function countMedianPixelColor(daTable)
	local sum_r,sum_g,sum_b=0,0,0
	for _,tValue in ipairs(daTable) do
	local r,g,b,a = dxGetPixelColor( tValue, 0, 0 )
		sum_r=sum_r+r
		sum_g=sum_g+g
		sum_b=sum_b+b
	end
	return {(sum_r/#daTable)/255,(sum_g/#daTable)/255,(sum_b/#daTable)/255}
end

local lastPix={1,1,1}
local lastTickCount=0
function countLuminanceForPalette(luminance,lumPause,maxLumSamples)
	if getTickCount() > lastTickCount then
		local mx,my = dxGetMaterialSize( luminance );
		local size = 1
		while ( size < mx / 2 or size < my / 2 ) do
			size = size * 2
		end
		luminance = applyResize( luminance, size, size )
		while ( size > 1 ) do
			size = size / 2
			luminance = applyDownsample( luminance, 2 )
		end
		if (currLumSample>maxLumSamples) then 
			currLumSample=0 
		end
		lumSamples[currLumSample]=dxGetTexturePixels(luminance)
		local pix=countMedianPixelColor(lumSamples)
		currLumSample=currLumSample+1
		lastPix=pix
		lastTickCount=getTickCount()+lumPause
		return pix
	else
		return lastPix
	end
end


function applyGDepthBlurH( Src, blurDiv,blur,depthFactor )
	if not Src then return nil end
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( dBlurHShader, "TEX0", Src )
	dxSetShaderValue( dBlurVShader, "gblurFactor",blur)
	dxSetShaderValue( dBlurVShader, "gDepthFactor",depthFactor)
	dxSetShaderValue( dBlurHShader, "blurDiv", blurDiv )
	dxDrawImage( 0, 0, mx, my, dBlurHShader )
	DebugResults.addItem( newRT, "dBlurHShader" )
	return newRT
end

function applyGDepthBlurV( Src, blurDiv,blur,depthFactor )
	if not Src then return nil end
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( dBlurVShader, "TEX0", Src )
	dxSetShaderValue( dBlurVShader, "gblurFactor",blur)
	dxSetShaderValue( dBlurVShader, "gDepthFactor",depthFactor)
	dxSetShaderValue( dBlurVShader, "blurDiv", blurDiv )
	dxDrawImage( 0, 0, mx,my, dBlurVShader )
	DebugResults.addItem( newRT, "dBlurVShader" )
	return newRT
end


function applyPalette( src, lumPixel)
	if not src then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( paletteShader, "sBaseTexture", src )
	dxSetShaderValue( paletteShader, "sLumPixel", lumPixel )
	dxDrawImage( 0, 0, mx,my, paletteShader )
	DebugResults.addItem( newRT, "PaletteShader" )
	return newRT
end



function applyBrightness( src, sceneLuminance)
	if not src then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT )
	dxSetShaderValue( brightnessShader, "sBaseTexture", src )
	dxSetShaderValue( brightnessShader, "sLumTexture", sceneLuminance )
	dxDrawImage( 0, 0, mx, my, brightnessShader )
	DebugResults.addItem( newRT, "Brightness" )
	return newRT
end

function applyBrightPass( Src, cutoff, power )
	if not Src then return nil end
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT) 
	dxSetShaderValue( brightPassShader, "TEX0", Src )
	dxSetShaderValue( brightPassShader, "CUTOFF", cutoff )
	dxSetShaderValue( brightPassShader, "POWER", power )
	dxDrawImage( 0, 0, mx,my, brightPassShader )
	DebugResults.addItem( newRT, "brightPassShader" )
	return newRT
end


function applyBloomCombine( src, base, sBloomIntensity, sBloomSaturation, sBaseIntensity, sBaseSaturation )
	if not src or not base then return nil end
	local mx,my = dxGetMaterialSize( base )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( bloomCombineShader, "sBloomTexture", src )
	dxSetShaderValue( bloomCombineShader, "sBaseTexture", base )
	dxSetShaderValue( bloomCombineShader, "sBloomIntensity", sBloomIntensity )
	dxSetShaderValue( bloomCombineShader, "sBloomSaturation", sBloomSaturation )
	dxSetShaderValue( bloomCombineShader, "sBaseIntensity", sBaseIntensity )
	dxSetShaderValue( bloomCombineShader, "sBaseSaturation", sBaseSaturation )
	dxDrawImage( 0, 0, mx,my, bloomCombineShader )
	DebugResults.addItem( newRT, "BloomCombine" )
	return newRT
end

function applyBloomExtract( src, sceneLuminance, sBloomThreshold )
	if not src or not sceneLuminance then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( bloomExtractShader, "sBaseTexture", src )
	dxSetShaderValue( bloomExtractShader, "sBloomThreshold", sBloomThreshold )
	dxSetShaderValue( bloomExtractShader, "sLumTexture", sceneLuminance )
	dxDrawImage( 0, 0, mx,my, bloomExtractShader )
	DebugResults.addItem( newRT, "BloomExtract" )
	return newRT
end

function applyContrast( src, Brightness, Contrast  )
	if not src then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT )
	dxSetShaderValue( contrastShader, "sBaseTexture", src )
	dxSetShaderValue( contrastShader, "sBrightness", Brightness )
	dxSetShaderValue( contrastShader, "sContrast", Contrast )
	dxDrawImage( 0, 0, mx, my, contrastShader )
	DebugResults.addItem( newRT, "Contrast" )
	return newRT
end

function applyModulation( src, sceneLuminance, MultAmount, Mult, Add, ExtraFrom, ExtraTo, ExtraMult )
	if not src or not sceneLuminance then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT )
	dxSetShaderValue( modulationShader, "sBaseTexture", src )
	dxSetShaderValue( modulationShader, "sMultAmount", MultAmount )
	dxSetShaderValue( modulationShader, "sMult", Mult )
	dxSetShaderValue( modulationShader, "sAdd", Add )
	dxSetShaderValue( modulationShader, "sLumTexture", sceneLuminance )
	dxSetShaderValue( modulationShader, "sExtraFrom", ExtraFrom )
	dxSetShaderValue( modulationShader, "sExtraTo", ExtraTo )
	dxSetShaderValue( modulationShader, "sExtraMult", ExtraMult )
	dxDrawImage( 0, 0, mx, my, modulationShader )
	DebugResults.addItem( newRT, "Modulation" )
	return newRT
end

function applyResize( src, tx, ty )
	if not src then return nil end
	local newRT = RTPool.GetUnused(tx, ty)
	if not newRT then return nil end
	dxSetRenderTarget( newRT )
	dxDrawImage( 0,  0, tx, ty, src )
	DebugResults.addItem( newRT, "Resize" )
	return newRT
end

function applyDownsampleSteps( src, steps )
	if not src then return nil end
	for i=1,steps do
		src = applyDownsample ( src )
	end
	return src
end

function applyDownsample( src )
	if not src then return nil end
	local mx,my = dxGetMaterialSize( src )
	mx = mx / 2
	my = my / 2
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT )
	dxDrawImage( 0, 0, mx, my, src )
	DebugResults.addItem( newRT, "Downsample" )
	return newRT
end


function applyGBlurH( src, bloom)
	if not src then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( blurHShader, "tex0", src )
	dxSetShaderValue( blurHShader, "tex0size", mx,my )
	dxSetShaderValue( blurHShader, "bloom", bloom )
	dxDrawImage( 0, 0, mx,my, blurHShader )
	DebugResults.addItem( newRT, "GBlurH" )
	return newRT
end

function applyGBlurV( src, bloom)
	if not src then return nil end
	local mx,my = dxGetMaterialSize( src )
	local newRT = RTPool.GetUnused(mx,my)
	if not newRT then return nil end
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( blurVShader, "tex0", src )
	dxSetShaderValue( blurVShader, "tex0size", mx,my )
	dxSetShaderValue( blurVShader, "bloom", bloom )
	dxDrawImage( 0, 0, mx,my, blurVShader )
	DebugResults.addItem( newRT, "GBlurV" )
	return newRT
end


function updateLumSource( current, changeRate, changeAlpha )
	if not current then return nil end
	changeRate = changeRate or 50

	local mx,my = dxGetMaterialSize( current );

	local size = 1
	while ( size < mx / 2 or size < my / 2 ) do
		size = size * 2
	end

	current = applyResize( current, size, size )
	while ( size > 1 ) do
		size = size / 2
		current = applyDownsample( current, 2 )
	end

	if getTickCount() > nextLumSampleTime then
		nextLumSampleTime = getTickCount() + changeRate
		dxSetRenderTarget( lumTarget )
	-- If the current is null due to error...
		if not current then memError() return end
		dxDrawImage( 0,  0, 1, 1, current, 0,0,0, tocolor(255,255,255,changeAlpha) )
	end

	current = applyResize( lumTarget, 1, 1 )

	return lumTarget
end


----------------------------------------------------------------
-- Avoid errors messages when memory is low
----------------------------------------------------------------
_dxDrawImage = dxDrawImage
function xdxDrawImage(posX, posY, width, height, image, ... )
	if not image then return false end
	return _dxDrawImage( posX, posY, width, height, image, ... )
end

----------------------------------------------------------------
