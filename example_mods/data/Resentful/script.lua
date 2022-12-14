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

function onCountdownTick(tick)
    if tick == 1 then
        loadGraphic('countdownReady', 'og-ready')
       		elseif tick == 2 then
        loadGraphic('countdownSet', 'og-set')
        	elseif tick == 3 then
        loadGraphic('countdownGo', 'og-go')
    end
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'canzies');
	end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.015);
        end
    end
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('00ff00'))
    setProperty('timeBarBG.color', getColorFromHex('00ff00'))
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SIX') then
        loadSong('screwed', 'screwed', true)
	end
end

function onCreate()
	makeLuaText('dis', "Resentful Remix by EpicRandomness11", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function onUpdatePost()
	setProperty('ratingsData[0].image', 'og-sick')
    setProperty('ratingsData[1].image', 'og-good')
    setProperty('ratingsData[2].image', 'og-bad')
    setProperty('ratingsData[3].image', 'og-shit')
	setProperty("comboSuffix", "-og") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
	setProperty('introSoundsSuffix', '-bambi')
end