local angleshit = 2;
local anglevar = 2;

function onBeatHit()
	for i = 4,7 do
		noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+45,crochet*0.001-0.01,'expoOut')
	end
	for i = 0,3 do
		noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+180,crochet*0.001-0.01,'expoOut')
	end
	triggerEvent('Add Camera Zoom', '0.05', '0.01');
	if curBeat % 2 == 0 then
		angleshit = anglevar;
		setProperty('iconP2.color', getColorFromHex('000000'))
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('healthBar.color', getColorFromHex('00FFFF'))
		doTweenColor('epic1','iconP2','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic2','dad','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic3','healthBar','FFFFFF',crochet*0.001-0.01,'linear')
	else
		angleshit = -anglevar;
	end
	setProperty('camHUD.angle',angleshit*3)
	doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
       

end

function onUpdatePost()
	setProperty('introSoundsSuffix', '-bandumb')
	setProperty('ratingsData[0].image', 'anomoly-sick')
	setProperty('ratingsData[1].image', 'anomoly-good')
	setProperty('ratingsData[2].image', 'anomoly-bad')
	setProperty('ratingsData[3].image', 'anomoly-shit')
	setProperty("comboSuffix", "-anomoly") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
  end
  
  function onCountdownTick(tick)
	if tick == 1 then
		loadGraphic('countdownReady', 'anomoly-ready')
		   elseif tick == 2 then
		loadGraphic('countdownSet', 'anomoly-set')
		  elseif tick == 3 then
		loadGraphic('countdownGo', 'anomoly-go')
	end
  end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('023020'))
	setProperty('timeBarBG.color', getColorFromHex('023020'))
end

function onCreate()
	makeLuaText('dis', "NUMBSKULL by Emperor Yami", 600, 350, 300)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 40)
    setTextColor('dis', '32CD32')
    addLuaText('dis',true)
	makeLuaText('dis2', "Mockery of Spamtracks (522BPM)", 600, 350, 200)
    doTweenAlpha('disbye2','dis2',0,8,'linear')
    setTextSize('dis2', 40)
    setTextColor('dis2', '208320')
    addLuaText('dis2',true)
	makeLuaText('dis3', "Modchart Difficulty: 5", 600, 350, 400)
    doTweenAlpha('disbye3','dis3',0,8,'linear')
    setTextSize('dis3', 40)
    setTextColor('dis3', '208320')
    addLuaText('dis3',true)
	makeLuaText('dis4', "Chart Difficulty: 9 [Spam]", 600, 350, 450)
    doTweenAlpha('disbye4','dis4',0,8,'linear')
    setTextSize('dis4', 40)
    setTextColor('dis4', '208320')
    addLuaText('dis4',true)
	makeLuaText('dis5', "Chart Constant: 11.3", 600, 350, 525)
    doTweenAlpha('disbye5','dis5',0,8,'linear')
    setTextSize('dis5', 40)
    setTextColor('dis5', 'FF0000')
    addLuaText('dis5',true)
end
function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	triggerEvent('Add Camera Zoom', '0.05', '0.03');
	health = getProperty('health')
	if getProperty('health') > 0.15 then
		setProperty('health', health- 0.01)
	end
    end

    

