------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

LSPDgateMoved = false
LSPDGate1 = createObject ( 980, 1588.1999511719, -1637.9000244141, 15, 0, 0, 180 )

local function LSPD_Gate_LS_func ( player )

	if isCop(player) or isOnDuty(player) then
		if getDistanceBetweenPoints3D ( 1588.1999511719, -1637.9000244141, 15, getElementPosition ( player ) ) < 17 then
			if LSPDgateMoved == false then
				moveObject ( LSPDGate1, 1500, 1598.1500244141, -1637.9000244141, 15 )
				LSPDgateMoved = true
			else
				moveObject ( LSPDGate1, 1500, 1588.1999511719, -1637.9000244141, 15 )
				LSPDgateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", LSPD_Gate_LS_func )


PDLiftMoving = false
PDLiftMoved = false
PDLiftMovetime = 4000
PDLift = createObject ( 2633, 1549.4000244141, -1635.9000244141, 11, 0, 0, 0 )

local function PDLift_func ( player )
if isCop(player) or isOnDuty(player) then
	if not PDLiftMoving then
		if PDLiftMoved == false then
			moveObject ( PDLift, PDLiftMovetime, 1549.4000244141, -1635.9000244141, 25.7, 0, 0, 0 )
			setTimer ( triggerPDLiftVarb, PDLiftMovetime, 1 )
			PDLiftMoved = true
		else
			moveObject ( PDLift, PDLiftMovetime, 1549.4000244141, -1635.9000244141, 11, 0, 0, 0 )
			setTimer ( triggerPDLiftVarb, PDLiftMovetime, 1 )
			PDLiftMoved = false
            PDLiftMoving = true
        end
    end
end
end
addCommandHandler ( "mv", PDLift_func )

function triggerPDLiftVarb ()

    PDLiftMoving = false
end