Storage = inherit(Singleton)

function Storage:constructor(host, port, user, password, database, unixpath)
    local connectString = ("dbname=%s;host=%s;port=%d;unix_socket=%s"):format(database, host, port or 3306, unixpath or "")
	self.m_Handler = dbConnect("mysql", connectString, user, password, "share=0;batch=1;autoreconnect=1;log=0;")
	if not self.m_Handler then
		stopResource(getThisResource())
	end
end

function Storage:destructor()
    destroyElement(self.m_Handler)
end

function Storage.dbPoll(qh, timeout)
    local result, numrows, errmsg = dbPoll(qh, timeout)
	if result == nil then
		outputDebugString("[MySQL] dbPoll - result not ready yet" )
	elseif result == false then
	    outputDebugString("[MySQL] dbPoll failed. Error code: " .. tostring(numrows) .. "  Error message: " .. tostring(errmsg))
	end
	return result
end

function Storage:queryExec(query, ...)
	-- Execute query
    dbExec(self.m_Handler, query, ...)
end

function Storage:queryFetch(...)
    local args = {...}
    if type(args[1]) == "string" then
        return self.dbPoll(dbQuery(self.m_Handler, ...), -1)

    else
        -- Obtain argument
        local callback = args[1]
        local query = args[2]

        -- Remove query and the callback from args
		table.remove(args, 1)
		table.remove(args, 1)

        -- Call query
        dbQuery(
			function(qh) 
				local callbackArgs = {Storage.dbPoll(qh, -1)}
				callback(unpack(callbackArgs))
			end,
			self.m_Handler,
			query,
			unpack(args)
		)
    end
end

function Storage:queryFetchSingle(...)
    local args = {...}
	if type(args[1]) == "string" then
		return self.dbPoll(dbQuery(self.m_Handler, ...), -1)[1]
	else
        -- Obtain argument
		local query = args[2]
		local callback = args[1]
		
		-- Remove query and the callback from args
		table.remove(args, 1)
		table.remove(args, 1)
		
        -- Call query
		dbQuery(
			function(qh) 
				local callbackArgs = {self.dbPoll(qh, -1)[1]}
				callback(unpack(callbackArgs))
			end,
			self.m_Handler,
			query,
			unpack(args)
		)
	end
end