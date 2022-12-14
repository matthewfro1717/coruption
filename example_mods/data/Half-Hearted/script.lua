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

function opponentNoteHit()

	health = getProperty('health')
	if getProperty('health') > 0.1 then
		setProperty('health', health- 0.015);
	end

    
end

function onUpdate()
	if curBeat % 2 == 0 then
		setProperty('timeBar.color', getColorFromHex('FFFFFF'))
		setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	else
		setProperty('timeBar.color', getColorFromHex('5D3FD3'))
		setProperty('timeBarBG.color', getColorFromHex('5D3FD3'))
	end
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('HalfHearted.angle',currentBeat*7)

end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end


function onBeatHit()
	if curBeat == 64 then
        doFlash(1,1.5,'FFFFFF')
		makeLuaSprite('HalfHearted', 'HalfHearted', -2500,-2100)
		setLuaSpriteScrollFactor('HalfHearted', 0.9, 0.9); 
		addLuaSprite('HalfHearted')
		scaleObject('HalfHearted', 3, 3);
		setProperty("half.alpha",0)
	end

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
		triggerEvent('Add Camera Zoom', '0.03', '0.01');
	end
end
function onCreate()
	makeLuaText('dis', "Half Hearted by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
	makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    setObjectCamera('epicflash','other')
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-zand0r')
end
