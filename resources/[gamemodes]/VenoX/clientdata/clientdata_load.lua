-- Stuntcamera --
if not doesClientDataExists ( "stuntcam" ) then
	setClientData ( "stuntcam", "active" )
end
stuntCameraActive = ( getClientData ( "stuntcam" ) == "active" )
-- Radiosender --
if not doesClientDataExists ( "favradio" ) then
	setClientData ( "favradio", 3 )
end
favRadioChannel = getClientData ( "favradio" )
-- Radio mit Fahrer teilen --
--[[if not doesClientDataExists ( "shareRadio" ) then
	setClientData ( "shareRadio", "active" )
end
shareRadioChannel = ( getClientData ( "shareRadio" ) == "active" )]]