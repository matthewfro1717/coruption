local allowCountdown = false
local sinmul = 0
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
	songPos = getSongPosition()
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
	setProperty('timeBar.color', getColorFromHex('00ff00'))
    setProperty('timeBarBG.color', getColorFromHex('00ff00'))
	doTweenColor('epic1','timeBar','008800',crochet*0.001-0.01,'linear')
	doTweenColor('epic2','timeBarBG','008800',crochet*0.001-0.01,'linear')
	if (currentBeat >= 0 and currentBeat < 64) or (currentBeat >= 104 and currentBeat < 192) then
		if math.fmod(currentBeat,2) == 0 then
			sinmul = 200
		else
			sinmul = -200
		end
	end
	if currentBeat == 96 then
		doTweenAlpha('epicc1','Cheated',0.6,0.8,'linear')
		doTweenZoom('epicc2','camGame',1.2,crochet*0.004,'sineOut')
	end
	if currentBeat == 100 then
		doTweenZoom('epicc3','camGame',0.8,crochet*0.004,'sineIn')
	end
	if currentBeat == 104 then
		doTweenAlpha('epicc4','Cheated',1,0.8,'linear')
	end
	if currentBeat == 192 then
		for i = 0,7 do
			noteTweenX('end1-' .. i,i,-130+i*220,crochet*0.004,'expoIn')
			noteTweenY('end2-' .. i,i,1000,crochet*0.004,'expoIn')
		end
	end
end
function onStepHit()
	songPos = getSongPosition()
	local currentStep = math.floor((songPos/1000)*(bpm/15))
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
	if (currentBeat >= 0 and currentBeat < 96) or (currentBeat >= 104 and currentBeat < 192) then
		if math.fmod(currentStep,4) == 2 then
			doTweenZoom('c1','camHUD',1.03,crochet*0.0005-0.01,'sineIn')
		end
		if math.fmod(currentStep,4) == 0 then
			doTweenZoom('c2','camHUD',1,crochet*0.0005-0.01,'sineOut')
		end
	end
end
function onSongStart()
	for i = 0,7 do
		noteTweenX('start' .. i,i,420+math.fmod(i,4)*110,1,'expoOut')
	end
	doTweenZoom('c1','camHUD',1.03,crochet*0.0005-0.01,'sineIn')
	sinmul = 200
end
function onUpdatePost()
	setProperty('introSoundsSuffix', '-bambi')
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
        loadSong('Blocked-Forever', 'Blocked-Forever', true)
	end
	notesLength = getProperty('notes.length')
	songPos = getSongPosition()
    setPropertyFromClass('PlayState', 'song.speed', 1.5)
	local currentBeat = (songPos/1000)*(bpm/60)
	sinmul = sinmul*0.9
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',0.3)
	end
	for i1 = 0, notesLength, 1 do
		Thisnotex = getPropertyFromGroup('notes',i1,'x')
		Thisnotey = getPropertyFromGroup('notes',i1,'y')
		Thisnote = getPropertyFromGroup('notes',i1,'noteData')
		Thisnoteoriginx = getPropertyFromGroup('strumLineNotes',Thisnote,'x')
		Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
        if downscroll then
            setPropertyFromGroup('notes',i1,'x',-10+Thisnoteoriginx+math.sin((Thisnotey*0.003-Thisnoteoriginy)*math.pi)*-sinmul*(Thisnotey*0.003))
        else
            setPropertyFromGroup('notes',i1,'x',-10+Thisnoteoriginx+math.sin((Thisnotey*0.003-Thisnoteoriginy)*math.pi)*sinmul*(Thisnotey*0.003))
        end
	end
end

function onCreate()
	makeLuaText('dis', "Farm by Null_y34r | Remix by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end