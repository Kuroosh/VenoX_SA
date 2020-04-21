--[[function bankautomaten_creation ()

	SFBanhofGeldautomat = createObject ( 2942, -1980.5427246094, 145.16845703125, 27.32200050354, 0, 0, 270 )
	SFSpawnGeldautomat = createObject ( 2942, -2765.4018554688, 372.29138183594, 5.9826860427856, 0, 0, 90 )
	SFRathausGeldautomat = createObject ( 2942, -2456.9841308594, 783.24542236328, 34.81477355957, 0, 0, 270 )
end
addEventHandler ("onResourceStart", getResourceRootElement(getThisResource()), bankautomaten_creation )]]