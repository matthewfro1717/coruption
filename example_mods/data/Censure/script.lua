local angleshit = 0.5;
local anglevar = 0.5;
local allowCountdown = false
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

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('ffffff'))
    setProperty('timeBarBG.color', getColorFromHex('ffffff'))
end


function onBeatHit()
    if curBeat < 32 then
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
    if curBeat > 128 then
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
        triggerEvent('Change Scroll Speed', '0.8', '0.001');
        triggerEvent('Change Scroll Speed', '1', '0.2');
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    end
end


function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if piss2 == 0 then
      triggerEvent('Add Camera Zoom', '0.01', '0.005');
      triggerEvent('Screen Shake', '0.1, 0.005', '0.1, 0.005');
    elseif piss2 == 1 then
        triggerEvent('Add Camera Zoom', '0.01', '0.005');
        triggerEvent('Screen Shake', '0.1, 0.005', '0.1, 0.005');
    elseif piss2 == 2 then
        triggerEvent('Add Camera Zoom', '0.01', '0.005');
        triggerEvent('Screen Shake', '0.1, 0.005', '0.1, 0.005');
    elseif piss2 == 3 then
        triggerEvent('Add Camera Zoom', '0.01', '0.005');
        triggerEvent('Screen Shake', '0.1, 0.005', '0.1, 0.005');
    end
end
      
function onCreate()
    makeLuaText('dis', "Censure (unofficial dave and bambi fantrack) by vvxrthy", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end