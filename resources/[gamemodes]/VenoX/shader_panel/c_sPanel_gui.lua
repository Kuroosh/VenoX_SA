--
-- c_sPanel_gui.lua
--

-- The key to open the panel
local toggle_key = "F3"
-- here you set how many seconds to wait after saving/opening the UI
-- now it is fair 5 seconds.
local theTikGap = 5
local getLastTick = getTickCount ( )-(theTikGap*1000)
-- Should be shader panel window visible on start ?
local panelVisibleAtStart = false
--------------------------------
-- Reading from default_config.xml
--------------------------------
effect = {}
effect.name = {}  -- the combo box
effect.enabled = {} -- is locked or unlocked
effect.started = {} -- option chosen at start
effect.maxlist = {} -- number of options in combobox
effect.visible = {} -- is combobox visible in menu

local meta = xmlLoadFile( "shader_panel/default_settings.xml" )     
for i,name in ipairs(xmlNodeGetChildren(meta)) do 
    effect.name[i] = xmlNodeGetAttribute(name, "effect")
	effect.visible[i] = xmlNodeGetAttribute(name, "visible")
    effect.enabled[i] = xmlNodeGetAttribute(name, "unlocked")
    effect.started[i] = xmlNodeGetAttribute(name, "started")
	effect.maxlist[i] = xmlNodeGetAttribute(name, "maxlist")
end 
xmlUnloadFile(meta)

--------------------------------
--Instead of ElementData
--------------------------------
SPLdata ={}
SPLdata.spl_logged = false;
SPLdata.spl_palette =0;
SPLdata.spl_bloom =0;
SPLdata.spl_carpaint =0;
SPLdata.spl_water =0;
SPLdata.spl_blur =0;
SPLdata.spl_detail =0;

--------------------------------
-- Creating UI
-------------------------------- 
 
GUISP = {}
GUISP.label = {}
GUISP.combo = {}
GUISP.optionHeight = {}
GUISP.optionList = {}
-- The labels
GUISP.label.misc = {'Shader Panel','00 FPS','Save','Close','choose','Framerate: ','Out of memory error!','Reset'}
GUISP.label.name = {'Palette','Post Process','Car Paint Shader','Water Shader','Radial Blur Shader','Detail Shader'}
-----------------------------------------------------------------------------
-- Adding options
-----------------------------------------------------------------------------
GUISP.optionList[1] = {'off','Live colors','Apocalyptic brown','Intense cool','Intense warm','Weak cool','Negative','Psychedelic','Realism contrast','Tealorange dull','Luminance test'}
GUISP.optionList[2] = {'off','bloom','contrast','bloom + contrast','DoF','bloom + DoF','bloom + contrast + DoF'}
GUISP.optionList[3] = {'off','classic','reflect','reflect lite'}
GUISP.optionList[4] = {'off','classic','refract'}
GUISP.optionList[5] = {'off','on'}
GUISP.optionList[6] = {'off','on'}

-- guiComboBoxRemoveItem causes a crash in older builds. At least in my code.So i'm just bypassing it.
if string.sub( getVersion ().sortable, 9, 13 ) < "04811" then
GUISP.optionList[2] = {'off','bloom','contrast','bloom + contrast'}
effect.maxlist[2]=effect.maxlist[2]-3
GUISP.optionList[4] = {'off','classic'}
effect.maxlist[4]=effect.maxlist[4]-1
end
-----------------------------------------------------------------------------
-- List of removed options if zBuffer disabled
-----------------------------------------------------------------------------
GUISP.zRemoveList={}
GUISP.zRemoveList[1]={}
GUISP.zRemoveList[2]={'DoF','bloom + DoF','bloom + contrast + DoF'}
GUISP.zRemoveList[3]={}
GUISP.zRemoveList[4]={'refract'}
GUISP.zRemoveList[5]={}
GUISP.zRemoveList[6]={}

-- UI itself

local screenWidth, screenHeight = guiGetScreenSize()
local width = 321
local height = 309 

local left = (screenWidth/2 - width/2)+screenWidth/4
local top = (screenHeight/2 - height/2)

GUISP.ShaderPanelWindow = guiCreateWindow(left,top,width,height+150,GUISP.label.misc[1]..' v1.4',false)
guiWindowSetSizable(GUISP.ShaderPanelWindow, false)
guiSetAlpha(GUISP.ShaderPanelWindow, 0.7)
GUISP.fps = guiCreateLabel(13,21,296,20,GUISP.label.misc[2],false,GUISP.ShaderPanelWindow)
guiLabelSetVerticalAlign(GUISP.fps,"center")
guiLabelSetHorizontalAlign(GUISP.fps,"center",false)

GUISP.spl_save = guiCreateButton(15,height-51,139,36,GUISP.label.misc[3],false,GUISP.ShaderPanelWindow) 
GUISP.spl_close = guiCreateButton(169,height-51,139,36,GUISP.label.misc[4],false,GUISP.ShaderPanelWindow)
guiSetAlpha(GUISP.spl_save, 0.7)
guiSetAlpha(GUISP.spl_close, 0.7)

local invis=0
for w,_ in ipairs(GUISP.optionList) do
GUISP.label[w] = guiCreateLabel(13,43+(50*((w-1)-invis)),295,20,GUISP.label.name[w],false,GUISP.ShaderPanelWindow)
guiLabelSetVerticalAlign(GUISP.label[w],"center")
guiLabelSetHorizontalAlign(GUISP.label[w],"center",false) 
GUISP.combo[w] = guiCreateComboBox(13,65+(50*((w-1)-invis)),295,0,GUISP.label.misc[5],false,GUISP.ShaderPanelWindow) 

GUISP.optionHeight[w] = 33 
for v = 1, tonumber(effect.maxlist[w])+1, 1 do
guiComboBoxAddItem ( GUISP.combo[w], GUISP.optionList[w][v] ) GUISP.optionHeight[w]=GUISP.optionHeight[w]+16 end
guiSetSize ( GUISP.combo[w],295,GUISP.optionHeight[w], false )
if tonumber(effect.started[w])>0 then guiComboBoxSetSelected(GUISP.combo[w], tonumber(effect.started[w])) end 
if effect.enabled[w]=='false' then guiSetEnabled(GUISP.combo[w],false) guiSetAlpha(GUISP.combo[w], 0.5) end 
if effect.visible[w]=='false' then guiSetVisible(GUISP.combo[w],false) guiSetVisible(GUISP.label[w],false) height=height-51 invis=invis+1 end
end

guiSetVisible(GUISP.combo[5], false)
guiSetVisible(GUISP.combo[6], false)
guiSetVisible(GUISP.ShaderPanelWindow, false)

-- End of UI creation
 
function toggle_shader_panel()

if SPLdata.spl_logged==true then 

  local combo_palette=SPLdata.spl_palette
  local combo_bloom= SPLdata.spl_bloom
  local combo_carpaint=SPLdata.spl_carpaint
  local combo_water= SPLdata.spl_water
  guiComboBoxSetSelected(GUISP.combo[1], combo_palette) 
  guiComboBoxSetSelected(GUISP.combo[2], combo_bloom)
  guiComboBoxSetSelected(GUISP.combo[3], combo_carpaint)
  guiComboBoxSetSelected(GUISP.combo[4], combo_water)
  
  if Settings.var.BlurEN==1 then
   local combo_blur= SPLdata.spl_blur
   guiComboBoxSetSelected(GUISP.combo[5], combo_blur)
  end
  if Settings.var.DetailEN==1 then
   local combo_detail= SPLdata.spl_detail
   guiComboBoxSetSelected(GUISP.combo[6], combo_detail)
  end
 end
  if (guiGetVisible(GUISP.ShaderPanelWindow)) then
	showCursor(false)
	setElementClicked ( false )
	removeEventHandler ( "onClientRender", root, fpscheck)
	guiSetVisible(GUISP.ShaderPanelWindow,false)
  else
	showCursor(true)
	setElementClicked ( true )
	addEventHandler ( "onClientRender", root, fpscheck)
	guiSetVisible(GUISP.ShaderPanelWindow,true)
  end
end

function spl_save_func()
 if not bEffectEnabled then 
  guiSetText ( GUISP.spl_save,GUISP.label.misc[3]) 
  enablePanelFx()
 return
 end 
  saveShaderSettings ( SPLdata.spl_palette, SPLdata.spl_bloom, SPLdata.spl_carpaint, SPLdata.spl_water, SPLdata.spl_blur, SPLdata.spl_detail )
end

function spl_choose_settings()
if not bEffectEnabled then 
  guiComboBoxSetSelected(GUISP.combo[1], 0)
  guiComboBoxSetSelected(GUISP.combo[2], 0)
  guiComboBoxSetSelected(GUISP.combo[3], 0)
  guiComboBoxSetSelected(GUISP.combo[4], 0)
  if Settings.var.BlurEN==1 then
    guiComboBoxSetSelected(GUISP.combo[5], 0)
  end
  if Settings.var.DetailEN==1 then
    guiComboBoxSetSelected(GUISP.combo[6], 0)
  end
return end
  SPLdata.spl_palette=guiComboBoxGetSelected(GUISP.combo[1])
  SPLdata.spl_bloom=guiComboBoxGetSelected(GUISP.combo[2])
  SPLdata.spl_carpaint=guiComboBoxGetSelected(GUISP.combo[3])
  SPLdata.spl_water=guiComboBoxGetSelected(GUISP.combo[4])

  if Settings.var.BlurEN==1 then
   local combo_blur=guiComboBoxGetSelected(GUISP.combo[5])
   SPLdata.spl_blur=combo_blur
  end
  if Settings.var.DetailEN==1 then
   local combo_detail=guiComboBoxGetSelected(GUISP.combo[6])
   SPLdata.spl_detail=combo_detail
   end
  Settings.var.BloomON=1
  Settings.var.PaletteON = SPLdata.spl_palette
  if SPLdata.spl_bloom>0 then
  if SPLdata.spl_bloom==1 then Settings.var.BloomON=1 Settings.var.ContrastON=0 Settings.var.DoFON=0 end
  if SPLdata.spl_bloom==2 then Settings.var.BloomON=0 Settings.var.ContrastON=1 Settings.var.DoFON=0 end
  if SPLdata.spl_bloom==3 then Settings.var.BloomON=1 Settings.var.ContrastON=1 Settings.var.DoFON=0 end
  if Settings.var.isDepthSupported==true then
  if SPLdata.spl_bloom==4 then Settings.var.BloomON=0 Settings.var.ContrastON=0 Settings.var.DoFON=1 end
  if SPLdata.spl_bloom==5 then Settings.var.BloomON=1 Settings.var.ContrastON=0 Settings.var.DoFON=1 end
  if SPLdata.spl_bloom==6 then Settings.var.BloomON=1 Settings.var.ContrastON=1 Settings.var.DoFON=1 end
  end
  else
  Settings.var.BloomON=0 Settings.var.ContrastON=0 Settings.var.DoFON=0
  end
  if Settings.var.BlurEN==1 then
   if SPLdata.spl_blur==1 then triggerEvent( "switchRadialBlur", root, true ) else 
   triggerEvent( "switchRadialBlur", root, false ) end
  end
  if Settings.var.DetailEN==1 then
    if SPLdata.spl_detail==1 then triggerEvent( "onClientSwitchDetail", root, true ) else
   triggerEvent( "onClientSwitchDetail", root, false ) end
  end
  Settings.var.CarPaintVers = SPLdata.spl_carpaint
  Settings.var.WaterVers = SPLdata.spl_water
  if (Settings.var.PaletteON)>0 then 
  palette = dxCreateTexture ( "palettes/enbpalette"..Settings.var.PaletteON..".png" )
  dxSetShaderValue( paletteShader, "sPaletteTexture", palette )
    end
	
  if Settings.var.DoFON==1 then depthOfField_start() else depthOfField_stop() end
  
  if Settings.var.CarPaintVers ==0 then carpaint_stopCla() carpaint_stopRef() end
  if Settings.var.CarPaintVers ==2 or Settings.var.CarPaintVers ==3 then carpaint_stopCla() carpaint_stopRef() carpaint_staRef() end
  if Settings.var.CarPaintVers ==1 then carpaint_stopCla() carpaint_stopRef() carpaint_staCla() end
  if Settings.var.WaterVers == 1 or Settings.var.WaterVers == 2 then water_stopCla() water_startCla() end	
  if Settings.var.WaterVers == 0 then water_stopCla()  end	
  toggleBloom()
end

function spl_close_func()
  guiSetVisible(GUISP.ShaderPanelWindow, false)
  showCursor(false)
end

local frames,lastsec = 0,0
function fpscheck()
 if bEffectEnabled then
  if (guiGetVisible(GUISP.ShaderPanelWindow)) then
  local frameticks=getTickCount()
  frames=frames+1
 if frameticks-1000>lastsec then
  local prog=(frameticks-lastsec)
  lastsec=frameticks
  fps=frames/(prog/1000)
  frames=fps*((prog-1000)/1000)
  local fps_out=math.floor(fps)
  local frame_string=tostring(fps_out)
  frame_string=GUISP.label.misc[6]..frame_string..' FPS'
  guiSetText ( GUISP.fps,frame_string)
  end
 end
 else
  -- Out of memory error
  guiSetText ( GUISP.fps,GUISP.label.misc[7])
 end
end

function on_client_login()
	
  if SPLdata.spl_logged==true then
  Settings.var.PaletteON = SPLdata.spl_palette
  if SPLdata.spl_bloom>0 then 
  if SPLdata.spl_bloom==1 then Settings.var.BloomON=1 Settings.var.ContrastON=0 Settings.var.DoFON=0 end
  if SPLdata.spl_bloom==2 then Settings.var.BloomON=0 Settings.var.ContrastON=1 Settings.var.DoFON=0 end
  if SPLdata.spl_bloom==3 then Settings.var.BloomON=1 Settings.var.ContrastON=1 Settings.var.DoFON=0 end
  if Settings.var.isDepthSupported==true then
  if SPLdata.spl_bloom==4 then Settings.var.BloomON=0 Settings.var.ContrastON=0 Settings.var.DoFON=1 end
  if SPLdata.spl_bloom==5 then Settings.var.BloomON=1 Settings.var.ContrastON=0 Settings.var.DoFON=1 end
  if SPLdata.spl_bloom==6 then Settings.var.BloomON=1 Settings.var.ContrastON=1 Settings.var.DoFON=1 end
  end
  else
  Settings.var.BloomON=0 Settings.var.ContrastON=0 Settings.var.DoFON=0
  end 
  if Settings.var.BlurEN==1 then  
   if SPLdata.spl_blur==1 then triggerEvent( "switchRadialBlur", root, true ) else
   triggerEvent( "switchRadialBlur", root, false ) end
  end
  if Settings.var.DetailEN==1 then
    if SPLdata.spl_detail==1 then triggerEvent( "onClientSwitchDetail", root, true ) else
   triggerEvent( "onClientSwitchDetail", root, false ) end
  end
  Settings.var.CarPaintVers = SPLdata.spl_carpaint
  Settings.var.WaterVers = SPLdata.spl_water
  if (Settings.var.PaletteON)>0 then 
  palette = dxCreateTexture ( "palettes/enbpalette"..Settings.var.PaletteON..".png" )
  dxSetShaderValue( paletteShader, "sPaletteTexture", palette )
    end
	
  if Settings.var.DoFON==1 then depthOfField_start() else depthOfField_stop() end
	
  if Settings.var.CarPaintVers <=0 then carpaint_stopCla() carpaint_stopRef() end
  if Settings.var.CarPaintVers ==2 or Settings.var.CarPaintVers ==3 then carpaint_stopCla() carpaint_stopRef() carpaint_staRef() end
  if Settings.var.CarPaintVers ==1 then carpaint_stopCla() carpaint_stopRef() carpaint_staCla() end
  if Settings.var.WaterVers == 1 or Settings.var.WaterVers == 2 then water_stopCla() water_startCla() end	
  if Settings.var.WaterVers <= 0 then water_stopCla()  end		
        end
	toggleBloom()
end

function memError()
 if bEffectEnabled then 
  guiSetText ( GUISP.spl_save,GUISP.label.misc[8]) 
  outputChatBox('SP: Out of memory error!',255,0,0,true)
  guiComboBoxSetSelected(GUISP.combo[1], 0)
  guiComboBoxSetSelected(GUISP.combo[2], 0)
  guiComboBoxSetSelected(GUISP.combo[3], 0)
  guiComboBoxSetSelected(GUISP.combo[4], 0)
  if Settings.var.BlurEN==1 then guiComboBoxSetSelected(GUISP.combo[5], 0) end
  if Settings.var.DetailEN==1 then guiComboBoxSetSelected(GUISP.combo[6], 0) end

  SPLdata.spl_palette=0
  SPLdata.spl_bloom=0
  SPLdata.spl_blur=0
  SPLdata.spl_detail=0
  SPLdata.spl_carpaint=0
  SPLdata.spl_water=0
  
  Settings.var.PaletteON = SPLdata.spl_palette
  Settings.var.BloomON = SPLdata.spl_bloom
  Settings.var.ContrastON = SPLdata.spl_bloom
  Settings.var.DoFON = SPLdata.spl_bloom
  if Settings.var.BlurEN==1 then triggerEvent( "switchRadialBlur", root, false ) end
  if Settings.var.DetailEN==1 then triggerEvent( "onClientSwitchDetail", root, false ) end
  Settings.var.CarPaintVers = SPLdata.spl_carpaint
  Settings.var.WaterVers = SPLdata.spl_water
  
  if Settings.var.DoFON==1 then depthOfField_start() else depthOfField_stop() end
  
  if Settings.var.CarPaintVers <=0 then carpaint_stopCla() carpaint_stopRef() end
  if Settings.var.CarPaintVers ==2 or Settings.var.CarPaintVers ==3 then carpaint_stopCla() carpaint_stopRef() carpaint_staRef() end
  if Settings.var.CarPaintVers ==1 then carpaint_stopCla() carpaint_stopRef() carpaint_staCla() end
  if Settings.var.WaterVers == 1 or Settings.var.WaterVers == 2 then water_stopCla() water_startCla() end	
  if Settings.var.WaterVers <= 0 then water_stopCla()  end		
  
  disablePanelFx() 
 end
end

-- Handling external resources

function client_resource_process(resource_name)
  --outputDebugString('A resource: '..resource_name..' has started')
  local current_height=height
  guiSetSize ( GUISP.ShaderPanelWindow,width,current_height, false )
  guiSetVisible(GUISP.label[5], false) 
  guiSetVisible(GUISP.combo[5], false) 
  guiSetVisible(GUISP.label[6], false)         
  guiSetVisible(GUISP.combo[6], false) 
  guiSetPosition ( GUISP.spl_save, 15, current_height-51, false )
  guiSetPosition ( GUISP.spl_close, 168, current_height-51, false )  
  if resource_name=="shader_detail" then Settings.var.DetailEN=0 end
  if resource_name=="shader_radial_blur" then Settings.var.BlurEN=0 end
  if Settings.var.BlurEN~=2 then if triggerEvent( "switchRadialBlur", root, false ) then Settings.var.BlurEN=1 else Settings.var.BlurEN=0 end end
  if Settings.var.DetailEN~=2 then if triggerEvent( "onClientSwitchDetail", root, false ) then Settings.var.DetailEN=1 else Settings.var.DetailEN=0 end end
 if Settings.var.BlurEN==1 then 
   current_height=current_height+50 
   guiSetVisible(GUISP.label[5], true)  
   guiSetVisible(GUISP.combo[5], true) 
   if tonumber(effect.started[5])>0 then guiComboBoxSetSelected(GUISP.combo[5], tonumber(effect.started[5])) end 
   if effect.enabled[5]=='false' then guiSetEnabled(GUISP.combo[5],false) guiSetAlpha(GUISP.combo[5], 0.5) end
   guiSetSize ( GUISP.ShaderPanelWindow,width,current_height, false )
   guiSetPosition ( GUISP.spl_save, 15, current_height-51, false )
   guiSetPosition ( GUISP.spl_close, 168, current_height-51, false )
   end
 if Settings.var.DetailEN==1 then 
   current_height=current_height+50 
   guiSetVisible(GUISP.label[6], true)  
   guiSetVisible(GUISP.combo[6], true) 
   if tonumber(effect.started[6])>0 then guiComboBoxSetSelected(GUISP.combo[6], tonumber(effect.started[6])) end
   if effect.enabled[6]=='false' then guiSetEnabled(GUISP.combo[6],false) guiSetAlpha(GUISP.combo[6], 0.5) end
   guiSetSize ( GUISP.ShaderPanelWindow,width,current_height, false )
   guiSetPosition ( GUISP.spl_save, 15, current_height-51, false )
   guiSetPosition ( GUISP.spl_close, 168, current_height-51, false )
   guiSetPosition ( GUISP.combo[6], 13, current_height-94, false )
   guiSetPosition ( GUISP.label[6], 13, current_height-116, false ) 
 end
end

function client_resource_start(started_res_name)
 local resource_name=getResourceName(started_res_name)
 client_resource_process(resource_name)
 getSettingsFromData()
end

function client_resource_stop(stopped_res_name)
 local resource_name=getResourceName(stopped_res_name)
 if resource_name=="shader_detail" then 
  Settings.var.DetailEN=2
  client_resource_process("")
 end
 if resource_name=="shader_radial_blur" then 
  Settings.var.BlurEN=2
  client_resource_process("")
 end
end

function check_Res_Name(started_res_name)
	if panelVisibleAtStart then 
		toggle_shader_panel() 
	end 
	spl_choose_settings()
end

function getSettingsFromData ()
	SPLdata.spl_logged = true
	SPLdata.spl_palette = 0
	SPLdata.spl_bloom = 0
	SPLdata.spl_carpaint = 0
	SPLdata.spl_water = 0
	SPLdata.spl_blur = 0
	SPLdata.spl_detail = 0
	if fileExists ( "shadersettings.txt" ) then
		local file = fileOpen ( "shadersettings.txt" )
		local str = fileRead ( file, fileGetSize ( file ) )
		SPLdata.spl_palette = tonumber ( gettok ( str, 1, string.byte ( "|" ) ) ) or 0
		SPLdata.spl_bloom = tonumber ( gettok ( str, 2, string.byte ( "|" ) ) ) or 0	
		SPLdata.spl_carpaint = tonumber ( gettok ( str, 3, string.byte ( "|" ) ) ) or 0
		SPLdata.spl_water = tonumber ( gettok ( str, 4, string.byte ( "|" ) ) ) or 0
		SPLdata.spl_blur = tonumber ( gettok ( str, 5, string.byte ( "|" ) ) ) or 0
		SPLdata.spl_detail = tonumber ( gettok ( str, 6, string.byte ( "|" ) ) ) or 0	
		fileClose ( file )
	else
		local file = fileCreate ( "shadersettings.txt" )
		fileWrite ( file, "0|0|0|0|0|0" )
		fileClose ( file )
	end
	on_client_login()
end



function saveShaderSettings ( arg1, arg2, arg3, arg4, arg5, arg6 )
	local file = nil
	if fileExists ( "shadersettings.txt" ) then
		file = fileOpen ( "shadersettings.txt" )
	else
		file = fileCreate ( "shadersettings.txt" )
	end
	local str = arg1.."|"..arg2.."|"..arg3.."|"..arg4.."|"..arg5.."|"..arg6
	fileWrite ( file, str )
	fileClose ( file )
end

addCommandHandler('shader',toggle_shader_panel)
addEventHandler("onClientResourceStart", resourceRoot, check_Res_Name)
addEventHandler ( "onClientResourceStart", resourceRoot, client_resource_start)
addEventHandler ( "onClientResourceStop", resourceRoot, client_resource_stop)
addEventHandler("onClientGUIClick", GUISP.spl_close, spl_close_func,false)
addEventHandler("onClientGUIClick", GUISP.spl_save, spl_save_func,false)
addEventHandler("onClientGUIComboBoxAccepted", GUISP.ShaderPanelWindow, spl_choose_settings)