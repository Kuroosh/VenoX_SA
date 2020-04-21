local main = {}

function main.resourceStart()
    -- Initialize core system
    core = new(Core)
end

function main.resourceStop()
    -- Shut down all systems
    delete(Core:getSingleton())
end

addEventHandler("onClientResourceStart", resourceRoot, main.resourceStart, true, "high+999999")
addEventHandler("onClientResourceStop", resourceRoot, main.resourceStop, true, "high+999999")