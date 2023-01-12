local angleshit = 1.5;
local anglevar2 = 1.5;
local anglevar = 6
local funnyvar = 0
local shake = 0

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'Overlord');
	end
end

function onCreatePost()
    addChromaticAbberationEffect("game");
    addChromaticAbberationEffect("hud");
    makeLuaText('kadeEngineWatermark','No more games kid, I am tired of having you here if I can not corrupt you.', 0, 4, getProperty('healthBarBG.y') + 55)
    setTextSize('kadeEngineWatermark', 16)
    setTextBorder('kadeEngineWatermark', 1, '000000')
    addLuaText('kadeEngineWatermark')
    setObjectCamera('kadeEngineWatermark', 'hud')
    setTextFont('kadeEngineWatermark', 'gillsans.ttf')

    if downscroll then
        setProperty('kadeEngineWatermark.y', screenHeight * 0.9 + 49)
    end

    -- Hides the watermark to replace the new one
    setProperty("watermarkTxt.alpha", 0)
end

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
    triggerEvent('Add Camera Zoom', '0.01', '0.02');
    triggerEvent('Screen Shake', '0.03, 0.01', '0.03, 0.005');
    doChromaticPulse("game", 0.01, 0.1, "sineIn")
    doChromaticPulse("hud", 0.01, 0.1, "sineIn")
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
    setProperty('health',hp+0.018)
end


function noteMiss()
    hp = getProperty('health')
    setProperty('health',hp-0.15)
end

