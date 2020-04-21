function bikerKnockingOff ( bool )

	setPedCanBeKnockedOffBike ( lp, bool )

end
addEvent( "onBikerBoolGiven", true )
addEventHandler( "onBikerBoolGiven", getRootElement(), bikerKnockingOff )