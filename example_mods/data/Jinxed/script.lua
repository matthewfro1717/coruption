local angleshit = 0;
local anglevar = 0;
local theepic = true;


function onBeatHit()
    if curBeat == 248 then
        doFlash(0.8,1.5,'FFB6C1')
        setProperty('health', 0.01)
        setProperty("boyfriend.alpha",0)
        makeLuaText('dis2', "You've been Cursed (Fight until the Curse is Broken! [do not fuck up])", 600, 350, 300)
        doTweenAlpha('disbye2','dis2',0,4,'linear')
        setTextSize('dis2', 40)
        setTextColor('dis2', 'FFB6C1')            
        addLuaText('dis2',true)
 
    end
    if curBeat > 248 and curBeat < 312 then
        triggerEvent('Add Camera Zoom', '0.05', '0.025');   
        setProperty('health', 0.01) 
    end

    if curBeat == 312 then
        doFlash(0.8,1.5,'FFFFFF')
        setProperty('health', 0.5)
        setProperty("boyfriend.alpha",1)
        makeLuaText('dis4', "Curse Broken", 600, 350, 300)
        doTweenAlpha('disbye4','dis4',0,1,'linear')
        setTextSize('dis4', 60)
        setTextColor('dis4', 'FFFFFF')            
        addLuaText('dis4',true)
        playSound('Shattered', 0.6);
    end

    if curBeat == 568 then
        setProperty("boyfriend.alpha",0)
        doFlash(0.8,1.5,'FFB6C1')
        setProperty('health', 0.01)
        setProperty("boyfriend.alpha",0)
        makeLuaText('dis3', "You've been Cursed (Final Stretch! [do not fuck up])", 600, 350, 300)
        doTweenAlpha('disbye3','dis3',0,2,'linear')
        setTextSize('dis3', 60)
        setTextColor('dis3', 'FFB6C1')            
        addLuaText('dis3',true)
    end

    if curBeat > 248 and curBeat < 312 then
        triggerEvent('Add Camera Zoom', '0.05', '0.025');   
        setProperty('health', 0.01) 
    end

    if curBeat > 568 and curBeat < 632 then
        triggerEvent('Add Camera Zoom', '0.05', '0.025');   
        setProperty('health', 0.01) 
    end
    if curBeat == 632 then
        doFlash(0.8,1.5,'FFFFFF')
        setProperty('health', 0.5)
        makeLuaText('dis5', "Curse Broken", 600, 350, 300)
        doTweenAlpha('disbye5','dis5',0,1,'linear')
        setTextSize('dis5', 60)
        setTextColor('dis5', 'FFFFFF')            
        addLuaText('dis5',true)
        playSound('Shattered', 0.6);
    end
end

function onUpdate()
    noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
    noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
    setProperty("timeBar.alpha",0)
    setProperty("timeTxt.alpha",0)

end

function onCreate()
    setProperty('health', 0.5)
    setProperty('skipCountdown',true)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
    setObjectCamera('epicflash','other')
    makeLuaSprite('introfade','',0,0)
    makeGraphic('introfade',3000,3000,'000000')
    setObjectCamera('introfade','other')
    addLuaSprite('introfade',true)
    doTweenAlpha('introfade1','introfade',0,2,'linear')
    makeLuaText('dis', "Original Song by Matt$ (Markov) | Cover by Vtolligunt", 600, 680, 0)
    doTweenAlpha('disbye','dis',0,8,'linear')
    setTextSize('dis', 20)
    setTextColor('dis', 'FFFFFF')
    addLuaText('dis',true)
end

function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end



