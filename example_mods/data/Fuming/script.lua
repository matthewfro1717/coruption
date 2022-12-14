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

function onSongStart()
	setProperty('songLength', 151810)
end

function opponentNoteHit()

	health = getProperty('health')
	if getProperty('health') > 0.1 then
		setProperty('health', health- 0.015);
	end

	if curBeat > 560 then 
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.025);
        end
		triggerEvent('Screen Shake', '0, 0', '0.02, 0.05');
		triggerEvent('Add Camera Zoom', '0.02', '0.01');
	end
    
end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-bambi')
	setProperty('ratingsData[0].image', 'og-sick')
    setProperty('ratingsData[1].image', 'og-good')
    setProperty('ratingsData[2].image', 'og-bad')
    setProperty('ratingsData[3].image', 'og-shit')
	setProperty("comboSuffix", "-og") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('0fe200'))
    setProperty('timeBarBG.color', getColorFromHex('0fe200'))

	if curBeat > 559 then
		setProperty('timeBar.color', getColorFromHex('FF0000'))
    	setProperty('timeBarBG.color', getColorFromHex('FF0000'))
	end
end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end


function onBeatHit()

	if curBeat > 144 and curBeat < 544 then
		triggerEvent('Add Camera Zoom', '0.01', '0.01');
	end
	if curBeat > 560 then
		triggerEvent('Add Camera Zoom', '0.05', '0.03');
	end

	if curBeat == 552 then
		setProperty('songLength', 200000)
	end

	if curBeat == 554 then
		setProperty('songLength', 400000)
	end

	if curBeat == 556 then
		setProperty('songLength', 1600000)
	end

	if curBeat == 557 then
		setProperty('songLength', 6400000)
	end
	if curBeat == 558 then
		setProperty('songLength', 128000000)
	end
	if curBeat == 559 then
		setProperty('songLength', 4442200000000000)
	end
	if curBeat == 560 then
        doFlash(1,1.5,'FFFFFF')
		setProperty('songLength', getPropertyFromClass('flixel.FlxG','sound.music.length'))
    end
end

function onCreate()
	makeLuaText('dis', "Fuming by Null_y34r", 600, 680, 0)
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

function onEndSong()
	if isStoryMode and not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('FumingEnd')
		return Function_Stop;
	else
		return Function_Continue;
	end
end