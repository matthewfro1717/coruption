local flickervar = 0.5
local modchartpos1 = 0
local modchartpos2 = 0
local modchartvar1 = 0
local modchartvar2 = 0
local hpxvar = 900
local remove0to3 = true
local resethppos = true
local outroZoom = true
local windowX = 0
local GameX = 0
local HUDX = 0
local windowY = 0
local GameY = 0
local HUDY = 0
local endshakeX = 0
local defaultNoteY = 0
local zoom1 = true

function onCreate()
	setProperty("gf.alpha", 0)
	setProperty("boyfriend.scale.x", 0.6)
	setProperty("boyfriend.scale.y", 0.6)
	setProperty("dad.scale.x", 0.6)
	setProperty("dad.x", -100)
	setProperty("dad.scale.y", 0.6)
	setProperty('camHUD.alpha', 0)
	setProperty("iconP2.alpha", 0)
	setProperty("iconP1.alpha", 0)
	setProperty('health', 2)
	runTimer('settitle1',0.03)
	windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
	GameX = getProperty('camGame.x')
	HUDX = getProperty('camHUD.x')
	windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
	GameY = getProperty('camGame.y')
	HUDY = getProperty('camHUD.y')
end
function onSongStart()
end
function onUpdate()
		setProperty('timeBar.color', getColorFromHex('ffffff'))
		setProperty('timeBarBG.color', getColorFromHex('ffffff'))

	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
	setProperty('camHUD.angle', math.sin(currentBeat/4)*2)
	setProperty("dad.y", -180+(math.sin(currentBeat/4)*50))
	setProperty("healthBar.alpha", 0.5+flickervar)
	for i = 0, 3 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha',0.3)
	end
	if math.floor(currentBeat) == 64 and modchartpos1 == 0 then
		doTweenZoom('introZoom', 'camGame', 1.5, 10, 'sineInOut')
		doTweenAlpha('camShow', 'camHUD', 1, 5, 'linear')
		modchartpos1 = 1
		runTimer('shakeset',0.03)
	end
	if currentBeat >= 64 and currentBeat <= 128 then
		modchartvar2 = modchartvar2*0.93
		if math.fmod(math.floor(currentBeat+4),8) == 0 and modchartpos2 == math.floor(currentBeat/8)-8 then
			modchartvar1 = 300
			modchartvar2 = 0.7
			modchartpos2 = modchartpos2+1
		end
		if currentBeat >= 96 and remove0to3 then
			noteTweenX('move0',0,750,1.9,'expoOut')
			noteTweenX('move4',4,420,1.9,'expoOut')
            defaultNoteY = getPropertyFromGroup('strumLineNotes', 0, 'y')
			remove0to3 = false
		end
		setProperty('camHUD.x', HUDX+modchartvar1)
		setProperty('camGame.x', GameX+modchartvar1)
		setPropertyFromClass('openfl.Lib', 'application.window.x',windowX-modchartvar1)
		for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'scale.y',modchartvar2+0.7)
		end
	end
	if currentBeat >= 124 and currentBeat <= 128 then
		flickervar = -flickervar
		setProperty("healthBar.y", getProperty('healthBar.y')+((currentBeat-125)*12))
		setProperty("healthBar.angle", getProperty('healthBar.angle')+0.5)
		setProperty("healthBar.alpha", 0.5+flickervar)
	end
	if currentBeat >= 132 and resethppos then
		setProperty('camHUD.x', HUDX)
		setProperty('camGame.x', GameX)
		setPropertyFromClass('openfl.Lib', 'application.window.x',windowX)
		setProperty("healthBar.angle", -90)
		setProperty("healthBar.y", 350)
		setProperty("healthBar.x", hpxvar)
		modchartpos2 = 0
		resethppos = false
	end
	if currentBeat >= 132 and not resethppos then
		setProperty("healthBar.alpha", (currentBeat-132)/4)
		setProperty("iconP2.alpha", (currentBeat-132)/4)
		setProperty("iconP1.alpha", (currentBeat-132)/4)
	end
	if currentBeat >= 256 and currentBeat <= 384 then
		epicPartShake()
	end
	if currentBeat >= 512 and outroZoom then
		doTweenZoom('outroZoom1','camGame',1.6,1,'sineInOut')
		doTweenAlpha('outroAlpha1','camHUD',0,2,'linear')
		outroZoom = false
	end
end
function onUpdatePost()
	health = getProperty('health')
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)	
	setProperty("iconP2.x", hpxvar+220)
	setProperty("iconP2.y", -70+health*300)
	setProperty("iconP1.x", hpxvar+220)
	setProperty("iconP1.y", 30+health*300)
end
function onTweenCompleted(tag)
	if tag == 'move0' then
		noteTweenX('move1',1,640,1.9,'expoOut')
	end
	if tag == 'move1' then
		noteTweenX('move2',2,530,1.9,'expoOut')
	end
	if tag == 'move2' then
		noteTweenX('move3',3,420,1.9,'expoOut')
	end
	if tag == 'move4' then
		noteTweenX('move5',5,530,1.9,'expoOut')
	end
	if tag == 'move5' then
		noteTweenX('move6',6,640,1.9,'expoOut')
	end
	if tag == 'move6' then
		noteTweenX('move7',7,750,1.9,'expoOut')
	end
	if tag == 'outroZoom1' then
		doTweenZoom('outroZoom1','camGame',1.6,30,'linear')
	end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
    	setProperty('health', health-0.015);
    end
end
function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'shakeset' then
		modchartvar1 = modchartvar1*-0.8
		runTimer('shakeset',0.03)
	end
	if tag == 'settitle1' then
		setPropertyFromClass("openfl.Lib", "application.window.title",'#o#d#l#c#.')
		runTimer('settitle2',0.03)
	end
	if tag == 'settitle2' then
		setPropertyFromClass("openfl.Lib", "application.window.title",'G#o# #u#k#')
		runTimer('settitle1',0.03)
	end
end
function epicPartShake()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
	if math.fmod(math.floor(currentBeat),4) == 0 and modchartpos2 == 0 then
		modchartvar1 = 120
		modchartpos2 = 1
		setProperty('camHUD.zoom', 1.08)
		doTweenZoom('Zoom1', 'camHUD', 1, 0.5, 'expoOut')
	end
	if math.fmod(math.floor(currentBeat),4) == 2 and modchartpos2 == 1 then
		modchartvar1 = 120
		modchartpos2 = 0
		setProperty('camHUD.zoom', 1.08)
		doTweenZoom('Zoom1', 'camHUD', 1, 0.8, 'expoOut')
	end
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'y',defaultNoteY+math.sin(currentBeat+(i*1.575))*-modchartvar1)
	end
	for i = 4,7 do
		setPropertyFromGroup('strumLineNotes', i, 'y',defaultNoteY+math.sin(currentBeat+(i*1.575))*modchartvar1)
	end
end