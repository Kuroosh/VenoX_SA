DGS = exports.dgs

function DrawAdminWindow()
--MainWindow = VnX:dgsCreateWindow ( 1, 1, 1366, 768, "FulLScreenTest", false)
spawnScreenMenu = DGS:dgsCreateWindow ( 0.15, 0.33, 0.7, 0.34, "Select your weapons", true )
end 
addCommandHandler("testlib", DrawAdminWindow)