local customIfp = nil 

function setPedFortniteAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
if isElement(ped) then
if animation == "baile 1" or animation == "baile 2" or animation == "baile 3" or animation == "baile 4" or animation == "baile 5" or animation == "baile 6" or animation == "baile 7" or animation == "baile 8" or animation == "baile 9" or animation == "baile 10" or animation == "baile 11" or animation == "baile 12" or animation == "baile 13" then
for i = 1,3 do
setPedAnimation(ped, "Fortnite_"..i.."", animation, tiempo, true, false, false) 
if tiempo > 1 then
setTimer(setPedAnimation,tiempo,1,ped,false)
setTimer(setPedAnimation,tiempo+100,1,ped,false)
end
end
end
end
end
addEvent("setPedFortniteAnimation",true)
addEventHandler("setPedFortniteAnimation",getRootElement(),setPedFortniteAnimation)

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )
    customIfp = engineLoadIFP ("anzeigen/click/Fortnitept1.ifp", "Fortnite_1")
    customIfp2 = engineLoadIFP ("anzeigen/click/Fortnitept2.ifp", "Fortnite_2")
    customIfp3 = engineLoadIFP ("anzeigen/click/Fortnitept3.ifp", "Fortnite_3")
    if customIfp and customIfp2 and customIfp3 then 
    
    --outputDebugString ("Animaciones de Fortnite cargadas")
    
    else
    --outputDebugString ("Las animaciones de Fortnite no fueron cargadas")
    end
    end
)