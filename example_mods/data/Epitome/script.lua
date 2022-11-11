local funni = true;
local thefunny = true;
local amogus = true;
local angleshit = 1;
local anglevar = 1;

local allowCountdown = false
function onStartCountdown()
	triggerEvent('Add Camera Zoom', '0, 0', '6, 6');
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
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	noteTweenX("0", 0, (notePosX0 + 600), 2, easingstyle)
	noteTweenX("02", 1, (notePosX1 + 600), 2, easingstyle)
	noteTweenX("03", 2, (notePosX2 + 600), 2, easingstyle)
	noteTweenX("04", 3, (notePosX3 + 600), 2, easingstyle)
	noteTweenX("05", 4, (notePosX4 - 600), 2, easingstyle)
	noteTweenX("06", 5, (notePosX5 - 600), 2, easingstyle)
	noteTweenX("07", 6, (notePosX6 - 600), 2, easingstyle)
	noteTweenX("08", 7, (notePosX7 - 600), 2, easingstyle)
end

easingstyle = "sineInOut"
function onTweenCompleted(tag)
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	if tag == "0" then
		noteTweenX("1", 0, (notePosX0 - 600), 2, easingstyle)
		noteTweenX("12", 1, (notePosX1 - 600), 2, easingstyle)
		noteTweenX("13", 2, (notePosX2 - 600), 2, easingstyle)
		noteTweenX("14", 3, (notePosX3 - 600), 2, easingstyle)

		noteTweenX("15", 4, (notePosX4 + 600), 2, easingstyle)
		noteTweenX("16", 5, (notePosX5 + 600), 2, easingstyle)
		noteTweenX("17", 6, (notePosX6 + 600), 2, easingstyle)
		noteTweenX("18", 7, (notePosX7 + 600), 2, easingstyle)
	end
	if tag == "1" then
		noteTweenX("0", 0, (notePosX0 + 600), 2, easingstyle)
		noteTweenX("02", 1, (notePosX1 + 600), 2, easingstyle)
		noteTweenX("03", 2, (notePosX2 + 600), 2, easingstyle)
		noteTweenX("04", 3, (notePosX3 + 600), 2, easingstyle)
		noteTweenX("05", 4, (notePosX4 - 600), 2, easingstyle)
		noteTweenX("06", 5, (notePosX5 - 600), 2, easingstyle)
		noteTweenX("07", 6, (notePosX6 - 600), 2, easingstyle)
		noteTweenX("08", 7, (notePosX7 - 600), 2, easingstyle)
	end
end


function onUpdate(elapsed)
  setProperty('timeBar.color', getColorFromHex('008900'))
  setProperty('timeBarBG.color', getColorFromHex('008900'))

 --[[ if amogus == true then
    if curStep >= 0 then
        songPos = getSongPosition()
      local currentBeat = (songPos/2000)*(bpm/90)
      setProperty('dad.angle',0+currentBeat*70)
  end
  end]]
    
    if funni == true then
    songPos = getSongPosition()
    local currentBeat = (songPos/500)*(curBpm/200)
    local currentBeat2 = (songPos/200)*(curBpm/100)
    setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.2))
    setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.2))

	noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 100 * math.sin((currentBeat *0.25) * math.pi), 0.01)
	noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 50 * math.sin((currentBeat *0.25) * math.pi), 0.01)
	noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 50 * math.sin((currentBeat *0.25) * math.pi), 0.01)
	noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 100 * math.sin((currentBeat *0.25) * math.pi), 0.01)

	noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 + 100 * math.sin((currentBeat *0.25) * math.pi), 0.01)
	noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 + 50 * math.sin((currentBeat *0.25) * math.pi), 0.01)
	noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 + 50 * math.sin((currentBeat *0.25) * math.pi), 0.01)
	noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 + 100 * math.sin((currentBeat *0.25) * math.pi), 0.01)
    
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 800 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 500 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 300 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 300 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    
    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 300 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 300 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 500 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 800 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
end
end

function onBeatHit()
	if curBeat > 260 and curBeat < 263 then 
		playSound('sorry', 0.4);
	end

    if thefunny == true then
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
        triggerEvent('Add Camera Zoom', '0.03, 0.03');
    
      end
  end
end

function onCreate()
	makeLuaText('dis', "Original by Null_y34r | Remix by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
      triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
    end

    

