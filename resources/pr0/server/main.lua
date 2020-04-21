local main = {}

function main.resourceStart()
    -- Initialize core system
    new(Core)
end

function main.resourceStop()
    -- Shut down all systems properly
end

addEventHandler("onResourceStart", resourceRoot, main.resourceStart)
addEventHandler("onResourceStop", resourceRoot, main.resourceStop)