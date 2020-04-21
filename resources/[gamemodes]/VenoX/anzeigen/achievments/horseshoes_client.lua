function hideHorseshoeArray_func ( horseShoeArray )
	for i=1, #horseShoeArray do
		setElementDimension ( horseShoeArray[i], 2 )
	end
end
addEvent ( "hideHorseshoeArray", true )
addEventHandler ( "hideHorseshoeArray", getRootElement(), hideHorseshoeArray_func )


function hideHorseshoe_func ( horseShoe )
	setElementDimension ( horseShoe, 2 )
end
addEvent ( "hideHorseshoe", true )
addEventHandler ( "hideHorseshoe", getRootElement(), hideHorseshoe_func )