addEvent("onModlistReturn", true);
addEvent("onDownloadStart", true);
addEvent("onClientDeleteMod", true);
addEvent("onClientDisableMod", true);
addEvent("onClientDownloadMod", true);
addEvent("onClientActivateMod", true);
addEvent("onClientUpdateStatus", true);


Playermodlist 		= {}
Playerdownload      = {}
cDownloadGUI_Status = false;
local activemods = {}


addEventHandler ( "onClientResourceStart", resourceRoot, function ( )
	local xml
	if fileExists ( "activeMods.xml" ) then
		xml = xmlLoadFile ( "activeMods.xml" )
		local nodes = xmlNodeGetChildren ( xml )
		if nodes and nodes[1] then
			for i=1, #nodes do
				local path = xmlNodeGetAttribute ( nodes[i], "name" )
				activemods[path] = true 
			end
		end
	else
		xml = xmlCreateFile ( "activeMods.xml", "Mods-Saver" )
		xmlSaveFile ( xml )
	end
	xmlUnloadFile ( xml )
	triggerServerEvent("onServerLoadModlist", localPlayer, 1);
end )


bindKey("f5", "down", function(_, stn)
	if(stn == "down")then
		if cDownloadGUI_Status == true then
			DestroyModlist();
			cDownloadGUI_Status = false;
		else
			cDownloadGUI_Status = true;
			triggerServerEvent("onServerLoadModlist", localPlayer);
		end
	end
end)

addEventHandler("onClientUpdateStatus", localPlayer, function(Percent, PercentSize, Modname)
	Playerdownload[localPlayer]["Percent"] 		= Percent;
	Playerdownload[localPlayer]["PercentSize"]	= PercentSize;
	Playerdownload[localPlayer]["Modname"]	    = Modname;
end)


local function saveModActiveStat ( name, bool )
	local xml = xmlLoadFile ( "activeMods.xml" )
	activemods[name] = nil
	local nodes = xmlNodeGetChildren ( xml )
	if nodes and nodes[1] then
		for i=1, #nodes do
			if xmlNodeGetAttribute ( nodes[i], "name" ) == name then
				xmlDestroyNode ( nodes[i] )
				break
			end
		end
	end
	if bool then
		activemods[name] = true
		local node = xmlCreateChild ( xml, "Mod" )
		xmlNodeSetAttribute ( node, "name", name )
	end
	xmlSaveFile ( xml )
	xmlUnloadFile ( xml )
end


addEventHandler("onClientActivateMod", localPlayer, function(TXDPATH, DFFPATH, COLPATH, TXDID, DFFID, COLID, NAME)
	if(isActivate(TXDPATH))then 
		engineImportTXD(EngineTXD(TXDPATH), tonumber(TXDID));
	end
	if(isActivate(DFFPATH))then
		engineReplaceModel(EngineDFF(DFFPATH, 0), tonumber(DFFID))
	end
	if(isActivate(COLPATH))then
		engineReplaceCOL(EngineCOL(COLPATH), tonumber(COLID))
	end
	outputChatBox("Mod wurde Aktiviert!", 0, 5, 140);
	saveModActiveStat ( NAME, true )
end)

addEventHandler("onClientDisableMod", localPlayer, function(TXDID, DFFID, COLID, NAME)

	if(isActivate(TXDID))then
		engineRestoreModel(TXDID);
	end
	if(isActivate(DFFID))then
		engineRestoreModel(DFFID);
	end
	if(isActivate(COLID))then
		engineRestoreCOL(COLID);
	end
	outputChatBox("Mod wurde Deaktiviert!", 0, 5, 140);
	saveModActiveStat ( NAME, false )
end)

addEventHandler("onDownloadStart", localPlayer, function()
	CreateDownloadStatus();
end)

addEventHandler("onModlistReturn", localPlayer, function(modlist, onConnect) 
	if not(tostring(modlist) == "nothing")then
		Playermodlist[localPlayer] = modlist;
		if onConnect then
			local modfound = {}
			for key, index in pairs ( Playermodlist[localPlayer] ) do
				if activemods[index.MODNAME] then
					Playermodlist[localPlayer][key]["MODACTIVATED"] = true
					triggerEvent ( "onClientActivateMod", localPlayer, index.MODTXDPATH, index.MODDFFPATH, index.MODCOLPATH, index.MODTXDID, index.MODDFFID, index.MODCOLID, index.MODNAME )
					modfound[index.MODNAME] = true
				end
			end
			for name in pairs ( activemods ) do
				if not modfound[name] then
					saveModActiveStat ( name, false )
				end
			end
		end
		if not onConnect then
			CreateModlist();
		end
	else
		outputChatBox("Zurzeit sind keine Mods verfügbar!", 0, 5, 140);
	end
end)

addEventHandler("onClientDownloadMod", localPlayer, function(TXDPATH, DFFPATH, COLPATH, TXD, DFF, COL)
	if(isActivate(TXDPATH))then
		if(TXD)then
			TXDFILE = fileCreate(TXDPATH);
			TXDFILE:write(TXD);
			TXDFILE:close();
		end
	end
	if(isActivate(DFFPATH))then
		if(DFF)then
			DFFFILE = fileCreate(DFFPATH);
			DFFFILE:write(DFF);
			DFFFILE:close();
		end
	end
	if(isActivate(COLPATH))then
		if(COL)then
			COLFILE = fileCreate(COLPATH);
			COLFILE:write(COL);
			COLFILE:close();
		end
	end
	DestroyDownloadStatus();
	triggerServerEvent("onServerDownloadComplete", localPlayer);
	outputChatBox("Mod wurde erfolgreich Heruntergeladen!", 0, 5, 140);
end)

addEventHandler("onClientDeleteMod", localPlayer,  function(TXDPATH, DFFPATH, COLPATH, NAME)
	if(isActivate(TXDPATH))then
		fileDelete(TXDPATH);
	end
	if(isActivate(DFFPATH))then
		fileDelete(DFFPATH);
	end
	if(isActivate(COLPATH))then
		fileDelete(COLPATH);
	end
	outputChatBox("Mod wurde Erfolgreich gelöscht!", 0, 5, 140);
	saveModActiveStat ( NAME, false )
end)

function isActivate(string)
	local str = tostring(string);
	if(str == 'disable')then
		return false;
	else
		return true;
	end
end
