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
    setProperty('judgementCounter.color', getColorFromHex('5D3FD3'))
	doTweenColor('epic1','timeTxt','000000',crochet*0.001-0.01,'linear')
    doTweenColor('epic2','healthBar','000000',crochet*0.001-0.01,'linear')
    doTweenColor('epic3','scoreTxt','000000',crochet*0.001-0.01,'linear')
    doTweenColor('epic4','judgementCounter','000000',crochet*0.001-0.01,'linear')
  --[[  if currentBeat >= 8 and getPropertyFromClass('ClientPrefs', 'downScroll') then
        setPropertyFromClass('ClientPrefs', 'downScroll', false)
        playeddownscroll = true
        doTweenAlpha('scrofade','scro',0,1,'linear')
    end]]
    if currentBeat > 0 and currentBeat < 30 then
        if currentBeat % 2 == 0 then
            setProperty('camHUD.zoom',1)
            setProperty('camGame.angle',anglevar)
            setProperty('camHUD.angle',anglevar)
            doTweenAngle('cambounce1','camGame',0,crochet*0.002,'linear')
            doTweenAngle('cambounce2','camHUD',0,crochet*0.002,'linear')
            doTweenZoom('cambounce3','camHUD',0.9,crochet*0.002-0.01,'linear')
        end
    end
end

function onCreate()
    setProperty('healthBar.color', getColorFromHex('000000'))
    setProperty('scoreTxt.color', getColorFromHex('5D3FD3'))
    setProperty('camHUD.zoom',0)
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
end


function onUpdatePost()
    setProperty('introSoundsSuffix', '-disregard')
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty("iconP2.alpha", 0)
    setProperty("iconP1.alpha", 0)
    setProperty("timeBar.alpha",0)
    shake = shake*0.6
    health = getProperty('health')
    triggerEvent('Screen Shake', '0.1, ' .. shake, '0.1, ' .. shake)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') then
        loadSong('Disheartened', 'Disheartened', true)
	end
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'scale.x',getProperty('scalecontrol' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'scale.y',getProperty('scalecontrol' .. i .. '.y'))
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

