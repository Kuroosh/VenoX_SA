shootingRangeGuns = {}
shootingRangeGunIDs = {}
 shootingRangeGuns["name"] = {}
 shootingRangeGuns["id"] = {}
 i = 0
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "9mm", 22
 i = i + 1
 --shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "9mm SD", 23
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Desert Eagle", 24
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Shotgun", 25
 i = i + 1
 --shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Lupara", 26
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "MP5", 29
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Ak-47", 30
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "M4", 31
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Gewehr", 33
 i = i + 1
 --shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Scharfschuetzengewehr", 34

for i, index in pairs ( shootingRangeGuns["name"] ) do
	shootingRangeGunIDs[index] = shootingRangeGuns["id"][i]
end