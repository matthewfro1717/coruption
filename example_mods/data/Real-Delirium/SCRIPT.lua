--this is so stupid lmao
local sSpeed = 3
function onCreate() --setting variables and making sprites
	setProperty('skipCountdown',true)
    setProperty('cpuControlled', false)
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    doTweenAlpha('introfade1','introfade',0,1,'linear')
    makeLuaSprite('offsettween','',0,0)
    setProperty('offsettween.alpha',0.22)
    for i = 0,7 do
        makeLuaSprite('strumwhite' .. i,'',0,0)
        makeGraphic('strumwhite' .. i,10,3000,'FFFFFF')
        setObjectCamera('strumwhite' .. i,'HUD')
        setProperty('strumwhite' .. i .. '.alpha',0)
        addLuaSprite('strumwhite' .. i,false)
    end
    if not getPropertyFromClass('ClientPrefs', 'downScroll') then
       makeLuaText('scro', "this is downscroll only.", 600, 350, 300)
       setTextSize('scro', 90)
       setTextColor('scro', 'FF0077')
       addLuaText('scro',true)
    end
    makeLuaText('dis', "modchart by: gaming man#4758. this was a bad idea", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    makeLuaText('d', 'dont miss lol', 600, 330, 50)
    setTextSize('d', 20)
    setTextColor('d', 'DD0066')
    addLuaText('d',true)
    setProperty("iconP2.alpha", 0)
    setProperty("iconP1.alpha", 0)
    setProperty("healthBar.alpha", 0)
    setProperty("scoreTxt.alpha",0)
end
function onSongStart()
    doTweenY('weirdspeed1','offsettween',getProperty('offsettween.y')+sSpeed*-32*1000,stepCrochet*0.001*1000,'linear')
    setProperty('offsettween.x',(sSpeed*32)*2)
end

function onBeatHit() --events but better
    local currentBeat = math.floor((songPos/1000)*(curBpm/60))
    if currentBeat >= 8 and not getPropertyFromClass('ClientPrefs', 'downScroll') then
        setPropertyFromClass('ClientPrefs', 'downScroll', true)
        playedupscroll = true
        doTweenAlpha('scrofade','scro',0,1,'linear')
    end
end
function onStepHit()
    floorStep = math.floor(currentStep)
    if floorStep % 2 == 0 then
    doTweenX('weirdspeed2','offsettween',getProperty('offsettween.x')+(sSpeed*32)*2,stepCrochet*0.0009*2,'expoOut')
    end
end

function onUpdatePost(elapsed)
    songPos = getSongPosition()
    currentStep = (songPos/1000)*(curBpm/15)
	if playedupscroll then
        playedupscroll = false
        makeLuaText('fix', "fixed :^)", 600, 330, 300)
        setTextSize('fix', 140)
        setTextColor('fix', 'FFFFFF')
        addLuaText('fix',true)
		loadSong('Real Delirium', 'Real Delirium', true);
	end
    setProperty("timeTxt.alpha",0)
    setProperty("timeBar.alpha",0)
    setProperty('dad.x',300)
    setProperty('dad.y',400+math.sin(currentStep*math.pi/32)*80)
    setProperty("health", 2-getProperty('songMisses')*2)
    setProperty('camFollowPos.x',1000)
    setProperty('camFollowPos.y',400+math.sin((currentStep-2)*math.pi/32)*80)
    setTextString('dbug', 'curStep: ' .. math.floor(currentStep))
    offset1 = getProperty('offsettween.x')
    offset2 = getProperty('offsettween.y')
    offset3 = getProperty('offsettween.angle')
    notesLength = getProperty('notes.length')
    for i1 = 0, notesLength, 1 do
        TN = getPropertyFromGroup('notes',i1,'noteData')
        TNX = getPropertyFromGroup('notes',i1,'x')
        TNY = getPropertyFromGroup('notes',i1,'y')
        TNOY = getPropertyFromGroup('strumLineNotes',TN+4,'y')
        setPropertyFromGroup('notes',i1,'y',TNY+offset1+offset2)
    end
end