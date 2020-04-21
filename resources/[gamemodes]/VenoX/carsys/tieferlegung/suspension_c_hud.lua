function CriarJanela()
	janela_ctrl = guiCreateWindow(639, 448, 151, 120, "Tieferlegerung", false)
	guiWindowSetSizable(janela_ctrl, false)
	guiSetAlpha(janela_ctrl, 0.50)
	SuspensionUp = guiCreateButton(12, 44, 122, 26, "˄", false, janela_ctrl)
	SuspensionDown = guiCreateButton(12, 76, 122, 23, "˅", false, janela_ctrl)
	TxtHoldCtrl = guiCreateLabel(12, 19, 127, 15, "", false, janela_ctrl)    
	guiSetVisible ( janela_ctrl, false )
 end


function EscondeMostra()
	 
	if (guiGetVisible(janela_ctrl) == false) then	
		guiSetVisible(janela_ctrl, true)				  
		bindKey("mouse_wheel_up", "down", Levanta) 
		bindKey("mouse_wheel_down", "down", Desce)
		bindKey("num_add", "down", Levanta) 
		bindKey("num_sub", "down", Desce)
	else
		EscondeJanela()
	end
end
			
function EscondeJanela()		
    guiSetVisible(janela_ctrl, false)		
    unbindKey("mouse_wheel_up", "down", Levanta) 
	unbindKey("mouse_wheel_down", "down", Desce)
	unbindKey("num_add", "down", Levanta) 
	unbindKey("num_sub", "down", Desce)

end
addEventHandler( "onClientPlayerVehicleExit", getLocalPlayer(), EscondeJanela  )

			
function onGuiClick ()
    if (source == SuspensionUp) then
        triggerServerEvent("subir", getLocalPlayer())
    elseif (source == SuspensionDown) then
        triggerServerEvent("descer", getLocalPlayer())
    end
end
addEventHandler("onClientGUIClick",root,onGuiClick)	  
addEventHandler( "onClientResourceStart", getResourceRootElement( getThisResource( ) ), CriarJanela )
