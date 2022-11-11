--this is so stupid lmao
function onCreate() --setting variables and making sprites

    makeLuaText('dis', "I mUsT bE aCcUrAtE tO tHe FlP!!!!!", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
    for i = 0,7 do
        makeLuaSprite('scalecontrol' .. i,'',0.7,0.7)
        setProperty('scalecontrol' .. i .. '.alpha',0)
        addLuaSprite('scalecontrol' .. i,false)
    end
end
function onBeatHit()
    for i = 0,7 do
        noteTweenX('fart1' .. i,i,math.random(0,1200),crochet*0.001,'linear')
        noteTweenY('fart2' .. i,i,math.random(0,700),crochet*0.001,'linear')
        noteTweenDirection('fart3' .. i,i,math.random(0,720),crochet*0.001,'linear')
        noteTweenAngle('fart4' .. i,i,math.random(0,720),crochet*0.001,'linear')
        doTweenX('fart5' .. i,'scalecontrol' .. i,math.random(10,140)*0.01,crochet*0.001,'linear')
        doTweenX('fart6' .. i,'scalecontrol' .. i,math.random(10,140)*0.01,crochet*0.001,'linear')
    end
end
function onUpdatePost()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'scale.x',getProperty('scalecontrol' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'scale.y',getProperty('scalecontrol' .. i .. '.y'))
    end
    notesLength = getProperty('notes.length')
    for i1 = 0, notesLength, 1 do
        TN = getPropertyFromGroup('notes',i1,'noteData')
        setPropertyFromGroup('notes',i1,'scale.x',getProperty('scalecontrol' .. TN .. '.x'))
        setPropertyFromGroup('notes',i1,'scale.y',getProperty('scalecontrol' .. TN .. '.y'))
        if getPropertyFromGroup('notes',i1,'mustPress') then
            setPropertyFromGroup('notes',i1,'scale.x',getProperty('scalecontrol' .. TN+4 .. '.x'))
            setPropertyFromGroup('notes',i1,'scale.y',getProperty('scalecontrol' .. TN+4 .. '.y'))
        end
    end
end