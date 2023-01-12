local angleshit = 0;
local anglevar = 0;
local theepic = true;
local hpxvar = -200

function onUpdatePost()
	setProperty('introSoundsSuffix', '-az')
    setProperty('ratingsData[0].image', 'anomoly-sick')
    setProperty('ratingsData[1].image', 'anomoly-good')
    setProperty('ratingsData[2].image', 'anomoly-bad')
    setProperty('ratingsData[3].image', 'anomoly-shit')
	setProperty("comboSuffix", "-anomoly") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
    setProperty('healthBar.flipX',true)
    setProperty('iconP1.flipX',true)
    setProperty('iconP1.x',220+getProperty('health')*300)
    setProperty('iconP2.flipX',true)
    setProperty('iconP2.x',320+getProperty('health')*300)

    health = getProperty('health')
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)	
    setProperty("healthBar.angle", 90)
    setProperty("healthBar.y", 350)
    setProperty("healthBar.x", hpxvar)
    setProperty("iconP2.x", hpxvar+220)
	setProperty("iconP2.y", 70+health*300)
	setProperty("iconP1.x", hpxvar+220)
	setProperty("iconP1.y", -30+health*300)
    
end

function onCountdownTick(tick)
    if tick == 1 then
        loadGraphic('countdownReady', 'anomoly-ready')
       		elseif tick == 2 then
        loadGraphic('countdownSet', 'anomoly-set')
        	elseif tick == 3 then
        loadGraphic('countdownGo', 'anomoly-go')
    end
end

function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -900);
	end
end

function onBeatHit()
    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')

        triggerEvent('Add Camera Zoom', '0.03', '0.05');
        setProperty('dad.y',getProperty('dad.y')+20)
        doTweenY('bounce1','dad',getProperty('dad.y')-20,crochet*0.001,'sineOut')
        setProperty('gf.y',getProperty('gf.y')+20)
        doTweenY('bounce2','gf',getProperty('gf.y')-20,crochet*0.001,'sineOut')
    end
end

function onCreatePost()
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110)
        end
    setProperty("boyfriend.alpha", 0.009)
end

function onUpdate()
    makeLuaSprite('blackbar', 'blackbar', -400, -650)
    setLuaSpriteScrollFactor('blackbar', 0.9, 0.9); 
    addLuaSprite('blackbar', true);
    scaleObject('blackbar', 1, 1);

    makeLuaSprite('blackbar2', 'blackbar', -400, 150)
    setLuaSpriteScrollFactor('blackbar2', 0.9, 0.9); 
    addLuaSprite('blackbar2', true);
    scaleObject('blackbar2', 1, 1);
    
    setProperty('timeBar.color', getColorFromHex('FFFFFF'))
    setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
  noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
  noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
  if curBeat > 4 then
    if curBeat % 2 == 0 then
        setProperty('timeBar.color', getColorFromHex('FFFF99'))
        setProperty('timeBarBG.color', getColorFromHex('FFFF99'))
    else
        setProperty('timeBar.color', getColorFromHex('CF9FFF'))
        setProperty('timeBarBG.color', getColorFromHex('CF9FFF'))
    end
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
 --[[]   if piss2 == 0 then
      triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 1 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 2 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 3 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    end]]

end      
end

function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('post-dialogue', 'Overlord');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end

