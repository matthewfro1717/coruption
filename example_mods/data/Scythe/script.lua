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
		setProperty('health', health- 0.008);
	end
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('FFFFFF'))
    setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
    setProperty('HalfHearted.angle',currentBeat*7)

end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end


function onCreate()
	makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    setObjectCamera('epicflash','other')

	makeLuaText('creditsText', "Scythe composed by Top 10 Awesome | Charted by ReeVrze ", 0, 0, (downscroll and -35 or 730));
	setTextBorder('creditsText', 2, '000000');
	setTextSize('creditsText', 30);
	screenCenter('creditsText', 'X')
	addLuaText('creditsText');
	setObjectCamera('creditsText', 'other');
	setTextFont('creditsText', 'gillsans.ttf')
end

function onSongStart()
	doTweenY('aumddCredits', 'creditsText', (downscroll and 5 or 690), 0.3, 'sineOut')
	doTweenY('addCreditBG', 'bg', (downscroll and -35 or 685), 0.3, 'sineOut')

	runTimer('creditBGWait', 2, 1)
end

function onTimerCompleted(tag)
	-- FINALLY I GOT IT TO BE A TIMER
	if tag == 'creditBGWait' and not creditsRemoved then 
		doTweenY('removeCredits', 'creditsText', (downscroll and -35 or 730), 0.3, 'sineIn')
		doTweenY('removeCreditBG', 'bg', (downscroll and -70 or 725), 0.3, 'sineIn')
		creditsRemoved = true
	end
end
