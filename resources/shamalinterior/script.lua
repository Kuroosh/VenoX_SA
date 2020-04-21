for i,vehicles in ipairs(getElementsByType("vehicle")) do
	if getVehicleName(vehicles) == "Shamal" then
		setElementData(vehicles, "HavePersonalDimension", false)
		setElementData(vehicles, "PersonalDimension", nil)
	end
end
function shamalBinds(thePlayer)
	bindKey(thePlayer, "g", "down",
		function()
			local firstAction = false
			local success = false
			local theVehicle = nil
			for i,vehicles in ipairs(getElementsByType("vehicle")) do
				if success == true then return true end
				if getVehicleName(vehicles) == "Shamal" then
					if getElementData(vehicles, "HavePersonalDimension") == true then
						local x, y, z = getElementPosition(thePlayer)
						local vx, vy, vz = getElementPosition(vehicles)
						if getDistanceBetweenPoints3D(x, y, z, vx, vy, vz) < 5 then
							success = true
							firstAction = true
							theVehicle = vehicles
							if getPedOccupiedVehicle(thePlayer) then
								local playerVehicle = getPedOccupiedVehicle(thePlayer)
								if getVehicleType(playerVehicle) == "Bike" then
									local model = getElementModel(playerVehicle)
									destroyElement(playerVehicle)
									playerVehicle = createVehicle(model, 1.6480058431625, 25.451831817627, 1199.59375)
									setElementRotation(playerVehicle, 0, 0, 0)
									setElementVelocity(playerVehicle, 0, 0, 0)
									setElementDimension(playerVehicle, getElementData(theVehicle, "PersonalDimension"))
									setElementInterior(playerVehicle, 1)
									warpPedIntoVehicle(thePlayer, playerVehicle)
								
									setElementInterior(thePlayer, 1)
									setElementDimension(thePlayer, getElementData(theVehicle, "PersonalDimension"))
								end
							else
								setElementPosition(thePlayer, 1.6480058431625, 25.451831817627, 1199.59375)
								setElementInterior(thePlayer, 1)
								setElementDimension(thePlayer, getElementData(theVehicle, "PersonalDimension"))
							end
						end
					end
				end
			end
			if firstAction == true then return true end
			local inDimension = false
			local result = false
			local playerDimension = getElementDimension(thePlayer)
			local playerInterior = getElementInterior(thePlayer)
			local px, py, pz = getElementPosition(thePlayer)
			if playerInterior == 1 and getDistanceBetweenPoints3D(px, py, pz, 1.6480058431625, 25.451831817627, 1199.59375) < 10 then
				for i,vehicles in ipairs(getElementsByType("vehicle")) do
					if inDimension == true then return true end
					if result == true then return true end
					if getVehicleName(vehicles) == "Shamal" then
						if getElementData(vehicles, "PersonalDimension") == playerDimension then
							inDimension = true
							result = true
							local theVehicle = vehicles
							local vx, vy, vz = getElementPosition(theVehicle)
							local rx, ry, rz = getElementRotation(theVehicle)
							rz = rz + 180
							rz = math.rad(rz)
							vx = vx + 3 * math.cos(rz)
							vy = vy + 3 * math.sin(rz)
							if getPedOccupiedVehicle(thePlayer) then
								local playerVehicle = getPedOccupiedVehicle(thePlayer)
								local model = getElementModel(playerVehicle)
								destroyElement(playerVehicle)
								playerVehicle = createVehicle(model, vx, vy, vz + 3)
								setElementInterior(playerVehicle, 0)
								setElementDimension(playerVehicle, 0)
								warpPedIntoVehicle(thePlayer, playerVehicle)
							end
							setElementInterior(thePlayer, 0)
							setElementDimension(thePlayer, 0)
							setElementPosition(thePlayer, vx, vy, vz)
						end
					end
				end
				if result == false then
					setElementHealth(thePlayer, 0)
				end
			end
		end
	)
end
for i,players in ipairs(getElementsByType("player")) do
	shamalBinds(players)
end
addEventHandler("onPlayerJoin", getRootElement(),
	function()
		shamalBinds(source)
	end
)
setTimer(
	function()
		for i,dimensions in ipairs(getElementsByType("shamaldimension")) do
			if getElementData(dimensions, "occupied") == true then
				for i,vehicles in ipairs(getElementsByType("vehicle")) do
					if getVehicleName(vehicles) == "Shamal" then
						if getElementData(vehicles, "HavePersonalDimension") == true then
							if getElementData(vehicles, "PersonalDimension") == getElementData(dimensions, "dimension") then
								if isVehicleBlown(vehicles) then
									destroyElement(vehicles)
									destroyElement(dimensions)
								end
							end
						end
					end
				end
			end
		end
		for i,players in ipairs(getElementsByType("player")) do
			for i,dimensions in ipairs(getElementsByType("shamaldimension")) do
				local data = getElementData(dimensions, "dimension")
				if getElementDimension(players) == data and getElementInterior(players) == 1 then
					local present = false
					for i,vehicles in ipairs(getElementsByType("vehicle")) do
						if present == true then return true end
						if getVehicleName(vehicles) == "Shamal" then
							if getElementData(vehicles, "HavePersonalDimension") == true then
								if getElementData(vehicles, "PersonalDimension") == data then
									present = true
								end
							end
						end
					end
					local px, py, pz = getElementPosition(players)
					if getDistanceBetweenPoints3D(px, py, pz, 1.6480058431625, 25.451831817627, 1199.59375) < 10 and present == false then
						setElementHealth(players, 0)
					end
				end
			end
		end
		for i,players in ipairs(getElementsByType("ped")) do
			for i,dimensions in ipairs(getElementsByType("shamaldimension")) do
				local data = getElementData(dimensions, "dimension")
				if isElement(players) then
				if getElementDimension(players) == data and getElementInterior(players) == 1 then
					local present = false
					for i,vehicles in ipairs(getElementsByType("vehicle")) do
						if present == true then return true end
						if getVehicleName(vehicles) == "Shamal" then
							if getElementData(vehicles, "HavePersonalDimension") == true then
								if getElementData(vehicles, "PersonalDimension") == data then
									present = true
								end
							end
						end
					end
					local px, py, pz = getElementPosition(players)
					if getDistanceBetweenPoints3D(px, py, pz, 1.6480058431625, 25.451831817627, 1199.59375) < 10 and present == false then
						destroyElement(players)
					end
				end
				end
			end
		end
		for i,players in ipairs(getElementsByType("vehicle")) do
			for i,dimensions in ipairs(getElementsByType("shamaldimension")) do
				local data = getElementData(dimensions, "dimension")
				if isElement(players) then
				if getElementDimension(players) == data and getElementInterior(players) == 1 then
					local present = false
					for i,vehicles in ipairs(getElementsByType("vehicle")) do
						if present == true then return true end
						if getVehicleName(vehicles) == "Shamal" then
							if getElementData(vehicles, "HavePersonalDimension") == true then
								if getElementData(vehicles, "PersonalDimension") == data then
									present = true
								end
							end
						end
					end
					local px, py, pz = getElementPosition(players)
					if getDistanceBetweenPoints3D(px, py, pz, 1.6480058431625, 25.451831817627, 1199.59375) < 10 and present == false then
						destroyElement(players)
					end
				end
				end
			end
		end
		for i,vehicles in ipairs(getElementsByType("vehicle")) do
			if getVehicleType(vehicles) ~= "Bike" then
				local vx, vy, vz = getElementPosition(vehicles)
				if getElementInterior(vehicles) == 1 and getDistanceBetweenPoints3D(vx, vy, vz, 1.6480058431625, 25.451831817627, 1199.59375) < 10 then
					destroyElement(vehicles)
				end
			end
		end
	end
, 50, 0)


setTimer(
	function()
		for i,vehicles in ipairs(getElementsByType("vehicle")) do
			if getVehicleName(vehicles) == "Shamal" then
				if getElementData(vehicles, "HavePersonalDimension") == false then
					local finalDimension = nil
					local success = false
					for i,dimensions in ipairs(getElementsByType("shamaldimension")) do
						if success == true then return true end
						if getElementData(dimensions, "occupied") == false then
							setElementData(dimensions, "occupied", true)
							finalDimension = getElementData(dimensions, "dimension")
							setElementData(vehicles, "HavePersonalDimension", true)
							setElementData(vehicles, "PersonalDimension", finalDimension)
							success = true
						end
					end
					if success == false then
						local dimensionsNumber = 0
						for i,dimensions in ipairs(getElementsByType("shamaldimension")) do
							dimensionsNumber = dimensionsNumber + 1
						end
						local element = createElement("shamaldimension")
						setElementData(element, "dimension", dimensionsNumber + 1)
						setElementData(element, "occupied", true)
						setElementData(vehicles, "HavePersonalDimension", true)
						setElementData(vehicles, "PersonalDimension", dimensionsNumber + 1)
						success = true
					end
				end
			end
		end
	end
, 50, 0)