mouseSet = "CGUI-Images"
mouseName = "OUT"
showVioGUIMouse = true

_guiCreateButton = guiCreateButton
_guiCreateWindow = guiCreateWindow
_guiCreateMemo = guiCreateMemo
_guiCreateEdit = guiCreateEdit
_guiCreateStaticImage = guiCreateStaticImage
_guiCreateLabel = guiCreateLabel
_guiCreateCheckBox = guiCreateCheckBox
_guiCreateComboBox = guiCreateComboBox
_guiCreateGridList = guiCreateGridList
_guiCreateProgressBar = guiCreateProgressBar
_guiCreateRadioButton = guiCreateRadioButton
_guiCreateScrollBar = guiCreateScrollBar
_guiCreateScrollPane = guiCreateScrollPane
_guiCreateTabPanel = guiCreateTabPanel
_guiCreateTab = guiCreateTab
_guiSetInputEnabled = guiSetInputEnabled

numberFieldData = {}
progressBarData = {}

function vioGuiCreateProgressBar ( x, y, width, height, bool, startValue, parent )

	if not parent then
		parent = nil
	end
	if startValue then
		startValue = math.abs ( tonumber ( startValue ) )
	end
	if not startValue then
		startValue = 0
	end
	
	-- Relative --
	if bool then
		width = width * screenwidth
		height = height * screenheight
	end
	-- Relative --
	
	local pxSizeW = width / 72 * 5
	local pxSizeH = height / 15 * 3
	
	local base = guiCreateStaticImage ( x, y, width, height, "images/gui/bar/bar_c1.png", false, parent )
	guiCreateStaticImage ( 0, 0, width, pxSizeH, "images/colors/c_black.jpg", false, base ) -- upper bar
	guiCreateStaticImage ( 0, height - pxSizeH, width, pxSizeH, "images/colors/c_black.jpg", false, base ) -- bottom bar
	guiCreateStaticImage ( 0, 0, pxSizeW, height, "images/colors/c_black.jpg", false, base ) -- left bar
	guiCreateStaticImage ( width - pxSizeW, 1, pxSizeW, height, "images/colors/c_black.jpg", false, base ) -- right bar
	
	progressBarData[base] = guiCreateStaticImage ( pxSizeW, pxSizeH * 2, ( width - 2 * ( pxSizeW ) ) * startValue, height - 2 * ( pxSizeH ) - 1, "images/gui/bar/bar_c2.png", false, base ) -- progress from 0 to 1
	
	return base
end

function vioGuiSetProgressBarFuelState ( bar, fuelState )

	width, height = guiGetSize ( bar, false )
	
	destroyElement ( progressBarData[bar] )
	
	local pxSizeW = width / 72 * 5
	local pxSizeH = height / 15 * 3
	
	progressBarData[bar] = guiCreateStaticImage ( pxSizeW, pxSizeH, ( width - 2 * ( pxSizeW ) ) * fuelState, height - 2 * ( pxSizeH ) - 1, "images/gui/bar/bar_c2.png", false, bar )
end

function guiCreateNumberField ( x, y, width, height, startValue, bool, parent, integer, abs )

	startValue = tonumber ( startValue )
	if integer == nil then
		integer = true
	end
	if abs == nil then
		abs = true
	end
	if not startValue then
		startValue = 0
	end
	if integer then
		startValue = math.floor ( startValue + 0.5 )
	end
	if abs then
		startValue = math.abs ( startValue )
	end
	local edit = guiCreateEdit ( x, y, width, height, tostring ( startValue ), bool, parent )
	if edit then
		numberFieldData[edit] = {}
			numberFieldData[edit]["oldValue"] = startValue
			numberFieldData[edit]["abs"] = abs
			numberFieldData[edit]["integer"] = integer
		addEventHandler ( "onClientGUIChanged", edit, 
			function ()
				local ctext = tonumber ( guiGetText ( source ) )
				if ctext then
					local int = numberFieldData[source]["integer"]
					local abs = numberFieldData[source]["abs"]
					if abs then
						if not ( math.abs ( ctext ) == ctext ) then
							guiSetText ( source, tostring ( numberFieldData[source]["oldValue"] ) )
						end
					end
					if int then
						if not ( math.floor ( ctext + 0.5 ) == ctext ) then
							guiSetText ( source, tostring ( numberFieldData[source]["oldValue"] ) )
						end
					end
				elseif guiGetText ( source ) == "" then
					guiSetText ( source, "0" )
				else
					guiSetText ( source, tostring ( numberFieldData[source]["oldValue"] ) )
				end
				numberFieldData[edit]["oldValue"] = tonumber ( guiGetText ( source ) )
			end
		)
	end
	return edit
end

function guiDebugClick ()

	if getChessSurface () == source then
	elseif getElementType ( source ) == "gui-staticimage" and not internetImages[source] and not ( colorSelectionImage == source ) then
		guiMoveToBack ( source )
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(), guiDebugClick )

function guiSetFontSize ( element, size )

	return guiSetProperty ( element, "", size )
end

function setHudLessModeEnabled ( bool )

end

function guiSetInputEnabled ( bool )

	toggleControl ( "chatbox", bool )
end

function guiSetToolTip ( element, toolTip )

	--return guiSetProperty ( element, "Tooltip", toolTip )
end

function guiCreateScrollPane ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateScrollPane ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateTabPanel ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateTabPanel ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateTab ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateTab ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end


function guiCreateCheckBox ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateCheckBox ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateComboBox ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateComboBox ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateGridList ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateGridList ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateProgressBar ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateProgressBar ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateRadioButton ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateRadioButton ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateScrollBar ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateScrollBar ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateButton ( x, y, width, height, text, relative, parent )

	local btn = _guiCreateButton ( x, y, width, height, text, relative, parent )
	--guiSetProperty ( btn, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	guiSetFont ( btn, "default-bold-small" )
	return btn
end

function guiCreateWindow ( x, y, width, height, titleBarText, relative )

	local element = _guiCreateWindow ( x, y, width, height, titleBarText, relative )
	guiSetProperty ( element, "CaptionColour", "FF770000" )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	
	guiWindowSetSizable ( element, false )
	guiWindowSetMovable ( element, false )
	
	return element
end

function guiCreateMemo ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateMemo ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateEdit ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateEdit ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateStaticImage ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateStaticImage ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end

function guiCreateLabel ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )

	local element = _guiCreateLabel ( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 )
	--guiSetProperty ( element, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
	return element
end
--[[function mouse_over_nil ()

	local img = guiCreateStaticImage ( 0, 0, 1, 1, "images/black.bmp", true )
	white = img
	guiSetAlpha ( img, 0 )
	guiSetProperty ( img, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
end]]
--guiSetProperty ( img, "MouseCursorImage", "set:"..mouseSet.." image:"..mouseName )
--mouse_over_nil()

function slowDrawText ( string )

	local length = #string
	local totalTime = length * timeForEveryLetter + 2500
	addEventHandler ( "onClientRender", getRootElement(), slowDrawText_render )
	curTextDrawString = ""
	for i = 1, length do
		setTimer ( redoDrawString, i * timeForEveryLetter + 1, 1, string, i )
	end
	setTimer ( removeLetterDraw, totalTime, 1 )
end

function redoDrawString ( string, i )
	curTextDrawString = string.sub ( string, 1, i )
end

function removeLetterDraw ()
	removeEventHandler ( "onClientRender", getRootElement(), slowDrawText_render )
end

function slowDrawText_render ()
	
	left, top, right, bottom = 0, 0, screenwidth, screenheight
	dxDrawText ( curTextDrawString, left, top, right, bottom, tocolor ( 255, 255, 255, 255 ), 1.0, "bankgothic", "center", "center", false, false, true )
end

local guiElementToolTips = {}
local guiElementToolImages = {}

function guiGetScreenPosition ( element )

	local x, y = guiGetPosition ( element, false )
	local parent = getElementParent ( element )
	if parent and not ( getElementType ( parent ) == "guiroot" ) then
		local nx, ny = guiGetScreenPosition ( parent, false )
		return x + nx, y + ny
	else
		return x, y
	end
end

function addToolTip ( guiElement, text )

	guiElementToolTips[guiElement] = text
	addEventHandler ( "onClientMouseEnter", guiElement,
		function ()
			local x, y = guiGetScreenPosition ( source, false )
			local width, height = guiGetSize ( source, false )
			
			x = x + width
			y = y + height
			
			local text = guiElementToolTips[source]
			guiElementToolImages[source] = guiCreateStaticImage(x,y,113,113,"images/colors/c_black.jpg",false)
			
			setElementParent ( guiElementToolImages[source], source )
			
			guiSetAlpha ( guiElementToolImages[source], 0 )
			setTimer (
				function ( element )
					if isElement ( element ) then
						guiSetAlpha ( element, guiGetAlpha ( element ) + 0.2 )
					end
				end,
			50, 5, guiElementToolImages[source] )
			
			gImage[2] = guiCreateStaticImage(0,0,113,113,"images/colors/c_grey.jpg",false,guiElementToolImages[source])
			guiSetAlpha(gImage[2],0.5)
			gImage[3] = guiCreateStaticImage(0,0,113,113,"images/colors/transparent.png",false,gImage[2])
			guiSetAlpha(gImage[3],1)
			gLabel[4] = guiCreateLabel(7,5,102,117,"Hier kannst du\num Hilfe fragen,\nwenn du schnelle\nHilfe benötigst -\nz.B. wenn du\nirgendwo hängen\nbleibst.",false,gImage[3])
			guiSetAlpha(gLabel[4],1)
			guiLabelSetColor(gLabel[4],0,0,0)
			guiLabelSetVerticalAlign(gLabel[4],"top")
			guiLabelSetHorizontalAlign(gLabel[4],"left",false)
			guiSetFont(gLabel[4],"default-bold-small")
			
			setElementParent ( gImage[2], guiElementToolImages[source] )
			setElementParent ( gImage[3], guiElementToolImages[source] )
			setElementParent ( gLabel[4], guiElementToolImages[source] )
			
			addEventHandler ( "onClientMouseLeave", source,
				function ()
					guiSetAlpha ( guiElementToolImages[source], 1 )
					setTimer (
						function ( element )
							if isElement ( element ) then
								guiSetAlpha ( element, guiGetAlpha ( element ) - 0.2 )
								if guiGetAlpha ( element ) < 0.2 then
									destroyElement ( element )
								end
							end
						end,
					50, 5, guiElementToolImages[source] )
				end,
			false )
			addEventHandler ( "onElementDestroy", source,
				function ()
					destroyElement ( guiElementToolImages[source] )
				end
			)
		end,
	false )
end