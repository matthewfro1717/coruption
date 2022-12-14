local angleshit = 1.5;
local anglevar = 1.5;
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

function onUpdatePost()
	setProperty('introSoundsSuffix', '-bambi')
end


function onUpdate()
	songPos = getSongPosition()
	setProperty('timeBar.color', getColorFromHex('505050'))
    setProperty('timeBarBG.color', getColorFromHex('505050'))
	setProperty("timeBar.alpha",0)
	noteTweenAlpha('itsnothere',0, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0.4, 0.001, 'sineOut')
end



function onCreate()
    windowX1 = getPropertyFromClass('openfl.Lib', 'application.window.x')+11050
    windowY1 = getPropertyFromClass('openfl.Lib', 'application.window.y')+11000
  windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10050
  windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  windowX3 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10000
  windowY3 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000

	setProperty("gf.alpha", 0)
	makeLuaText('dis', "Oblivious by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end



function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
	if piss2 == 0 then
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	  triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');  
	  for i = 0,7 do
		noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')-90,crochet*0.001-0.01,'expoOut')
	end
	elseif piss2 == 1 then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');
			for i = 0,7 do
				noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')-45,crochet*0.001-0.01,'expoOut')
			end
	elseif piss2 == 2 then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
			for i = 0,7 do
				noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+45,crochet*0.001-0.01,'expoOut')
			end
	elseif piss2 == 3 then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
			for i = 0,7 do
				noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
			end
	end
	if mustHitSection == false then
		health = getProperty('health')
		if getProperty('health') > 0.05 then
			setProperty('health', health- 0.012);
		end
	end
  end


