local kickMsg = "Dein Chatverhalten Gefällt uns nicht!"


local adminLevels = {
	["VIP"] = 1,
	["Ticketsupporter"] = 2,
	["Supporter"] = 3,
	["Moderator"] = 4,
	["Administrator"] = 5,
	["Stlv.Projektleitung"] = 6,
	["Projektleiter"] = 7
}
donatorMute = {}
local adminmarks = {}


-------- code --------
local filters = {}

(function()
  local filterList = xmlLoadFile("admin/filters.xml")
  if (not filterList) then
    outputDebugString("Chatfilter error: filters.xml not found!",2)
  else
    outputDebugString("Chatfilter info: loaded filters.xml")
    local count = 0
    local nodes = xmlNodeGetChildren(filterList)
    for i,node in ipairs(nodes) do
      filters[i] = xmlNodeGetValue(node)
      count = count+1
    end
    outputDebugString("Chatfilter info: loaded " .. count .. " filters")
    xmlUnloadFile(filterList)
  end
end)()

addEventHandler("onPlayerChat",root,
  function(message)
    message = string.lower(message)
    local found = false
    for _,stringToCheck in ipairs(filters) do
      if (string.find(message,stringToCheck) ~= nil) then
        found = true
        break;
      end
    end
    if (found) then
      if message == "o.k. wuerden sie mir die erlaubnis geben, sie zu durchsuchen?" or message == "ich habe illegale gegenstaende bei ihnen gefunden und werde sie ihnen jetzt abnehmen!" or message == "o.k. wuerden sie mir nun den inhalt ihres kofferraums zeigen?" or message == "rde" or message == "wuerden" 
      or message == "würden sie mir bitte ihre lizenzen zeigen?" or message == "ich habe illegale gegenstände bei ihnen gefunden und werde sie ihnen jetzt abnehmen!" or message == "o.k. würden sie mir die erlaubnis geben, sie zu durchsuchen?" or message == "wuerden sie mir bitte ihre lizenzen zeigen?" or message == "ts3.venox-reallife.com" or message == "www.venox-reallife.com" or message == "venox-reallife.com" or message == "venox-reallife" then
      else 
        outputDebugString(stringToCheck)
        sendMSGForAdmins("[Venox-Anti-Werbung] : "..getPlayerName(source).." Hat '" ..message.. "' Geschrieben!",255,0,0)
      end 
        --kickPlayer(source,"Console",kickMsg)
    end
  end
)