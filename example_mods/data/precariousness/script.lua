local angleshit = 1;
local anglevar = 1;
local alphaisfucked = true; --made this since for some fucking reason pb kept appearing when they weren't supposed too xD

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
		startDialogue('dialogue', 'canzies');
	end
end

function onUpdate(elapsed)
    setProperty('timeBar.color', getColorFromHex('FFFF00'))
    setProperty('timeBarBG.color', getColorFromHex('FFFF00'))
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

function onUpdatePost()
	setProperty('introSoundsSuffix', '-exosphere')
    setProperty('ratingsData[0].image', 'anomoly-sick')
    setProperty('ratingsData[1].image', 'anomoly-good')
    setProperty('ratingsData[2].image', 'anomoly-bad')
    setProperty('ratingsData[3].image', 'anomoly-shit')
	setProperty("comboSuffix", "-anomoly") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
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
    end
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.2 then
            setProperty('health', health- 0.01);
        end
    end
    if piss2 == 0 then
      triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 1 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 2 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 3 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    end

end      

function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length') do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false and getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'FlyHighNotes_assets')
        end
    end
    for i = 0, getProperty('notes.length') do
        if getPropertyFromGroup('notes', i, 'mustPress') == false and getPropertyFromGroup('notes', i, 'noteType') == '' then
            setPropertyFromGroup('notes', i, 'texture', 'FlyHighNotes_assets')
        end
    end
    for i = 0, getProperty('opponentStrums.length') do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'FlyHighNotes_assets')
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

