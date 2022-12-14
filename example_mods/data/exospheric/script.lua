local angleshit = 0.5;
local anglevar = 0.5;

function onUpdatePost()
	setProperty('introSoundsSuffix', '-exosphere')
end


function onUpdate()
	songPos = getSongPosition()
	setProperty('timeBar.color', getColorFromHex('FFFFFF'))
    setProperty('timeBarBG.color', getColorFromHex('000000'))
	setProperty("timeBar.alpha",0)
	noteTweenAlpha('itsnothere',0, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0.4, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0.4, 0.001, 'sineOut')
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') then
        loadSong('Atmospheric-Anomaly', 'Atmospheric-Anomaly', true)
	end
end



function onCreate()
    windowX1 = getPropertyFromClass('openfl.Lib', 'application.window.x')+11050
    windowY1 = getPropertyFromClass('openfl.Lib', 'application.window.y')+11000
  windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10050
  windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  windowX3 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10000
  windowY3 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  makeLuaText('dis', "Exospheric by ShiftyTM", 600, 680, 0)
  doTweenAlpha('disbye','dis',0,8,'linear')
  setTextSize('dis', 20)
  setTextColor('dis', 'FFFFFF')
  addLuaText('dis',true)
end

function onBeatHit()
    if curBeat > 95 and curBeat < 160 then	
		if curBeat % 2 == 0 then
			angleshit = anglevar*2;
		else
			angleshit = -anglevar;
		end
		local currentBeat = math.floor((songPos/1000)*(bpm/60))
		setProperty('camHD.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
		
	if math.fmod(currentBeat,8) > 3 then
		if curBeat % 1 == 0 then
			triggerEvent('Change Scroll Speed', '0.8', '0.001');
			triggerEvent('Change Scroll Speed', '1', '0.2');
			for i = 0,7 do
				noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
			end
        else
			triggerEvent('Change Scroll Speed', '0.8', '0.001');
			triggerEvent('Change Scroll Speed', '1', '0.2');
			for i = 0,7 do
				noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
			end
        end
	end
end
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
	if mustHitSection == false then
		health = getProperty('health')
		if getProperty('health') > 0.25 then
			setProperty('health', health- 0.015);
		end
	end
end


