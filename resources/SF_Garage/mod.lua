 function replaceModel()
   local txd = engineLoadTXD ( "data/oldgarage_sfse.txd")
   engineImportTXD ( txd, 11387 )
   
   local txd = engineLoadTXD ( "data/oldgarage_sfse.txd")
   engineImportTXD ( txd, 11326 )
   
   local txd = engineLoadTXD ( "data/hubint1_sfse.txd")
   engineImportTXD ( txd, 11389 ) 
 end
 addEventHandler ( "onClientResourceStart", resourceRoot,
     function()
         replaceModel()
         setTimer (replaceModel, 1000, 1)
     end
)
-- TXD dont load? use this command =)
addCommandHandler("reloadmod", replaceModel)

