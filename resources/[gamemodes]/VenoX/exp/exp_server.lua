--[[EXP = {}

function EXP.new(...)
	local o = setmetatable({}, {__index = EXP})
	if o.constructor then
		o:constructor(...)
	end
	return o
end

function EXP:constructor()
	self.m_Players = {}
	self.m_Multiplicator = 1

	-- f(x) = base_exp*(level^1.15)
	self.m_BaseEXP = 1000
	self.m_Factor  = 1.15

	-- Admin commands
	addCommandHandler("setfactor",
		function(player, cmd, factor)
			-- Security checks
			if vnxGetElementData(player, "adminlvl") <= 5 then
				return
			end

			self.m_Multiplicator = tonumber(factor) or 1
		end
	)

	addCommandHandler("clearEXP", 
		function(player, cmd)
			-- Security checks
			if vnxGetElementData(player, "adminlvl") <= 5 then
				return
			end

			-- Execute clear instruction
			dbExec(handler, "UPDATE userdata SET RP=0")
			self:print(player, "Cleared all userdata!")

			-- Reset all current exp
			for idx, value in pairs(getElementsByType("player")) do
				self:setPlayerEXP(value, 0, false)
			end
		end
	)
end

function EXP:print(player, msg)
	outputChatBox("[EXP] #FFFFFF"..msg, player, 0, 204, 153, true)
end

function EXP:setMultiplicator(factor)
	assert(type(factor) == "number", "Bad argument @ setMultiplicator #1")

	if factor > 0 then
		self.m_Multiplicator = factor
	end
end

function EXP:getMaximalEXP(level)
	assert(type(level) == "number", "Bad argument @ EXP:getMaximalEXP #1")

	return math.floor(self.m_BaseEXP*math.pow(level, self.m_Factor))
end

function EXP:getLevelFromEXP(exp)
	assert(type(exp) == "number", "Bad argument @ EXP:getLevelFromEXP #1")

	return math.floor(math.pow(exp/self.m_BaseEXP, 1/self.m_Factor)) or 0
end

function EXP:getSyncPacket(player)
	assert(getElementType(player) == "player", "Bad argument @ EXP:getSyncPacket #1")

	-- sync packet
	local packet = {}

	-- Obtain players exp, level and exp to reach the next level
	local exp      = self.m_Players[player]
	local level    = self:getLevelFromEXP(exp)
	local baseEXP  = self:getMaximalEXP(level)
	local totalEXP = self:getMaximalEXP(level+1)
	
	-- Fill the sync packet
	if exp and level and baseEXP and totalEXP then
		packet = {exp, baseEXP, level, totalEXP}
	else
		packet = {0, 0, 0, self.m_BaseEXP}
	end

	-- Return our created sync packet
	return packet
end

function EXP:setPlayerEXP(player, exp, sync)
	assert(getElementType(player) == "player", "Bad argument @ EXP:setPlayerEXP #1")
	assert(type(exp) == "number", "Bad argument @ EXP:setPlayerEXP #2")
	assert(type(sync) == "boolean", "Bad argument @ EXP:setPlayerEXP #3")

	-- Create default value
	if not self.m_Players[player] then
		self.m_Players[player] = 0
	end

	-- Set actual value
	self.m_Players[player] = exp

	-- Inform client
	if sync then
		triggerClientEvent(player, "exp:update", player, self:getSyncPacket(player))
	end
end

function EXP:getPlayerEXP(player)
	assert(getElementType(player) == "player", "Bad argument @ EXP:getPlayerEXP #1")

	-- Create default value
	if not self.m_Players[player] then
		self.m_Players[player] = 0
	end

	return self.m_Players[player]
end

function EXP:givePlayerEXP(player, exp)
	assert(getElementType(player) == "player", "Bad argument @ EXP:givePlayerEXP #1")
	assert(type(exp) == "number", "Bad argument @ EXP:givePlayerEXP #2")

	return self:setPlayerEXP(player, self:getPlayerEXP(player) + ( exp * self.m_Multiplicator ), true, true)
end

function EXP:takePlayerEXP(player, exp)
	assert(getElementType(player) == "player", "Bad argument @ EXP:takePlayerEXP #1")
	assert(type(exp) == "number", "Bad argument @ EXP:takePlayerEXP #2")

	return self:setPlayerEXP(player, self:getPlayerEXP(player) - ( exp * self.m_Multiplicator ), true, true)
end

-- EVENT HANDLER
g_EXP = EXP.new()


	USAGE:
		g_EXP:setPlayerEXP(player, exp, show)
		g_EXP:givePlayerEXP(player, exp)
		g_EXP:takePlayerEXP(player, exp)

		g_EXP:getPlayerEXP(player)
]]