local drivingSchoolCorrectQuestions, drivingSchoolCurQuestion

local drivingLicenses = {}
 drivingLicenses["question"] = {
  [1]="Was darfst du am Steuer NICHT?",
  [2]="Was ist eine Grundregel des Straßenverkehrs?",
  [3]="Wo darfst du NICHT parken?",
  [4]="Was tust du, wenn du einen Verkehrsunfall bauen solltest?",
  [5]="Weshalb ist das telefonieren während der Fahrt verboten?",
  [6]="Was tust du an einem Stopschild?",
  [7]="Was gilt in einer Einbahnstraße?"
 }
 drivingLicenses["answereA"] = {
  [1]="Radiosender ändern",
  [2]="Rechts vor Links",
  [3]="Auf Parkplätzen",
  [4]="Anhalten und die Sache\nklären",
  [5]="Weil es Spass macht",
  [6]="Kurz anhalten",
  [7]="Nichts besonderes"
 }
 drivingLicenses["answereB"] = {
  [1]="SMS schreiben und DriveBy\nDabei machen",
  [2]="Kokain nehmen und Freunde\nanrufen gleichzeitig",
  [3]="Auf einer Einfahrt",
  [4]="Wegfahren",
  [5]="Es kann die Elektronik\nstören",
  [6]="Durchfahren",
  [7]="Wenden verboten"
 }
 drivingLicenses["answereC"] = {
  [1]="Umsehen",
  [2]="Wer zuerst kommt ...",
  [3]="Auf Donald Trump's Parkplatz",
  [4]="Weglaufen",
  [5]="Grundlos",
  [6]="Parken",
  [7]="Parken verboten"
 }
 drivingLicenses["answereD"] = {
  [1]="Rauchen",
  [2]="Keines von den oberen",
  [3]="Auf Privatgrundstücken",
  [4]="Nichts",
  [5]="Weil man abgelenkt\nist",
  [6]="Umdrehen",
  [7]="Anhalten"
 }
 drivingLicenses["correct"] = {
  [1]=2,
  [2]=1,
  [3]=3,
  [4]=1,
  [5]=4,
  [6]=1,
  [7]=2
 }

function startDrivingLicenseTheory_func ()

	showCursor ( true )
	setElementClicked ( true )
	drivingSchoolCorrectQuestions = 0
	drivingSchoolCurQuestion = 1
	showDrivingLicenseQuestion ( 1 )
end
addEvent ( "startDrivingLicenseTheory", true )
addEventHandler ( "startDrivingLicenseTheory", getRootElement(), startDrivingLicenseTheory_func )

function showDrivingLicenseQuestion ( questionNR )

	drivingSchoolCurQuestion = questionNR
	gWindow["drivingLicenseTheory"] = guiCreateWindow(screenwidth/2-372/2,screenheight/2-238/2,372,238,"Fuehrerscheinpruefung",false)
	guiSetAlpha(gWindow["drivingLicenseTheory"],1)
	gLabel["drivingLicenseTheoryQuestion"] = guiCreateLabel(14,48,347,83,drivingLicenses["question"][questionNR],false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gLabel["drivingLicenseTheoryQuestion"],1)
	guiLabelSetColor(gLabel["drivingLicenseTheoryQuestion"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["drivingLicenseTheoryQuestion"],"top")
	guiLabelSetHorizontalAlign(gLabel["drivingLicenseTheoryQuestion"],"left",true)
	guiSetFont(gLabel["drivingLicenseTheoryQuestion"],"default-bold-small")
	gLabel["drivingLicenseTheoryQuestionNR"] = guiCreateLabel(0,21,370,19,"Frage "..questionNR.." / 7",false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gLabel["drivingLicenseTheoryQuestionNR"],1)
	guiLabelSetColor(gLabel["drivingLicenseTheoryQuestionNR"],200,200,0)
	guiLabelSetVerticalAlign(gLabel["drivingLicenseTheoryQuestionNR"],"center")
	guiLabelSetHorizontalAlign(gLabel["drivingLicenseTheoryQuestionNR"],"center",false)
	guiSetFont(gLabel["drivingLicenseTheoryQuestionNR"],"default-bold-small")
	
	gButton["drivingLicenseTheorySend"] = guiCreateButton(372/2-80/2,190,80,38,"Absenden",false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gButton["drivingLicenseTheorySend"],1)
	guiSetFont(gButton["drivingLicenseTheorySend"],"default-bold-small")
	
	gRadio["drivingShoolAnswereA"] = guiCreateRadioButton(18,138-10,200,35,drivingLicenses["answereA"][questionNR],false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gRadio["drivingShoolAnswereA"],1)
	guiSetFont(gRadio["drivingShoolAnswereA"],"default-bold-small")
	gRadio["drivingShoolAnswereB"] = guiCreateRadioButton(191,138-10,200,35,drivingLicenses["answereB"][questionNR],false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gRadio["drivingShoolAnswereB"],1)
	guiSetFont(gRadio["drivingShoolAnswereB"],"default-bold-small")
	gRadio["drivingShoolAnswereC"] = guiCreateRadioButton(18,163-10,200,35,drivingLicenses["answereC"][questionNR],false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gRadio["drivingShoolAnswereC"],1)
	guiSetFont(gRadio["drivingShoolAnswereC"],"default-bold-small")
	gRadio["drivingShoolAnswereD"] = guiCreateRadioButton(191,163-10,200,35,drivingLicenses["answereD"][questionNR],false,gWindow["drivingLicenseTheory"])
	guiSetAlpha(gRadio["drivingShoolAnswereD"],1)
	guiSetFont(gRadio["drivingShoolAnswereD"],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["drivingLicenseTheorySend"],
		function ()
			local selected
			if guiRadioButtonGetSelected ( gRadio["drivingShoolAnswereA"] ) then
				selected = 1
			elseif guiRadioButtonGetSelected ( gRadio["drivingShoolAnswereB"] ) then
				selected = 2
			elseif guiRadioButtonGetSelected ( gRadio["drivingShoolAnswereC"] ) then
				selected = 3
			elseif guiRadioButtonGetSelected ( gRadio["drivingShoolAnswereD"] ) then
				selected = 4
			else
				selected = 5
			end
			destroyElement ( gWindow["drivingLicenseTheory"] )
			if drivingLicenses["correct"][drivingSchoolCurQuestion] == selected then
				drivingSchoolCorrectQuestions = drivingSchoolCorrectQuestions + 1
			end
			if drivingSchoolCurQuestion < 7 then
				showDrivingLicenseQuestion ( drivingSchoolCurQuestion + 1 )
			else
				triggerServerEvent ( "drivingSchoolTheoryComplete", lp, drivingSchoolCorrectQuestions )
			end
		end,
	false )
end

function drivingSchoolFinished_func ()
	showCursor ( false )
	setElementClicked ( false )
	
end
addEvent ( "drivingSchoolFinished", true )
addEventHandler ( "drivingSchoolFinished", getRootElement(), drivingSchoolFinished_func )


local function checkDrivingSpeed ( )
	local veh = getPedOccupiedVehicle ( lp )
	if veh and vnxClientGetElementData ( "drivingSchoolPractise" ) then
		local vx, vy, vz = getElementVelocity ( veh )
		local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 )		
		if speed > 130 * 0.00464 then
			triggerServerEvent ( "drivingSchoolToFast", lp )
			removeEventHandler ( "onClientRender", root, checkDrivingSpeed )
			outputDebugString ( "c1" )
		end
	else
		removeEventHandler ( "onClientRender", root, checkDrivingSpeed )
	end
end


function checkDrivingSchoolSpeed_func ()
	addEventHandler ( "onClientRender", root, checkDrivingSpeed )
end
addEvent ( "checkDrivingSchoolSpeed", true )
addEventHandler ( "checkDrivingSchoolSpeed", getRootElement(), checkDrivingSchoolSpeed_func )


