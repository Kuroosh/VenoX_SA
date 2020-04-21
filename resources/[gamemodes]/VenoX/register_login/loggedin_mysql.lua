function setPlayerLoggedIn ( name )

	dbExec ( handler, "UPDATE loggedin SET ?? = ? WHERE UID=?", "Loggedin", "1", playerUID[name] )
end

function removePlayerFromLoggedIn ( name )

	dbExec ( handler, "DELETE FROM loggedin WHERE UID=?", playerUID[name] )
end

function deleteAllFromLoggedIn ()

	dbExec ( handler, "TRUNCATE TABLE loggedin" )
end
deleteAllFromLoggedIn ()