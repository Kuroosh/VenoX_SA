DownloadManager 		= {};
DownloadManager.__index = DownloadManager;


addEvent("onServerDeleteMod", true);
addEvent("onServerDisableMod", true);
addEvent("onServerActivateMod", true);
addEvent("onServerDownloadMod", true);
addEvent("onServerLoadModlist", true);
addEvent("onServerDownloadComplete", true);

function DownloadManager:Construct()
	local self 				    = {};
	setmetatable(self, {__index = DownloadManager});
	
	
	self.Player   					 	  = {};
	self.Modlist 						  = {};
	
	for index, data in pairs(Modlist) do 
		self.Modlist[index]				  = {};
		self.Modlist[index]["Modname"]    = data.Modname;
		self.Modlist[index]["INFO"]		  = data.INFO;
		self.Modlist[index]["PIC"]	      = data.PIC;

		
		if(data.TXDPath and data.TXDID and fileExists(data.TXDPath))then
			self.Modlist[index]["ModTXDID"]   = data.TXDID;
			self.Modlist[index]["ModTXDPath"] = data.TXDPath;
		else
			self.Modlist[index]["ModTXDID"]   = 'disable';
			self.Modlist[index]["ModTXDPath"] = 'disable';
		end
		if(data.DFFPath and data.DFFID and fileExists(data.DFFPath))then
			self.Modlist[index]["ModDFFID"]   = data.DFFID;
			self.Modlist[index]["ModDFFPath"] = data.DFFPath;
		else
			self.Modlist[index]["ModDFFID"]   = 'disable';
			self.Modlist[index]["ModDFFPath"] = 'disable';
		end
		if(data.COLPath and data.COLID and fileExists(data.COLPath))then
			self.Modlist[index]["ModCOLID"]   = data.COLID;
			self.Modlist[index]["ModCOLPath"] = data.COLPath;
		else
			self.Modlist[index]["ModCOLID"]   = 'disable';
			self.Modlist[index]["ModCOLPath"] = 'disable';
		end
		
		self.Modlist[index]["ModTXDSize"]	  = 0;
		self.Modlist[index]["ModDFFSize"]	  = 0;
		self.Modlist[index]["ModCOLSize"]	  = 0;

		
		if(isActivate(self.Modlist[index]["ModTXDPath"]))then
			self.Modlist[index]["ModTXDFile"] = File(self.Modlist[index]["ModTXDPath"]);
			self.Modlist[index]["ModTXDSize"] = self.Modlist[index]["ModTXDFile"]:getSize();
		end
		if(isActivate(self.Modlist[index]["ModDFFPath"]))then
			self.Modlist[index]["ModDFFFile"] = File(self.Modlist[index]["ModDFFPath"]);
			self.Modlist[index]["ModDFFSize"] = self.Modlist[index]["ModDFFFile"]:getSize();
		end
		if(isActivate(self.Modlist[index]["ModCOLPath"]))then
			self.Modlist[index]["ModCOLFile"] = File(self.Modlist[index]["ModCOLPath"]);
			self.Modlist[index]["ModCOLSize"] = self.Modlist[index]["ModCOLFile"]:getSize();
		end

	end
	
	outputDebugString((#Modlist).." Mod(s) wurden Gefunden und geladen!");
	
	addEventHandler("onPlayerQuit", root, function(...) self:Destructer(...) end);
	addEventHandler("onServerDeleteMod", root, function(...) self:DeleteMod(...) end);
	addEventHandler("onServerDisableMod",  root, function(...) self:DisableMod(...) end);
	addEventHandler("onServerDownloadMod", root, function(...) self:Download(...) end);
	addEventHandler("onServerLoadModlist", root, function(...) self:LoadModlist(...) end);
	addEventHandler("onServerActivateMod", root, function(...) self:ActivateMod(...) end);
	addEventHandler("onServerDownloadComplete", root, function(...) self:DownloadComplete(...) end);
	

	return self;
end

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function()
	DownloadManager:Construct();
end)




function DownloadManager:Download(id)
	if(self.Modlist[id])then
		if not self.Player[client] then
			self.Player[client]    		  	   = {};
			self.Player[client]["Downloading"] = true;
		else
			if self.Player[client]["Downloading"] then
				outputChatBox("Warte bis der aktuelle Download Abgeschlossen ist!", client, 200, 0, 0);
				return
			end
		end
		self.Player[client]["Downloading"] = true;

		self.Player[client]["ModTXDRead"]  = nil;
		self.Player[client]["ModDFFRead"]  = nil;
		self.Player[client]["ModCOLRead"]  = nil;
		
		if(isActivate(self.Modlist[id]["ModTXDPath"]))then
			self.Player[client]["ModTXDFile"] = File(self.Modlist[id]["ModTXDPath"]);
			self.Player[client]["ModTXDRead"] = self.Player[client]["ModTXDFile"]:read(self.Player[client]["ModTXDFile"]:getSize());
			
			self.Player[client]["ModTXDFile"]:close();
		end
		
		if(isActivate(self.Modlist[id]["ModDFFPath"]))then
			self.Player[client]["ModDFFFile"] = File(self.Modlist[id]["ModDFFPath"]);
			self.Player[client]["ModDFFRead"] = self.Player[client]["ModDFFFile"]:read(self.Player[client]["ModDFFFile"]:getSize());
			
			self.Player[client]["ModDFFFile"]:close();
		end
		
		if(isActivate(self.Modlist[id]["ModCOLPath"]))then
			self.Player[client]["ModCOLFile"] = File(self.Modlist[id]["ModCOLPath"]);
			self.Player[client]["ModCOLRead"] = self.Player[client]["ModCOLFile"]:read(self.Player[client]["ModCOLFile"]:getSize());
			
			self.Player[client]["ModCOLFile"]:close();
		end
		
		triggerClientEvent(client, "onDownloadStart", client);
		
		triggerLatentClientEvent(
							   client, 'onClientDownloadMod', DownloadSpeed, false, client, 				-- *** DOWNLOAD MIT 1 MB *** --
							   
							   self.Modlist[id]["ModTXDPath"], 
							   self.Modlist[id]["ModDFFPath"], 
							   self.Modlist[id]["ModCOLPath"],
							   self.Player[client]["ModTXDRead"], 
							   self.Player[client]["ModDFFRead"], 
							   self.Player[client]["ModCOLRead"]
		);
		
		self.Player[client]["LatentTimer"] = Timer(function(...) self:UpdateDownloadStatus(...) end, 50, 0, id, client);
		
	end
end



function DownloadManager:ActivateMod(id)
	if(self.Modlist[id])then
		if self.Player[client] then
			if self.Player[client]["Downloading"] then
				outputChatBox("Warte bis der aktuelle Download Abgeschlossen ist!", client, 200, 0, 0);
				return
			end
		end
		triggerClientEvent(client, "onClientActivateMod", client, self.Modlist[id]["ModTXDPath"], self.Modlist[id]["ModDFFPath"], self.Modlist[id]["ModCOLPath"],
																  self.Modlist[id]["ModTXDID"], self.Modlist[id]["ModDFFID"], self.Modlist[id]["ModCOLID"], self.Modlist[id]["Modname"]);
	end
end

function DownloadManager:DisableMod(id)
	if(self.Modlist[id])then
		if self.Player[client] then
			if self.Player[client]["Downloading"] then
				outputChatBox("Warte bis der aktuelle Download Abgeschlossen ist!", client, 200, 0, 0);
				return
			end
		end
		triggerClientEvent(client, "onClientDisableMod", client, self.Modlist[id]["ModTXDID"], self.Modlist[id]["ModDFFID"], self.Modlist[id]["ModCOLID"],self.Modlist[id]["Modname"]);
	end
end

function DownloadManager:DeleteMod(id)
	if(self.Modlist[id])then
		if self.Player[client] then
			if self.Player[client]["Downloading"] then
				outputChatBox("Warte bis der aktuelle Download Abgeschlossen ist!", client, 200, 0, 0);
				return
			end
		end
		triggerClientEvent(client, "onClientDeleteMod", client, self.Modlist[id]["ModTXDPath"], self.Modlist[id]["ModDFFPath"], self.Modlist[id]["ModCOLPath"],self.Modlist[id]["Modname"]);
	end
end

function DownloadManager:LoadModlist( onConnect )
		
	if not self.Templist then
		self.Templist 					= {};
	end
	self.Templist[client] 				= {};
	for i = 1, #self.Modlist do 
		table.insert(self.Templist[client],
		{
			MODID	     = i,
			MODNAME		 = self.Modlist[i]["Modname"],
			
			MODSIZE		 = self.Modlist[i]["ModTXDSize"] + self.Modlist[i]["ModDFFSize"] + self.Modlist[i]["ModCOLSize"],
			
			MODTXDID   	 = self.Modlist[i]["ModTXDID"],	
			MODTXDPATH 	 = self.Modlist[i]["ModTXDPath"],	
			
			MODDFFID     = self.Modlist[i]["ModDFFID"],	
			MODDFFPATH   = self.Modlist[i]["ModDFFPath"],
			
			MODCOLID     = self.Modlist[i]["ModCOLID"],	
			MODCOLPATH   = self.Modlist[i]["ModCOLPath"],
			INFO = self.Modlist[i]["INFO"],
			PIC = self.Modlist[i]["PIC"],
		});
	end
	if not(#self.Templist[client] > 0)then
		return triggerClientEvent(client, "onModlistReturn", client, "nothing", onConnect);
	end
	triggerClientEvent(client, "onModlistReturn", client, self.Templist[client], onConnect );
	
	self.Templist[client] = nil;
end

function DownloadManager:Destructer()
	if(self.Player[source])then
		if(isTimer(self.Player[source]["LatentTimer"]))then
			killTimer(self.Player[source]["LatentTimer"]);
		end
		cancelLatentEvent(source, getLatentEventHandles(source)[#getLatentEventHandles(source)]);
		outputDebugString("Modloader: Download vom User "..source:getName().." wurde Abgebrochen!");
	end
	self.Player[source] = nil;
end

function DownloadManager:DownloadComplete()
	self.Player[client]["Downloading"] = false;
end

function DownloadManager:UpdateDownloadStatus(id, client)
	if(self.Player[client])then
		self.Player[client]["LatentHandler"] = getLatentEventHandles(client)[#getLatentEventHandles(client)];
		
		if(self.Player[client]["LatentHandler"])then
			
			self.Player[client]["LatentStatus"] = getLatentEventStatus(client, self.Player[client]["LatentHandler"]);
			
			if(self.Player[client]["LatentStatus"])then
				triggerClientEvent(client, "onClientUpdateStatus", client, self.Player[client]["LatentStatus"].percentComplete, self.Player[client]["LatentStatus"].totalSize, self.Modlist[id]["Modname"]);
			end
		else
			if self.Player[client]["LatentTimer"]:isValid() then
				killTimer(self.Player[client]["LatentTimer"]);
			end
		end
	end
end

	
function isActivate(string)
	local str = tostring(string);
	if(str == 'disable')then
		return false;
	else
		return true;
	end
end