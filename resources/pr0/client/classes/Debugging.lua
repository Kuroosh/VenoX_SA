Debugging = inherit(Singleton)

function Debugging:constructor()
    addCommandHandler("dcrun", bind(Debugging.runString, self))
end

function Debugging:runString(cmd, ...)
    local commandstring = table.concat({...}, " ")
    outputChatBox("Executing client-side command: "..commandstring)

	local notReturned
	local commandFunction,errorMsg = loadstring("return "..commandstring)
	if errorMsg then
		commandFunction, errorMsg = loadstring(commandstring)
	end
	if errorMsg then
		outputChatBox("Error: "..errorMsg)
		return
	end
	local results = { pcall(commandFunction) }
	if not results[1] then
		outputChatBox("Error: "..results[2])
		return
	end
	local resultsString = ""
	local first = true
	for i = 2, #results do
		if first then
			first = false
		else
			resultsString = resultsString..", "
		end
		local resultType = type(results[i])
		if isElement(results[i]) then
			resultType = "element:"..getElementType(results[i])
		end
		resultsString = resultsString..tostring(results[i]).." ["..resultType.."]"
	end
	if #results > 1 then
		outputChatBox("Command results: " ..resultsString)
		return
	end
	outputChatBox("Command executed!")
end