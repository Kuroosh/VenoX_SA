local ID = 17017
local ID1 = 1491
function mods ()
	local txd = engineLoadTXD("2.txd")
	engineImportTXD(txd,ID)
	local dff = engineLoadDFF("2.dff")
	engineReplaceModel(dff,ID)
	local col = engineLoadCOL("2.col")
	engineReplaceCOL(col,ID)
	txd1 = engineLoadTXD ( "3.txd" )
    engineImportTXD ( txd1, 3095 )
    local txd2 = engineLoadTXD("1.txd")
	engineImportTXD(txd2,ID1)
	local dff2 = engineLoadDFF("1.dff")
	engineReplaceModel(dff2,ID1)
end
addEventHandler('onClientResourceStart',getResourceRootElement(getThisResource()),mods)