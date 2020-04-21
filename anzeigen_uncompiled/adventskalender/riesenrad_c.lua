local scX, scY = guiGetScreenSize();
local lps = { x = -2078.62377, y = 1426.4119, z = 7.33, rz = 90 };  -- Position where player will be teleported after he leaves a cabin
local bdKey = { 'K' };                                      -- Keys to get inside [1] and outside [2] of the cabin ('K' and 'L' by default)
local tstgs = {
  text = "Press '"..bdKey[ 1 ].."' to get into the cabin",       -- Text that will show up when cabin gets closer to a player
  font = 'bankgothic',                                           -- Text font (can be a custom font too)
  scale = 0.7,                                                   -- Text scale
  color = tocolor( 255, 255, 255, 255 ),                         -- Text color
  shadow = tocolor( 0, 0, 0, 255 )                               -- Text shadow color
};

local inGondel = false
local holding = false
local rnd = 0

addEventHandler( 'onClientResourceStart', resourceRoot, function()
  engineReplaceCOL( engineLoadCOL( 'anzeigen/adventskalender/fcabin.col' ), 3752 );
  setTimer(triggerServerEvent, 3000, 1, 'client_getCabinsCollision', localPlayer )
end );

addEventHandler( 'onClientResourceStop', resourceRoot, function()
  setCameraClip( true, true );
end );

addEventHandler( 'onClientElementStreamIn', root, function()
  if getElementModel( source ) == 3752 then
    engineReplaceCOL( engineLoadCOL( 'anzeigen/adventskalender/fcabin.col' ), 3752 );
  end;
end );

addEvent( 'server_sendCabinsCollision', true );
addEventHandler( 'server_sendCabinsCollision', root, function( t )
  for i, col in ipairs( t ) do
    addEventHandler( 'onClientColShapeHit', col, function( player, dim )
     if player == localPlayer and dim and inGondel == false then
        bindKey( bdKey[ 1 ], 'down', getInside, col );
        tstgs.text = "Mit '"..bdKey[ 1 ].."' kannst du einsteigen, wenn du ein Ticket hast.";
        addEventHandler( 'onClientRender', root, drawNotice );
        setCameraClip( false, true );
      elseif player == localPlayer and dim and inGondel == true then
		--setTimer(leaveCabin, 1000, 1)
	  end
    end );
    
    addEventHandler( 'onClientColShapeLeave', col, function( player, dim )
      if player == localPlayer and dim then
        removeEventHandler( 'onClientRender', root, drawNotice );
        unbindKey( bdKey[ 1 ], 'down', getInside );
        setCameraClip( true, true );
      end;
    end );
  end;
end );

addEventHandler( 'onClientPlayerWasted', localPlayer, function()
  unbindKey( bdKey[ 1 ], 'down', getInside );
  removeEventHandler('onClientRender', root, drawNotice);
  setCameraClip( true, true );
end );

function drawNotice()
  dxDrawText( tstgs.text, scX*0.5 - dxGetTextWidth( tstgs.text, tstgs.scale, tstgs.font )/2, scY*0.85 + 1, scX, scY, tstgs.shadow, tstgs.scale, tstgs.font );
  dxDrawText( tstgs.text, scX*0.5 - dxGetTextWidth( tstgs.text, tstgs.scale, tstgs.font )/2, scY*0.85, scX, scY, tstgs.color, tstgs.scale, tstgs.font );
end;

local myhold = 0
function getInside( key, state, col )
	if (getElementData(getLocalPlayer(), "rrad") and getElementData(getLocalPlayer(), "rrad") == true) then
		if (holding == true) then
			local x, y, z = getElementPosition( col );
			setElementPosition( localPlayer, x - 0.5, y, z );
			unbindKey( bdKey[ 1 ], 'down', getInside );
			inGondel = true
			removeEventHandler('onClientRender', root, drawNotice);
			
			checkTimer = setTimer(function()
				if (myhold >= 2) then
					setTimer(leaveCabin, 1000, 1)
					killTimer(checkTimer)
				end
				if (holding == true) then
					myhold = myhold + 1
				end
			end, 10000, 0)
			
		else
			tstgs.text = "Warte bis die Gondeln anhalten."
			setTimer(function()
				tstgs.text = "Mit '"..bdKey[ 1 ].."' kannst du einsteigen, wenn du ein Ticket hast.";
			end, 3000, 1)
		end
	end
end;

function leaveCabin( key, state )
  setElementPosition( localPlayer, lps.x, lps.y, lps.z );
  setElementRotation( localPlayer, 0, 0, lps.rz );
  inGondel = false
  myhold = 0
  setElementData(getLocalPlayer(), "rrad", false)
end;

addEvent( 'gondelnHolding', true );
addEventHandler( 'gondelnHolding', root, function(bool)
	--outputChatBox("Einsteigeeeeeeeeeen!")
	holding = true
	setTimer(function()
		holding = false
	end, 10000, 1)
end)