local angleshit = 1;
local anglevar = 1;
local noteDefaultXs = {}
local noteDefaultYs = {}
local noteXs = {}
local noteYs = {}
local screenshake = 0
local noteR1 = {}
local noteR2 = {}
local noteR3 = 0
local epicflash = true
local attemptedPause = false



function onBeatHit()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', 0, crochet*0.001, 'expoOut')
        doTweenAngle('tt', 'camGame', 0, crochet*0.001, 'expoOut')
        doTweenColor('setcolor1', 'hpnew1', '888888', 0.001, 'linear')
    end
    if currentBeat > 160 and currentBeat < 288 then
        generatePos()
        setProperty('camHUD.zoom',1.1)
        setProperty('camGame.zoom',1.1)
        doTweenZoom('epiczoom1', 'camHUD', 1, crochet*0.001, 'expoOut')
        doTweenZoom('epiczoom2', 'camGame', 1, crochet*0.001, 'expoOut')
	end
end
function onCreate()
    setProperty('health', 2)
	setProperty("healthBar.alpha", 0)
    makeLuaSprite('hpnew1', '', 1105, 350)
    makeLuaSprite('hpnew2', '', 1105, 55)
    makeLuaSprite('hpnew3', '', 1100, 50)
	setScrollFactor('hpnew1', 0, 0)
	setScrollFactor('hpnew2', 0, 0)
	setScrollFactor('hpnew3', 0, 0)
    setObjectCamera('hpnew1', 'HUD')
    setObjectCamera('hpnew2', 'HUD')
    setObjectCamera('hpnew3', 'HUD')
	makeGraphic('hpnew1', 40, 295, 'FFFFFF')
	makeGraphic('hpnew2', 40, 295, '00FFFF')
	makeGraphic('hpnew3', 50, 600, '000000')
	addLuaSprite('hpnew3',true)
	addLuaSprite('hpnew1',true)
	addLuaSprite('hpnew2',true)
    setObjectOrder('hpnew1', 2)
    setObjectOrder('hpnew2', 2)
    setObjectOrder('hpnew3', 1)
	makeLuaSprite('flash1', '', -274, -154)
	makeGraphic('flash1', 2000, 2000, 'FFFFFF')
	setScrollFactor('flash1', 0, 0)
    setObjectCamera('flash1', 'HUD')
    doTweenColor('setcolor1', 'hpnew1', 'FFFFFF', 0.001, 'linear')
	for i = 0,3 do
	  noteDefaultXs[i] = -25+(i+4)*110
      if downscroll then
        noteDefaultYs[i] = 550
      else
        noteDefaultYs[i] = 60
      end
	  noteXs[i] = 0
	  noteYs[i] = 0
	end
	for i = 4,7 do
	  noteDefaultXs[i] = -25+i*110
      if downscroll then
        noteDefaultYs[i] = 550
      else
        noteDefaultYs[i] = 60
      end
	  noteXs[i] = 0
	  noteYs[i] = 0
	end
    makeLuaText('dis', "Hyperness by Hafp", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    makeLuaText('pausestopper', "You can't stop the hype train!", 600, 350, 300)
    setTextSize('pausestopper', 50)
    setTextColor('pausestopper', 'FF9999')
    
end
function onUpdate()
        setProperty('timeBar.color', getColorFromHex('505050'))
        setProperty('timeBarBG.color', getColorFromHex('505050'))

    health = getProperty('health')
    if attemptedPause then
        setProperty('health', health*0.98);
    end
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    screenshake = screenshake*0.9
    setProperty('camHUD.x',math.cos(currentBeat*math.pi)*-10)
    setProperty('camHUD.y',math.abs(math.sin(currentBeat*math.pi))*-20)
    setProperty('camGame.y',math.abs(math.sin(currentBeat*math.pi))*-10)
    triggerEvent('Screen Shake', '0.1, ' .. screenshake, '0.1, ' .. screenshake)
    setPropertyFromClass('PlayState', 'SONG.speed', 2.9)
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes',i,'alpha',0.2)
    end
    for i = 0, 7 do
        noteXs[i] = math.cos((currentBeat+1.7)*math.pi)*80
    end
    if currentBeat > 160 and currentBeat < 288 then
		if epicflash then
            addLuaSprite('flash1',true)
			setProperty('flash1.alpha', 1)
			doTweenAlpha('fade3','flash1',0,1,'linear')
			epicflash = false
		end
	    for i = 0, 7 do
            noteYs[i] = math.sin((currentBeat*0.5+(i/2))*math.pi)*30
	    end
    end
	for i = 0,7 do
	  setPropertyFromGroup('strumLineNotes',i,'x',noteDefaultXs[i]+noteXs[i])
	  setPropertyFromGroup('strumLineNotes',i,'y',noteDefaultYs[i]+noteYs[i])
	end
    if currentBeat > 288 then
        if not epicflash then
			setProperty('flash1.alpha', 0.3)
			doTweenAlpha('fade3','flash1',0,1,'linear')
			epicflash = true
        end
        for i = 0,7 do
            noteYs[i] = math.sin(currentBeat*0.25*math.pi)*20
        end
    end
end
function onUpdatePost()
    health = getProperty('health')
    setProperty('iconP1.x',1100)
    setProperty('iconP2.x',1100)
    setProperty('iconP1.y',55+health*295-110)
    setProperty('iconP2.y',55+health*295-10)
    setProperty('iconP1.angle',-90)
    setProperty('iconP2.angle',-90)
    setProperty('hpnew2.scale.y',health)
    setProperty('hpnew1.scale.y',(1-health/2)*2)
    setProperty('hpnew2.y',-92-(health*-147.5))
    setProperty('hpnew1.y',203-(health*-147.5))
	notesLength = getProperty('notes.length')
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
	for i1 = 0, notesLength, 1 do
		Thisnotex = getPropertyFromGroup('notes',i1,'x')
		Thisnotey = getPropertyFromGroup('notes',i1,'y')
		Thisnote = getPropertyFromGroup('notes',i1,'noteData')
		Thisnoteoriginx = noteDefaultXs[Thisnote]
		Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
        if downscroll then
            setPropertyFromGroup('notes',i1,'x',10+Thisnoteoriginx+math.cos((Thisnotey*0.001+currentBeat)*math.pi)*-80)
        else
            setPropertyFromGroup('notes',i1,'x',10+Thisnoteoriginx+math.sin((Thisnotey*0.001+currentBeat)*math.pi)*80)

        end
        setPropertyFromGroup('notes',i1,'y',Thisnotey+math.sin((currentBeat*2)*math.pi)*50)
	end
end
function opponentNoteHit(ipiss, piss2, piss3, sus)
    triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');
    screenshake = screenshake+0.001
    health = getProperty('health')
    if getProperty('health') > 0.5 then
        setProperty('health', health*0.95);
    end
end
function goodNoteHit(ipiss, piss2, piss3, sus)
    health = getProperty('health')
    setProperty('health', health+0.03);
end
function generatePos()
end
function onTweenCompleted(tag)
    if tag == 'setcolor1' then
        doTweenColor('epiccolor1', 'hpnew1', '333333', crochet*0.001-0.05, 'linear')
        
    end
    
end
function onPause()
    addLuaText('pausestopper')
    attemptedPause = true
	return Function_Stop;
end