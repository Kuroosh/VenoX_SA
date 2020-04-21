local screenx, screeny = guiGetScreenSize(getLocalPlayer())


function vipwindowfunc()
	if getElementData(getLocalPlayer(),"adminlvl") >= 1 then
		local x, y = screenx/2-500/2,screeny/2-400/2
		local e, f = screenx/2-470/2,screeny/2-80/2
		local g, h = screenx/2+120/2,screeny/2-80/2
		local z, u = screenx/2+120/2,screeny/2+100/2
		local c, v = screenx/2-470/2,screeny/2+100/2
		showCursor(true)
		vnxDrawWindow("vipwindow","window","VenoX Reallife Premium Panel",x,y,500,400,"closewindow")
		vnxDrawButton("fix","button","Reparieren",z,u,170,80,"fix_func")
		vnxDrawButton("radio","button","Ghettoblaster",c,v,170,80,"radio_func")
		vnxDrawButton("tanken","button","Tanken",e,f,170,80,"tank_func")
		vnxDrawButton("heal","button","Heilen",g,h,170,80,"heal_func")
		setElementClicked ( true )
	end
end
--addCommandHandler("vip",vipwindowfunc)

function closewindow ()
	vnxDestroyWindow("vipwindow")
	vnxDestroyWindow("tanken")
	vnxDestroyWindow("heal")
	vnxDestroyWindow("radio")
	vnxDestroyWindow("fix")
	showCursor(false)
	setElementClicked ( false )
end

function tank_func(button)
	triggerServerEvent ( "fillComplete1", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("vipwindow")
	vnxDestroyWindow("tanken")
	vnxDestroyWindow("heal")
	vnxDestroyWindow("radio")
	vnxDestroyWindow("fix")
	showCursor(false)
	setElementClicked ( false )
end

function heal_func(button)
	triggerServerEvent ( "lebenessen", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("vipwindow")
	vnxDestroyWindow("tanken")
	vnxDestroyWindow("heal")
	vnxDestroyWindow("radio")
	vnxDestroyWindow("fix")
	showCursor(false)
	setElementClicked ( false )
end
function radio_func(button)
	triggerEvent ( "onPlayerViewSpeakerManagment", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("vipwindow")
	vnxDestroyWindow("tanken")
	vnxDestroyWindow("heal")
	vnxDestroyWindow("radio")
	vnxDestroyWindow("fix")
end
function fix_func(button)
	triggerServerEvent ( "fixveh1", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("vipwindow")
	vnxDestroyWindow("tanken")
	vnxDestroyWindow("heal")
	vnxDestroyWindow("radio")
	vnxDestroyWindow("fix")
	showCursor(false)
	setElementClicked ( false )
end

