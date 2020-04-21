feuerwehrColors = { [1]=1, [2]=1, [3]=1, [4]=1 }
feuerwehr = {}
feuerwehr[1] = createFactionVehicle (407, -2007.599609375, 1353.599609375, 7.4000000953674, 0, 0, 180, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[2] = createFactionVehicle (407, -1999.7001953125, 1353.599609375, 7.4000000953674, 0, 0, 180, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[3] = createFactionVehicle (407, -1992.2001953125, 1353.599609375, 7.4000000953674, 0, 0, 180, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[4] = createFactionVehicle (552, -1973, 1346.599609375, 6.8000001907349, 0, 0, 180, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[5] = createFactionVehicle (489, -1969, 1363.6999511719, 7.3000001907349, 0, 0, 180, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[6] = createFactionVehicle (544, -1996.900390625, 1379.599609375, 7.4000000953674, 0, 0, 0, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[7] = createFactionVehicle (544, -2003, 1379.7998046875, 7.4000000953674, 0, 0, 0, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )
feuerwehr[8] = createFactionVehicle (544, -2008.7001953125, 1379.7998046875, 7.4000000953674, 0, 0, 0, 15, feuerwehrColors[1], feuerwehrColors[2], feuerwehrColors[3], feuerwehrColors[4] )

for i=1, #feuerwehr do		
	vehicle = feuerwehr[i]
	setVehicleColor( vehicle, 140, 0, 0, 255, 255, 255 )
end

