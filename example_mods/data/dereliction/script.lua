local angleshit = 1;
local anglevar = 1;
local amogus = true;
local alphaisfucked = true; --made this since for some fucking reason pb kept appearing when they weren't supposed too xD

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
		startDialogue('dialogue', 'canzies');
	end
end


function onBeatHit()
    if curBeat >= 19 then
        doTweenAlpha('dadahtryu89', 'dad', 1, 1, quadOut)
    end
    if curBeat >= 32 then
        doTweenAlpha('bfhahgfsu[u9edfras', 'boyfriend', 1, 1, quadOut)
    end
    if curBeat >= 48 then
        doTweenAlpha('gflololo', 'gf', 1, 1, quadOut)
    end
    if curBeat > 672 and curBeat < 674 then 
		playSound('sorry', 0.4);
	end

    if curBeat > 480 then
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

    if curBeat > 0 then
        function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
            if piss2 == 0 then
              triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
            elseif piss2 == 1 then
                    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
            elseif piss2 == 2 then
                    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
            elseif piss2 == 3 then
                    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
            end
        
            if mustHitSection == false then
                health = getProperty('health')
                if getProperty('health') > 0 then
                    setProperty('health', health- 0.0007);
                end
            end 
        end

    end


end

function onCreate()
    setProperty('dad.alpha', 0)
    setProperty('boyfriend.alpha', 0)
    setProperty('gf.alpha', 0)
    setProperty('skipCountdown',true)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    setObjectCamera('epicflash','other')
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    makeLuaText('dis', "Original by hortas | Remix by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end
function onUpdate(elapsed)
	setProperty('timeBar.color', getColorFromHex('800080'))
    setProperty('timeBarBG.color', getColorFromHex('800080'))
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-bambi')
end