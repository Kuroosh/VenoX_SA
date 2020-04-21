------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

ComptonDeliver = createMarker ( Comptonx, Comptony, Comptonz, "checkpoint", 7, 255, 0, 0, 150, getRootElement() )
ComptonDeliverBlip = createBlip ( Comptonx, Comptony, Comptonz, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
setElementVisibleTo ( ComptonDeliver, getRootElement(), false )
setElementVisibleTo ( ComptonDeliverBlip, getRootElement(), false )

function ComptonDeliver_func ( player, dim )
if isGrove  (player) then
	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			if getElementModel ( veh ) == 609 then
				if vnxGetElementData ( veh, "matstruck" ) == 1 then
					killTimer ( MatsKillTimer )
					local mats = vnxGetElementData ( veh, "mats" )
					local kosten = vnxGetElementData ( veh, "kosten" )
					
					ComptonMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE 'Comptons'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Comptons'") )
					
				
					local Fammatsneu = ComptonMats + tonumber(mats)
					local ComptonFamkasseNew = ComptonFamkasse - tonumber(kosten)
					
					MySQL_SetString("fraktionen", "DepotMaterials", Fammatsneu, "Name LIKE 'Compton s'")
					MySQL_SetString("fraktionen", "DepotGeld", ComptonFamkasseNew, "Name LIKE 'Compton s'")		
							
					ComptonMats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "NAME LIKE 'Compton s'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "NAME LIKE 'Compton s'") )
	
					outputChatBox ( "Matslieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse zurück!", player, 0, 200, 0 )
					outputChatBox ( "Ausserdem bekommst du deine Tec-9 (200 Schuss) für diese Lieferung.", player, 0, 200, 0 )
					local msg = "[MATSTRUCK]: Der Matstruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 0, 150, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[MATSTRUCK]: "..getPlayerName ( player ).." hat bei den Compton s einen Matstruck fuer "..kosten.."$ abgegeben!", "bad" )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( ComptonDeliver, getRootElement(), false )
					setElementVisibleTo ( ComptonDeliverBlip, getRootElement(), false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(matsclean, 3600000, 1)
					giveWeapon ( player, 32, 200 )
				elseif vnxGetElementData ( veh, "kokstruck" ) == 1 then
					killTimer ( KoksKillTimer )
					local koks = vnxGetElementData ( veh, "koks" )
					local kosten = vnxGetElementData ( veh, "kosten" )
					
					ComptonKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKoks", "Name LIKE 'Compton s'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton s'") )
					
				
					local Famkoksneu = ComptonKoks + koks
					local ComptonFamkasseNew = ComptonFamkasse - kosten
					
					MySQL_SetString("fraktionen", "DepotKoks", Famkoksneu, "Name LIKE 'Compton s'")
					MySQL_SetString("fraktionen", "DepotGeld", ComptonFamkasseNew, "Name LIKE 'Compton s'")		
							
					ComptonKoks = tonumber ( MySQL_GetString("fraktionen", "DepotKoks", "Name LIKE 'Compton s'") )
					ComptonFamkasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Compton s'") )
	
					outputChatBox ( "Kokainlieferung abgegeben. Du erhältst "..kosten.."$ aus der Fraktionskasse zurück!", player, 0, 200, 0 )
					local msg = "[KOKAINTRUCK]: Der Kokaintruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 0, 150, 0 )
					sendMSGForFaction ( msg, 10, 200, 0, 0 )
					outputLog ( "[KOKAINTRUCK]: "..getPlayerName ( player ).." hat bei den Comptons einen Kokaintruck fuer "..kosten.."$ abgegeben!", "bad" )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + kosten )
					givePlayerMoney ( player, kosten )
					setElementVisibleTo ( ComptonDeliver, getRootElement(), false )
					setElementVisibleTo ( ComptonDeliverBlip, getRootElement(), false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(koksclean, 3600000, 1)
				elseif vnxGetElementData ( veh, "samentruck" ) == 1 then
					killTimer ( SamenKillTimer )
					local samen = vnxGetElementData ( veh, "samen" )

					outputChatBox ( "Hanfsamenlieferung abgegeben. Du erhältst "..samen.." Premiumsamen.", player, 0, 200, 0 )
					local msg = "[HANFSAMENTRUCK]: Der Hanfsamentruck wurde erfolgreich abgegeben!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
					sendMSGForFaction ( msg, 3, 200, 200, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					sendMSGForFaction ( msg, 7, 200, 0, 0 )
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					sendMSGForFaction ( msg, 9, 0, 150, 0 )
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
					outputLog ( "[HANFSAMENTRUCK]: "..getPlayerName ( player ).." hat bei den Comptons einen Hanfsamentruck mit "..samen.." Premiumsamen abgegeben!", "bad" )
					vnxSetElementData ( player, "premiumseeds", vnxGetElementData ( player, "premiumseeds" ) + samen )
					setElementVisibleTo ( ComptonDeliver, getRootElement(), false )
					setElementVisibleTo ( ComptonDeliverBlip, getRootElement(), false )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					removePedFromVehicle ( player )
					removePedFromVehicle ( getVehicleOccupant ( veh, 1 ) )
					setElementPosition ( veh, 0, 0, -500 )
					destroyElement ( veh )
					setTimer(samenclean, 3600000, 1)
				end
			end
		end
	end
end
end
addEventHandler ( "onMarkerHit", ComptonDeliver, ComptonDeliver_func )