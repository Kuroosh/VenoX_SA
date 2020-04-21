------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
------ Script by CreeD -------

function bomben()
	bombe = createProjectile(getLocalPlayer(), 21, 2144.1999511719, 1626.9000244141, 994.29998779297)
	setElementInterior(bombe, 1)
	setElementDimension(bombe, 1)
end
addEvent("onBombe", true)
addEventHandler("onBombe", getRootElement(), bomben)