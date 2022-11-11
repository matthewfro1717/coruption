local songPos = 0
local sinmult = 0
local shake = 0
local sinspeed = 0.85
local shakespeed = -0.85

function onCreate() --setting variables and making sprites
	setProperty('skipCountdown',true)
    setProperty('cpuControlled', false)
    makeLuaSprite('introfade','',0,0)
    makeLuaSprite('epicflash','',0,0)
    makeLuaSprite('chrchange','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    setProperty('health', 2)
    doTweenZoom('introzoom1','camGame',0.7,2,'sineInOut')
    for i = 0,7 do
        makeLuaSprite('strumwhite' .. i,'',0,0)
        makeGraphic('strumwhite' .. i,10,3000,'FFFFFF')
        setObjectCamera('strumwhite' .. i,'HUD')
        setProperty('strumwhite' .. i .. '.alpha',0)
        addLuaSprite('strumwhite' .. i,false)
    end
    if getPropertyFromClass('ClientPrefs', 'downScroll') then
       makeLuaText('scro', "this is upscroll only.", 600, 350, 300)
       setTextSize('scro', 90)
       setTextColor('scro', 'FF0000')
       addLuaText('scro',true)
    end
    makeLuaText('dis', "modchart by: gaming man#4758 and OOF Productions. PRESS Z TO HIDE", 600, 20, 540)
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    
    makeLuaText('dis2', "Original by Null_y34r | Remix by Emperor Yami", 600, 680, 0)
    doTweenAlpha('disbye2','dis2',0,8,'linear')
    setTextSize('dis2', 20)
    setTextColor('dis2', 'FFFFFF')
    addLuaText('dis2',true)
end

function onCreatePost() --extra stuff
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'y',-110)
        setPropertyFromGroup('strumLineNotes',i,'direction',90)
    end
end

function onBeatHit() --events but better
    local currentBeat = math.floor((songPos/1000)*(curBpm/60))
    if currentBeat >= 8 and getPropertyFromClass('ClientPrefs', 'downScroll') then
        setPropertyFromClass('ClientPrefs', 'downScroll', false)
        playeddownscroll = true
        doTweenAlpha('scrofade','scro',0,1,'linear')
    end
    if currentBeat == 32 then
        for i = 0,7 do
            noteTweenY('1-2-' .. i,i,60,1,'sineOut')
        end
    end
    if currentBeat == 126 then
        for i = 0,3 do
            noteTweenX('2-1-' .. i,i,200+i*110,0.7,'expoOut')
        end
        for i = 4,7 do
            noteTweenY('2-2-' .. i,i,800,0.7,'expoIn')
        end
    end
    if currentBeat == 128 then
        doFlash(0.8,1.5,'FFFFFF')
    end
    if currentBeat == 140 then
        for i = 0,3 do
            noteTweenX('3-1-' .. i,i,200+i*110,0.7,'expoOut')
        end
        for i = 4,7 do
            noteTweenX('3-2-' .. i,i,200+i*110,0.7,'expoOut')
            noteTweenY('3-3-' .. i,i,60,0.7,'expoOut')
        end
    end
    if currentBeat == 192 then
        doTweenAlpha('funny','introfade',0.95,0.7,'linear')
        doTweenZoom('funny2','camGame',1.2,crochet*0.004,'sineOut')
    end
    if currentBeat == 196 then
        doTweenAlpha('funny','introfade',0,0.8,'linear')
        doTweenZoom('funny3','camGame',1,crochet*0.002,'sineInOut')
    end
    if currentBeat == 200 then
        doTweenAlpha('funny','introfade',0.95,0.7,'linear')
        doTweenZoom('funny2','camGame',1.2,crochet*0.004,'sineOut')
    end
    if currentBeat == 204 then
        doTweenAlpha('funny','introfade',0,0.8,'linear')
        doTweenZoom('funny3','camGame',1,crochet*0.002,'sineInOut')
    end
    if currentBeat == 256 then
        doFlash(0.3,1,'FFFFFF')
    end
    if currentBeat == 320 then
        doFlash(1,1,'FFFFFF')
        setProperty('health',2)
        for i = 0,3 do
            noteTweenX('4-1-' .. i,i,90+i*110,2,'expoOut')
            noteTweenY('4-2-' .. i,i,120+i*-30,2,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',75)
            setPropertyFromGroup('strumLineNotes',i,'angle',-15)
        end
        for i = 4,7 do
            noteTweenX('4-1-' .. i,i,310+i*110,2,'expoOut')
            noteTweenY('4-2-' .. i,i,30+(i-4)*30,2,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',105)
            setPropertyFromGroup('strumLineNotes',i,'angle',15)
        end
        for i = 0,7 do
            setProperty('strumwhite' .. i .. '.alpha',0.2)
        end
    end
    if currentBeat == 380 then
        for i = 0,3 do
            noteTweenX('4-1-' .. i,i,420+i*110,crochet*0.004,'expoIn')
            noteTweenY('4-2-' .. i,i,80,crochet*0.004,'expoIn')
            noteTweenAlpha('4-3-' .. i,i,0.3,crochet*0.004,'expoOut')
            noteTweenDirection('4-4-' .. i,i,90,crochet*0.004,'expoIn')
        end
        for i = 4,7 do
            noteTweenX('4-1-' .. i,i,-20+i*110,crochet*0.004,'expoIn')
            noteTweenY('4-2-' .. i,i,80,crochet*0.004,'expoIn')
            noteTweenDirection('4-4-' .. i,i,90,crochet*0.004,'expoIn')
        end
    end
    if currentBeat == 480 then
        doFlash(1,1.3,'FFFFFF')
    end
    if currentBeat == 608 then
        doFlash(0.7,3,'FFFFFF')
    end
    if currentBeat == 672 then
        doFlash(1,0.8,'FFFFFF')
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes',i,'alpha',1)
        end
    end
    if currentBeat == 732 then
        makeLuaSprite('filter','',0,0)
        makeLuaSprite('darken','',0,0)
        makeGraphic('filter',3000,3000,'FFFFFF')
        makeGraphic('darken',3000,3000,'000000')
        setObjectCamera('filter','other')
        setObjectCamera('darken','other')
        addLuaSprite('filter',true)
        addLuaSprite('darken',true)
        setProperty('filter.alpha', 0.1)
        setProperty('darken.alpha', 0)
        doTweenColor('filtercolorset','filter','006666',0.001,'linear')
        doTweenAlpha('epic','darken',0.2,crochet*0.004-0.01,'sineInOut')
        setBlendMode('filter', 'subtract')
        setBlendMode('darken', 'shader')
        for i = 0,3 do
            noteTweenX('5-1-' .. i,i,-110,1,'expoOut')
            noteTweenY('5-2-' .. i,i,70,1,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
            setPropertyFromGroup('strumLineNotes',i,'alpha',0)
        end
        for i = 4,7 do
            noteTweenX('5-1-' .. i,i,-20+i*110,1,'expoOut')
            noteTweenY('5-2-' .. i,i,110,1,'expoOut')
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
        end
    end
    if currentBeat >= 736 and currentBeat < 1056 then
        if math.fmod(currentBeat,8) == 0 then
            doTweenAlpha('epic','darken',0,crochet*0.004-0.01,'sineInOut')
        end
        if math.fmod(currentBeat,8) == 4 then
            doTweenAlpha('epic','darken',0.2,crochet*0.004-0.01,'sineInOut')
        end
    end
    if currentBeat >= 736 and currentBeat < 800 then
        if math.fmod(currentBeat,2) == 0 then
        shake = 200
        sinmult = 140
        end
    end
    if currentBeat >= 800 and currentBeat < 864 then
        shake = 200
        if math.fmod(currentBeat,2) == 0 then
            sinmult = -50
        end
        if math.fmod(currentBeat,2) == 1 then
            sinmult = 50
        end
        sinspeed = 0.9
        shakespeed = -0.75
    end
    if currentBeat == 864 then
        doFlash(1,1.3,'000000')
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes',i, 'alpha',1)
            setPropertyFromGroup('strumLineNotes',i,'direction',90+math.fmod(i+1,2)*180)
            setPropertyFromGroup('strumLineNotes',i,'x',420+110*math.fmod(i,4))
            setPropertyFromGroup('strumLineNotes',i,'y',300+(math.fmod(i+1,2)-0.5)*600)
        end
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90+math.fmod(i,2)*180)
            setPropertyFromGroup('strumLineNotes',i,'x',420+110*math.fmod(i,4))
            setPropertyFromGroup('strumLineNotes',i,'y',300+(math.fmod(i,2)-0.5)*600)
        end
	setProperty("healthBar.alpha", 0)
	setProperty("iconP2.alpha", 0)
	setProperty("iconP1.alpha", 0)
	setProperty("timeBar.alpha",0)
	setProperty("timeTxt.alpha",0)
	setProperty("scoreTxt.alpha",0)
    end
    if currentBeat == 924 then
        for i = 0,3 do 
            noteTweenX('oppo1X-' .. i,i,-220,crochet*0.004,'expoOut')
            noteTweenY('oppo1Y-' .. i,i,300,crochet*0.004-0.01,'expoIn')
        end
        for i = 4,7 do 
            noteTweenY('oppo1Y-' .. i,i,300,crochet*0.004-0.01,'expoIn')
        end
    end
    if currentBeat == 928 then
        for i = 0,3 do 
            noteTweenY('oppo2-' .. i,i,06,crochet*0.004-0.01,'expoOut')
        end
        for i = 4,7 do 
            noteTweenY('oppo2-' .. i,i,60,crochet*0.004-0.01,'expoOut')
        end
        setProperty('camGame.zoom',1.4)
        doTweenZoom('oppo3Z','camGame',1,crochet*0.004,'sineOut')
    end
    if currentBeat == 984 then
        doTweenZoom('oppo3Z','camGame',1.7,crochet*0.008,'sineInOut')
    end
    if currentBeat == 992 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            if i < 4 then
            noteTweenX('oppo4X-' .. i,i,90+110*i,crochet*0.0015,'expoOut')
            else
            noteTweenX('oppo4X-' .. i,i,310+110*i,crochet*0.0015,'expoOut')
            end
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
        end
        doTweenZoom('oppo4Z','camGame',1,crochet*0.0015,'expoOut')
    end
    if currentBeat > 992 and currentBeat < 1056 then
        if math.fmod(currentBeat-2,4) == 0 then
            for i = 0,3 do
                setPropertyFromGroup('strumLineNotes',i,'x',90+130*i)
                noteTweenX('oppo5X-' .. i,i,90+110*i,crochet*0.004,'expoOut')
                noteTweenAngle('oppo5A-' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+360,crochet*0.004,'expoOut')
            end
            for i = 4,7 do
                setPropertyFromGroup('strumLineNotes',i,'x',310+90*i)
                noteTweenX('oppo5X-' .. i,i,310+110*i,crochet*0.004,'expoOut')
                noteTweenAngle('oppo5A-' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')-360,crochet*0.004,'expoOut')
            end
            setProperty('camGame.zoom',1.5)
            doTweenZoom('oppo4Z','camGame',1,crochet*0.002,'expoOut')
            sinmult = 40
            sinspeed = 0.95
        end
    end
end

function onUpdatePost() --events but every frame
    hp = getProperty('health')
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(curBpm/60)
    sinmult = sinmult*sinspeed
    shake = shake*shakespeed
	if playeddownscroll then
        playeddownscroll = false
        makeLuaText('fix', "fixed :^)", 600, 330, 300)
        setTextSize('fix', 140)
        setTextColor('fix', 'FFFFFF')
        addLuaText('fix',true)
		loadSong('Seraphic', 'Seraphic', true);
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SIX') then
		loadSong('Hydromania', 'Hydromania', true);
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then 
        setProperty('dis.alpha',0)
	end
    if currentBeat >= 320 and currentBeat < 732 then
        notesLength = getProperty('notes.length')
	    for i1 = 0, notesLength, 1 do
	    	Thisnote = getPropertyFromGroup('notes',i1,'noteData')
	    	Thisnoteorigindir = getPropertyFromGroup('strumLineNotes',Thisnote,'direction')-getPropertyFromGroup('strumLineNotes',Thisnote,'angle')
            setPropertyFromGroup('notes',i1,'angle',Thisnoteorigindir-90)
            setPropertyFromGroup('notes',i1,'scale.x',getPropertyFromGroup('strumLineNotes',Thisnote,'scale.x'))
            setPropertyFromGroup('notes',i1,'scale.y',getPropertyFromGroup('strumLineNotes',Thisnote,'scale.x'))
	    end
    end
    if currentBeat >= 128 and currentBeat < 144 then
        bambiPartDrops(0,50,0,3)
    end
    if currentBeat >= 144 and currentBeat < 192 then
        bambiPartDrops(0,50,0,7)
    end
    if currentBeat >= 256 and currentBeat < 320 then
        bambiPartDrops(60,40,0,7)
    end
    if currentBeat >= 384 and currentBeat < 400 then
        multicornMain((currentBeat-384)*130/16)
    end
    if currentBeat >= 400 and currentBeat < 480 then
        multicornMain(130)
    end
    if currentBeat >= 480 and currentBeat < 608 then
        multicornDrop(70)
    end
    if currentBeat >= 608 and currentBeat < 672 then
        multicornMain(80)
    end
    if currentBeat >= 672 and currentBeat < 732 then
        multicornFinal(1600)
    end
    if currentBeat >= 736 and currentBeat < 800 then
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'x',-100)
            setPropertyFromGroup('strumLineNotes',i,'y',110)
        end
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90+shake*0.25)
            setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110+shake)
            setPropertyFromGroup('strumLineNotes',i,'y',110+math.sin((currentBeat+i/8)*math.pi*4)*sinmult)
            setPropertyFromGroup('strumLineNotes',i,'angle',shake*0.25)
        end
    end
    if currentBeat >= 800 and currentBeat < 864 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110+shake+math.sin(currentBeat*math.pi)*30)
            setPropertyFromGroup('strumLineNotes',i,'y',110)
            setPropertyFromGroup('strumLineNotes',i,'angle',shake*0.33)
        end
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
            Thisnotex = getPropertyFromGroup('notes',i1,'x')
            Thisnotey = getPropertyFromGroup('notes',i1,'y')
            Thisnote = getPropertyFromGroup('notes',i1,'noteData')
            Thisnoteoriginx = getPropertyFromGroup('strumLineNotes',Thisnote,'x')
            Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
            setPropertyFromGroup('notes',i1,'x',Thisnotex+math.sin((Thisnotey-Thisnoteoriginy)*0.002*math.pi*2)*50*((Thisnotey-Thisnoteoriginy)*0.004))
            setPropertyFromGroup('notes',i1,'angle',math.cos((currentBeat+Thisnotey*0.001)*math.pi*-2)*0.3*sinmult)
        end
    end
    if currentBeat >= 864 and currentBeat < 928 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes',i,'angle',(currentBeat*180/16))
        end
    end
    if currentBeat >= 928 and currentBeat < 984 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'angle',currentBeat*180/8)
            setPropertyFromGroup('strumLineNotes',i,'direction',90)
            setPropertyFromGroup('strumLineNotes',i,'x',-20+110*i+math.sin(currentBeat*math.pi/8)*130)
        end
        setProperty('camHUD.angle',math.sin(currentBeat*math.pi/4)*12)
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
            Thisnotex = getPropertyFromGroup('notes',i1,'x')
            Thisnotey = getPropertyFromGroup('notes',i1,'y')
            Thisnote = getPropertyFromGroup('notes',i1,'noteData')
            Thisnoteoriginx = getPropertyFromGroup('strumLineNotes',Thisnote,'x')
            Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
            setPropertyFromGroup('notes',i1,'x',Thisnotex+math.sin(((Thisnotey-Thisnoteoriginy)*0.001+currentBeat)*math.pi)*50*((Thisnotey-Thisnoteoriginy)*0.004))
            setPropertyFromGroup('notes',i1,'angle',math.cos((currentBeat+Thisnotey*0.001)*math.pi*-2)*0.3*sinmult)
        end
    end
    if currentBeat >= 992 and currentBeat < 1056 then
        setProperty('camHUD.angle',math.sin(currentBeat*math.pi)*1)
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes',i,'y',60+math.sin((currentBeat+i/4)*math.pi)*sinmult*2)
        end
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
            Thisnotex = getPropertyFromGroup('notes',i1,'x')
            Thisnotey = getPropertyFromGroup('notes',i1,'y')
            Thisnote = getPropertyFromGroup('notes',i1,'noteData')
            Thisnoteoriginx = getPropertyFromGroup('strumLineNotes',Thisnote,'x')
            Thisnoteoriginy = getPropertyFromGroup('strumLineNotes',Thisnote,'y')
            setPropertyFromGroup('notes',i1,'x',Thisnotex+math.sin((Thisnotey-Thisnoteoriginy)*(0.002*sinmult/10)*math.pi*2)*12*sinmult*((Thisnotey-Thisnoteoriginy)*0.002))
            setPropertyFromGroup('notes',i1,'angle',0)
        end
    end

    for i = 0,7 do
        setProperty('strumwhite' .. i .. '.x',getPropertyFromGroup('strumLineNotes',i,'x')+50)
        setProperty('strumwhite' .. i .. '.y',getPropertyFromGroup('strumLineNotes',i,'y')-1445)
        setProperty('strumwhite' .. i .. '.angle',getPropertyFromGroup('strumLineNotes',i,'direction')-90)
    end
    
    setProperty('health',hp+0.0015)
end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end

function bambiPartDrops(xmult,ymult,istart,iend) --i love sine waves
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = istart,iend do
        setPropertyFromGroup('strumLineNotes',i,'x',200+(i*110)+math.sin((currentBeat+i*0.333)*math.pi*0.25)*math.sin(currentBeat*math.pi/16)*xmult)
        setPropertyFromGroup('strumLineNotes',i,'y',60+math.sin((currentBeat+i*0.333)*math.pi)*math.sin(currentBeat*math.pi/16)*ymult)
        setPropertyFromGroup('strumLineNotes',i,'scale.y',0.7+math.cos((currentBeat+i*0.333)*math.pi)*math.sin(currentBeat*math.pi/16)*ymult/400)
    end
end

function multicornMain(xmult) --i love sine waves: 2
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+i/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'angle',math.sin((currentBeat+i/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'x',420+i*110+math.sin((currentBeat+i/2)*math.pi/8)*xmult)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+(i-4)/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'angle',math.sin((currentBeat+i/2)*math.pi/4)*xmult/8)
        setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110+math.sin((currentBeat+i/2)*math.pi/8)*xmult)
    end
end

function multicornDrop(xmult) --i love sine waves: 3
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+i/2)*math.pi/4)*45)
        setPropertyFromGroup('strumLineNotes',i,'angle',math.sin((currentBeat+i/2)*math.pi/4)*15)
        setPropertyFromGroup('strumLineNotes',i,'x',420+i*110+math.cos((currentBeat+i*2)*math.pi/8)*xmult*2)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat+(i-4)/2)*math.pi/4)*4)
        setPropertyFromGroup('strumLineNotes',i,'angle',0)
        setPropertyFromGroup('strumLineNotes',i,'x',-20+i*110)
    end
end

function multicornFinal(modulo) --i love sine waves: 4
    local currentBeat = (songPos/1000)*(curBpm/60)
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'direction',90+math.sin((currentBeat)*math.pi/4)*30)
        setPropertyFromGroup('strumLineNotes',i,'angle',0)
        setPropertyFromGroup('strumLineNotes',i,'x',math.fmod(currentBeat*300+i*(modulo/8),modulo)-modulo/8)
        setPropertyFromGroup('strumLineNotes',i,'y',80+math.sin((currentBeat+(i*2))*math.pi/8)*60)
    end
end

function opponentNoteHit()
    hp = getProperty('health')
    if hp > 0.5 then
    setProperty('health',hp-0.025)
    end
end
function goodNoteHit()
    hp = getProperty('health')
    setProperty('health',hp+0.05)
end
function noteMiss()
    hp = getProperty('health')
    setProperty('health',hp-0.1)
end

function onGameOver()
    loadSong('Seraphic', 'Seraphic', true);
	return Function_Stop;
end