addEvent ( "deActivateCustomRadar", true )

function news1 ()
	outputChatBox ( "#383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ #00BFFFVenoX-RL Info #383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", getRootElement(), 56, 56, 56, true )
	outputChatBox ( "#00BFFF╔ #FFFFFFUnseren Teamspeak 3 Server findest du unter: ts3.venox-reallife.com", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFUnser Forum findest du unter: www.venox-reallife.com", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFDu kannst nun den Globalchat mit /globalset Ausschalten.", getRootElement(), 255, 255, 225 ,true)
	outputChatBox ( "#00BFFF╚ #FFFFFFBei Fragen oder Problemen verwende „/self --> Support``.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", getRootElement(), 56, 56, 56 )
	setTimer ( news2, 600000, 1 )
end
function news2 ()
	outputChatBox ( "#383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ #00BFFFVenoX-RL Info #383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", getRootElement(), 56, 56, 56, true )
	outputChatBox ( "#00BFFF╔ #FFFFFFUnseren Teamspeak 3 Server findest du unter: ts3.venox-reallife.com", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFBei Fragen oder Problemen verwende „/self --> Support``.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFDu kannst nun den Globalchat mit /globalset Ausschalten.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╚ #FFFFFFDas VenoX-RL Team wünscht euch viel Spaß auf dem Server.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", getRootElement(), 56, 56, 56 )
	setTimer ( news3, 600000, 1 )
end
function news3 ()
	outputChatBox ( "#383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ #00BFFFVenoX-RL Info #383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", getRootElement(), 56, 56, 56, true )
	outputChatBox ( "#00BFFF╔ #FFFFFFUnser Forum findest du unter: www.venox-reallife.com", getRootElement(), 255 , 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFDu kannst nun den Globalchat mit /globalset Ausschalten.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFBei Fragen oder Problemen verwende „/self --> Support``.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╠ #FFFFFFDu hast eine Beschwerde? Dann poste diese im Forum unter „Beschwerden“.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "#00BFFF╚ #FFFFFFDas VenoX-RL Team wünscht euch viel Spaß auf dem Server.", getRootElement(), 255, 255, 225,true )
	outputChatBox ( "≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", getRootElement(), 56, 56, 56 )
	setTimer ( news1, 600000, 1 )
end
setTimer ( news1, 600000, 1 )

function infobox ( player, text, time, r, g, b )

	if isElement ( player ) then
		triggerClientEvent ( player, "infobox_start", getRootElement(), text, time, r, g, b )
	end
end
