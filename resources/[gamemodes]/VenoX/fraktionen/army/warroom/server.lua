servertrackmode = 1
servertrackedplayer = nil

addEvent( "onTrackModeChange", true )
function trackModeChanged ( trackmode, trackedplayer )
	servertrackmode = trackmode
	if trackedplayer then
		triggerClientEvent ( "onTrackerUpdated", getRootElement(), trackmode, trackedplayer )
		servertrackedplayer = trackedplayer
	else
		triggerClientEvent ( "onTrackerUpdated", getRootElement(), trackmode )
	end
end
addEventHandler( "onTrackModeChange", getRootElement(), trackModeChanged )

addEvent( "onJoinerSyncrequest", true )
function trackModeSync ()
	if servertrackedplayer ~= nil then
		triggerClientEvent ( "onTrackerUpdated", source, trackmode, trackedplayer )
	else
		triggerClientEvent ( "onTrackerUpdated", source, trackmode )
	end
end
addEventHandler( "onJoinerSyncrequest", getRootElement(), trackModeSync )


function refreshTrackInfo()
	if isElement(servertrackedplayer) then
		local theVehicle = getPedOccupiedVehicle(servertrackedplayer)
		if theVehicle == false then
			vehicle = "on foot"
		else
			vehicle = getVehicleName(theVehicle)
		end
		location = getElementZoneName(servertrackedplayer)
		city = getElementZoneName(servertrackedplayer, true)
		local theWeapon = getPedWeapon(servertrackedplayer)
		weapon = getWeaponNameFromID (theWeapon)
		armor = getPedArmor(servertrackedplayer)
		triggerClientEvent (getRootElement(), "onTrackerInfoUpdate", servertrackedplayer, vehicle, location, city, weapon, armor )
	end
end
setTimer(refreshTrackInfo, 1000, 0)