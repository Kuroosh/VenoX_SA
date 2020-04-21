Resource: Custom Coronas v1.0.6
contact: knoblauch700@o2.pl

This resource lets You create some coronas. Not just your typical gtasa coronas 
that often times fail to appear. Since in this case corona Elements are created using
dxDrawMaterialLine3d MTA function. I have changed the behaviour of the material 
to act as cylindrical billboards do.

exported functions are explained in the mta wiki:
https://wiki.multitheftauto.com/wiki/Resource:Custom_coronas

createCorona(posX,posY,posZ,size,colorR,colorG,colorB,colorA, [isSoft = false])
	Creates a Corona.
destroyCorona(corona Element)
	Destroys the corona element.
setCoronaPosition(corona Element,posX,posY,posZ)
	Position of the corona in world space.
setCoronaColor(corona Element,colorR,colorG,colorB,colorA)
	RGBA diffuse color emitted by the corona. 
setCoronasEffectRange(int MaxEffectRange)
	Set the Max distance from the camera the shader effects are applied to.
