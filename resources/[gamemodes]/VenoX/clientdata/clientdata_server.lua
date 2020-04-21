-- Default values --
--[[
local clientData = {}
	clientData["stuntCamActive"] = true

function recieveClientFileData_func ( data )

	
end
addEvent ( "recieveClientFileData", true )
addEventHandler ( "recieveClientFileData", getRootElement(), recieveClientFileData_func )]]