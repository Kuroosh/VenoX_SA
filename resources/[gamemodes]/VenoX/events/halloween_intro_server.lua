function resyncWeatherAndTimeFromHalloween ()

	triggerClientEvent ( client, "resyncWeatherAndTimeFromHalloween", client, getWeather (), getTime () )
end
addEvent ( "resyncWeatherAndTimeFromHalloween", true )
addEventHandler ( "resyncWeatherAndTimeFromHalloween", getRootElement(), resyncWeatherAndTimeFromHalloween )