function onUpdatePost()
	setProperty('introSoundsSuffix', '-bambi')
end


function onUpdate()
	songPos = getSongPosition()
	setProperty('timeBar.color', getColorFromHex('505050'))
    setProperty('timeBarBG.color', getColorFromHex('505050'))
	setProperty("timeBar.alpha",0)
	noteTweenAlpha('itsnothere',0, 0.2, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0.2, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0.2, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0.2, 0.001, 'sineOut')
end



function onCreate()
    windowX1 = getPropertyFromClass('openfl.Lib', 'application.window.x')+11050
    windowY1 = getPropertyFromClass('openfl.Lib', 'application.window.y')+11000
  windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10050
  windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  windowX3 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10000
  windowY3 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000


	setProperty("gf.alpha", 0)
	
    makeLuaText('dis', "INSANE v2 by Null_y34r", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end


easingstyle = "sineInOut"

function onSongStart()
	notePosX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
	notePosX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
	notePosX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
	notePosX3 = getPropertyFromGroup('opponentStrums', 3, 'x')
	notePosX4 = getPropertyFromGroup('playerStrums', 0, 'x')
	notePosX5 = getPropertyFromGroup('playerStrums', 1, 'x')
	notePosX6 = getPropertyFromGroup('playerStrums', 2, 'x')
	notePosX7 = getPropertyFromGroup('playerStrums', 3, 'x')

	noteTweenX("0", 0, (notePosX0 + 100), 2, easingstyle)
	noteTweenX("02", 1, (notePosX1 + 100), 2, easingstyle)
	noteTweenX("03", 2, (notePosX2 + 100), 2, easingstyle)
	noteTweenX("04", 3, (notePosX3 + 100), 2, easingstyle)
	noteTweenX("05", 4, (notePosX4 - 100), 2, easingstyle)
	noteTweenX("06", 5, (notePosX5 - 100), 2, easingstyle)
	noteTweenX("07", 6, (notePosX6 - 100), 2, easingstyle)
	noteTweenX("08", 7, (notePosX7 - 100), 2, easingstyle)
end

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
		noteTweenX("1", 0, (notePosX0 - 100), 2, easingstyle)
		noteTweenX("12", 1, (notePosX1 - 100), 2, easingstyle)
		noteTweenX("13", 2, (notePosX2 - 100), 2, easingstyle)
		noteTweenX("14", 3, (notePosX3 - 100), 2, easingstyle)

		noteTweenX("15", 4, (notePosX4 + 100), 2, easingstyle)
		noteTweenX("16", 5, (notePosX5 + 100), 2, easingstyle)
		noteTweenX("17", 6, (notePosX6 + 100), 2, easingstyle)
		noteTweenX("18", 7, (notePosX7 + 100), 2, easingstyle)
	end
	if tag == "1" then
		noteTweenX("0", 0, (notePosX0 + 100), 2, easingstyle)
		noteTweenX("02", 1, (notePosX1 + 100), 2, easingstyle)
		noteTweenX("03", 2, (notePosX2 + 100), 2, easingstyle)
		noteTweenX("04", 3, (notePosX3 + 100), 2, easingstyle)
		noteTweenX("05", 4, (notePosX4 - 100), 2, easingstyle)
		noteTweenX("06", 5, (notePosX5 - 100), 2, easingstyle)
		noteTweenX("07", 6, (notePosX6 - 100), 2, easingstyle)
		noteTweenX("08", 7, (notePosX7 - 100), 2, easingstyle)
	end
	setTextFont('kadeEngineWatermark', 'Hacked-KerX.ttf')
	if downscroll then
		setProperty('kadeEngineWatermark.y', screenHeight * 0.9 + 49)
	end

	-- Hides the watermark to replace the new one
	setProperty("watermarkTxt.alpha", 0)

	-- Resets the fonts to the Crumb Edition ones
	setTextFont('scoreTxt','Hacked-KerX.ttf')
	setTextFont('missesTxt','Hacked-KerX.ttf')
	setTextFont('judgementCounterTxt', 'Hacked-KerX.ttf')
	setTextFont('timeTxt','Hacked-KerX.ttf')
end

function onBeatHit()
	if curBeat % 2 == 0 then
		angleshit = anglevar*2;
	else
		angleshit = -anglevar;
	end
	local currentBeat = math.floor((songPos/1000)*(bpm/60))
	for i = 0,7 do
		noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
	end

	if math.fmod(currentBeat,8) > 3 then
		if curBeat % 1 == 0 then
			triggerEvent('Change Scroll Speed', '0.7', '0.001');
			triggerEvent('Change Scroll Speed', '1', '0.2');
        else
			triggerEvent('Change Scroll Speed', '0.7', '0.001');
			triggerEvent('Change Scroll Speed', '1', '0.2');
        end
		setProperty('timeTxt.color', getColorFromHex('000000'))
		setProperty('healthBar.color', getColorFromHex('000000'))
		setProperty('scoreTxt.color', getColorFromHex('000000'))
		setProperty('judgementCounter.color', getColorFromHex('000000'))
		setProperty('iconP1.color', getColorFromHex('000000'))
		setProperty('iconP2.color', getColorFromHex('000000'))
		setProperty('camHUD.color', getColorFromHex('000000'))
		setProperty('boyfriend.color', getColorFromHex('000000'))
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('background.color', getColorFromHex('000000'))
		doTweenColor('epic1','timeTxt','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic2','healthBar','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic3','scoreTxt','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic4','iconP1','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic5','iconP2','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic6','camHUD','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic7','boyfriend','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic8','dad','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic9','background','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic10','judgementCounter','FFFFFF',crochet*0.001-0.01,'linear')
		setProperty('camHD.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
	end

	if math.fmod(currentBeat,8) < 2 then
		if curBeat % 1 == 0 then
			angleshit = anglevar*0.5;
		else
		end
	end
end
function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
	if piss2 == 0 then
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	  triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');  
	elseif piss2 == 1 then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');
	elseif piss2 == 2 then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
	elseif piss2 == 3 then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
	end
	if mustHitSection == false then
		health = getProperty('health')
		if getProperty('health') > 0.5 then
			setProperty('health', health- 0.01);
		end
	end
  end


