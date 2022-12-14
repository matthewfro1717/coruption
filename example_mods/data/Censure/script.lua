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
    if curBeat == 20 then
        makeLuaText('dis', "Censure (unofficial dave and bambi fantrack) by vvxrthy", 600, 680, 0)
        doTweenAlpha('disbye','dis',0,8,'linear')
        setTextSize('dis', 20)
        setTextColor('dis', 'FFFFFF')
        addLuaText('dis',true)
    end
    if (curBeat >= 192 and curBeat < 256) or (curBeat >= 512 and curBeat < 576) then
        if curBeat % 2 == 0 then    
            noteTweenAngle("leftopponent1", 0, 315, 0.1, "linear")
            noteTweenAngle("downopponent1", 1, 135, 0.1, "linear")
            noteTweenAngle("upopponent1", 2, 225, 0.1, "linear")
            noteTweenAngle("rightopponent1", 3, 225, 0.1, "linear")
            noteTweenAngle("leftbf1", 4, 315, 0.1, "linear")
            noteTweenAngle("downbf1", 5, 135, 0.1, "linear")
            noteTweenAngle("upbf1", 6, 225, 0.1, "linear")
            noteTweenAngle("rightbf1", 7, 225, 0.1, "linear")
        end
        if curBeat % 2 == 1 then    
            noteTweenAngle("leftopponent2", 0, 225, 0.1, "linear")
            noteTweenAngle("downopponent2", 1, 225, 0.1, "linear")
            noteTweenAngle("upopponent2", 2, 135, 0.1, "linear")
            noteTweenAngle("rightopponent2", 3, 315, 0.1, "linear")
            noteTweenAngle("leftbf2", 4, 225, 0.1, "linear")
            noteTweenAngle("downbf2", 5, 225, 0.1, "linear")
            noteTweenAngle("upbf2", 6, 135, 0.1, "linear")
            noteTweenAngle("rightbf2", 7, 315, 0.1, "linear")
        end
    end
    if curBeat == 256 or curBeat == 576 then
        noteTweenAngle("leftopponent3", 0, 0, 1, "linear")
        noteTweenAngle("downopponent3", 1, 0, 1, "linear")
        noteTweenAngle("upopponent3", 2, 0, 1, "linear")
        noteTweenAngle("rightopponent3", 3, 0, 1, "linear")
        noteTweenAngle("leftbf3", 4, 0, 1, "linear")
        noteTweenAngle("downbf3", 5, 0, 1, "linear")
        noteTweenAngle("upbf3", 6, 0, 1, "linear")
        noteTweenAngle("rightbf3", 7, 0, 1, "linear")
    end
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
function onStepHit()
    if ((curStep>=252) and (curStep<=256)) or ((curStep>=1020) and (curStep<=1024)) or ((curStep>=2301) and (curStep<=2305))then
        noteTweenX("noteTweenX1", 0, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX2", 1, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX3", 2, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX4", 3, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX5", 4, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX6", 5, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX7", 6, math.random(0, 800), 0.000001, linear)
        noteTweenX("noteTweenX8", 7, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY1", 0, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY2", 1, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY3", 2, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY4", 3, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY5", 4, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY6", 5, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY7", 6, math.random(0, 800), 0.000001, linear)
        noteTweenY("noteTweenY8", 7, math.random(0, 800), 0.000001, linear)
    end
    if curStep==257 or curStep==1025 or curStep==2306 then
        noteTweenX("noteTweenendX1", 0, defaultOpponentStrumX0, 0.000001, linear)
        noteTweenX("noteTweenendX2", 1, defaultOpponentStrumX1, 0.000001, linear)
        noteTweenX("noteTweenendX3", 2, defaultOpponentStrumX2, 0.000001, linear)
        noteTweenX("noteTweenendX4", 3, defaultOpponentStrumX3, 0.000001, linear)
        noteTweenX("noteTweenendX5", 4, defaultPlayerStrumX0, 0.000001, linear)
        noteTweenX("noteTweenendX6", 5, defaultPlayerStrumX1, 0.000001, linear)
        noteTweenX("noteTweenendX7", 6, defaultPlayerStrumX2, 0.000001, linear)
        noteTweenX("noteTweenendX8", 7, defaultPlayerStrumX3, 0.000001, linear)
        noteTweenY("noteTweenendY1", 0, defaultOpponentStrumY0, 0.000001, linear)
        noteTweenY("noteTweenendY2", 1, defaultOpponentStrumY1, 0.000001, linear)
        noteTweenY("noteTweenendY3", 2, defaultOpponentStrumY2, 0.000001, linear)
        noteTweenY("noteTweenendY4", 3, defaultOpponentStrumY3, 0.000001, linear)
        noteTweenY("noteTweenendY5", 4, defaultPlayerStrumY0, 0.000001, linear)
        noteTweenY("noteTweenendY6", 5, defaultPlayerStrumY1, 0.000001, linear)
        noteTweenY("noteTweenendY7", 6, defaultPlayerStrumY2, 0.000001, linear)
        noteTweenY("noteTweenendY8", 7, defaultPlayerStrumY3, 0.000001, linear)
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
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.015)
        end
        characterPlayAnim('boyfriend', 'scared', true)
    end
end
      
