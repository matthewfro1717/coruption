local angleshit = 1.5;
local anglevar2 = 1.5;
local anglevar = 6
local funnyvar = 0
local shake = 0


function onBeatHit()
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
	setProperty('timeTxt.color', getColorFromHex('5D3FD3'))
    setProperty('healthBar.color', getColorFromHex('5D3FD3'))
    setProperty('scoreTxt.color', getColorFromHex('5D3FD3'))
	doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
    doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
    doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
    if currentBeat >= 8 and getPropertyFromClass('ClientPrefs', 'downScroll') then
        setPropertyFromClass('ClientPrefs', 'downScroll', false)
        playeddownscroll = true
        doTweenAlpha('scrofade','scro',0,1,'linear')
    end
    if currentBeat > 0 and currentBeat < 30 then
        if currentBeat % 2 == 0 then
            setProperty('camHUD.zoom',1)
            setProperty('camGame.angle',anglevar)
            setProperty('camHUD.angle',anglevar)
            doTweenAngle('cambounce1','camGame',0,crochet*0.002,'linear')
            doTweenAngle('cambounce2','camHUD',0,crochet*0.002,'linear')
            doTweenZoom('cambounce3','camHUD',0.9,crochet*0.002-0.01,'linear')
            for i = 0,7 do
                setPropertyFromGroup('strumLineNotes',i,'angle',0)
                noteTweenAngle('1-1-' .. i,i,anglevar*90,crochet*0.002-0.01,'expoIn')
                noteTweenY('1-2-' .. i,i,10+(math.fmod(i+currentBeat/2,2)-0.5)*100,crochet*0.002-0.01,'expoIn')
                setProperty('scalecontrol' .. i .. '.y',0.5)
                setProperty('scalecontrol' .. i .. '.x',1.6)
                doTweenX('1-3-' .. i,'scalecontrol' .. i,0.7,crochet*0.001,'sineOut')
                doTweenY('1-4-' .. i,'scalecontrol' .. i,0.7,crochet*0.001,'sineOut')
            end
            anglevar = -anglevar
        end
    end
    if currentBeat == 30 then
        for i = 0,3 do
            noteTweenY('2-1-' .. i,i,800,0.4+i*0.05,'expoIn')
        end
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
            noteTweenX('2-2-' .. i,i,-20+i*110,crochet*0.002,'expoIn')
            noteTweenY('2-1-' .. i,i,60,0.4+i*0.05,'expoOut')
        end
    end
    if currentBeat == 32 then
        anglevar = 4
    end
    if currentBeat >= 32 and currentBeat < 152 then
        setProperty('camHUD.zoom',0.95)
        doTweenZoom('cambounce3','camHUD',0.9,crochet*0.001,'linear')
        for i = 4,7 do
            setProperty('scalecontrol' .. i .. '.y',0.7+(math.fmod(i+currentBeat,2)-0.5)*0.6)
            setProperty('scalecontrol' .. i .. '.x',0.7+(math.fmod(i+1+currentBeat,2)-0.5)*0.6)
            doTweenX('1-3-' .. i,'scalecontrol' .. i,0.7,crochet*0.001-0.01,'sineOut')
            doTweenY('1-4-' .. i,'scalecontrol' .. i,0.7,crochet*0.001-0.01,'sineOut')
        end
    end
    if currentBeat == 64 then
        for i = 4,7 do
            noteTweenX('2-1-' .. i,i,1200+i*-110,crochet*0.004,'sineInOut')
        end
        doTweenAngle('cambounce2','camHUD',180,crochet*0.004,'sineInOut')
    end
    if currentBeat == 96 then
        for i = 4,7 do
            noteTweenX('2-1-' .. i,i,-20+i*110,crochet*0.004,'sineInOut')
        end
        doTweenAngle('cambounce2','camHUD',360,crochet*0.004,'sineInOut')
    end
    if currentBeat == 128 then
        for i = 4,7 do
            noteTweenX('2-1-' .. i,i,1200+i*-110,crochet*0.004,'sineInOut')
        end
        doTweenAngle('cambounce2','camHUD',180,crochet*0.004,'sineInOut')
    end
    if currentBeat == 152 then
        doTweenZoom('drop0','camGame',1.4,crochet*0.008-0.01,'sineInOut')
        doTweenAngle('cambounce2','camHUD',0,crochet*0.003,'sineInOut')
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes',i,'x',420+i*110)
            setPropertyFromGroup('strumLineNotes',i,'alpha',0.3)
            noteTweenY('2-2-' .. i,i,60,crochet*0.007,'expoOut')
            if i < 2 then
            noteTweenX('2-1-' .. i,i,200+i*110,crochet*0.003,'sineInOut')
            else
            noteTweenX('2-1-' .. i,i,640+i*110,crochet*0.003,'sineInOut')
            end
        end
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
            setProperty('scalecontrol' .. i .. '.y',0.5)
            setProperty('scalecontrol' .. i .. '.x',1)
            doTweenX('1-3-' .. i,'scalecontrol' .. i,0.7,crochet*0.004-0.01,'sineOut')
            doTweenY('1-4-' .. i,'scalecontrol' .. i,0.7,crochet*0.004-0.01,'sineOut')
            noteTweenX('2-1-' .. i,i,-20+i*110,crochet*0.003,'sineInOut')
            noteTweenY('1-5-' .. i,i,60,crochet*0.002,'expoOut')
        end
        doTweenX('main','camHUD',(math.fmod(currentBeat,2)-0.5)*40,crochet*0.001-0.01,'expoOut')
        anglevar = -anglevar
    end

    if curBeat > 703 and curBeat < 767 then
        if curBeat % 2 == 0 then
            angleshit = anglevar2;
        else
            angleshit = -anglevar2;
        end
        triggerEvent('Change Scroll Speed', '0.7', '0.001');
        triggerEvent('Change Scroll Speed', '1', '0.1');
        triggerEvent('Add Camera Zoom', '0.07', '0.025');
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
end

function onCreate()
    setProperty('healthBar.color', getColorFromHex('000000'))
    setProperty('scoreTxt.color', getColorFromHex('5D3FD3'))
    setProperty('camHUD.zoom',0)
    if getPropertyFromClass('ClientPrefs', 'downScroll') then
        makeLuaText('scro', "This is where it ends Boyfriend! - Exosphere.", 600, 350, 300)
        setTextSize('scro', 90)
        setTextColor('scro', 'FFFFFF')
        addLuaText('scro',true)
    end
    for i = 0,7 do
        makeLuaSprite('scalecontrol' .. i,'',0.7,0.7)
        setProperty('scalecontrol' .. i .. '.alpha',0)
        addLuaSprite('scalecontrol' .. i,false)
    end
end


function onSongStart()
    setProperty('camHUD.zoom',1)
    setProperty('camGame.angle',anglevar)
    setProperty('camHUD.angle',anglevar)
    doTweenAngle('cambounce1','camGame',anglevar*0.4,crochet*0.002,'linear')
    doTweenAngle('cambounce2','camHUD',anglevar*0.4,crochet*0.002,'linear')
    doTweenZoom('cambounce3','camHUD',0.9,crochet*0.002-0.01,'linear')
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'angle',0)
        noteTweenAngle('1-1-' .. i,i,anglevar*90,crochet*0.002-0.01,'expoIn')
        setProperty('scalecontrol' .. i .. '.y',0.5)
        setProperty('scalecontrol' .. i .. '.x',1.6)
        doTweenX('1-3-' .. i,'scalecontrol' .. i,0.7,crochet*0.001,'sineOut')
        doTweenY('1-4-' .. i,'scalecontrol' .. i,0.7,crochet*0.001,'sineOut')
    end
    anglevar = -anglevar
end


function onUpdatePost()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty("iconP2.alpha", 0)
    setProperty("iconP1.alpha", 0)
    setProperty("timeBar.alpha",0)
    shake = shake*0.6
    health = getProperty('health')
    triggerEvent('Screen Shake', '0.1, ' .. shake, '0.1, ' .. shake)
    if playeddownscroll then
        playeddownscroll = false
        makeLuaText('fix', "No downscroll for you!", 600, 330, 300)
        setTextSize('fix', 140)
        setTextColor('fix', '5D3FD3')
        addLuaText('fix',true)
		loadSong('Disregard', 'Disregard', true);
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') then
        loadSong('Disheartened', 'Disheartened', true)
	end
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'scale.x',getProperty('scalecontrol' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'scale.y',getProperty('scalecontrol' .. i .. '.y'))
    end
    if currentBeat >= 32 and currentBeat < 152 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'y',60+math.sin((currentBeat+i/2)*math.pi/2)*40)
        end
    end
    notesLength = getProperty('notes.length')
    for i1 = 0, notesLength, 1 do
        Thisnote = getPropertyFromGroup('notes',i1,'noteData')
        setPropertyFromGroup('notes',i1,'scale.x',getProperty('scalecontrol' .. Thisnote .. '.x'))
        setPropertyFromGroup('notes',i1,'scale.y',getProperty('scalecontrol' .. Thisnote .. '.y'))
        if getPropertyFromGroup('notes',i1,'mustPress') then
            setPropertyFromGroup('notes',i1,'scale.x',getProperty('scalecontrol' .. Thisnote+4 .. '.x'))
            setPropertyFromGroup('notes',i1,'scale.y',getProperty('scalecontrol' .. Thisnote+4 .. '.y'))
        end
    end
end

function opponentNoteHit()
    shake = 0.01
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.015)
        end
        characterPlayAnim('boyfriend', 'scared', true)
    end
end


function goodNoteHit()
    hp = getProperty('health')
    setProperty('health',hp+0.015)
end


function noteMiss()
    hp = getProperty('health')
    setProperty('health',hp-0.1)
end

