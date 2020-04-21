------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

badLogPath = ":"..resourceName.."/logs/badlog.log"

function outputBadLog ( text )

	local badLog = fileOpen ( badLogPath, false )
	local filesize = fileGetSize ( badLog )
	fileSetPos ( badLog, filesize )
	fileWrite ( badLog, timestamp()..": "..text.."\n" )
	fileClose ( badLog )
end