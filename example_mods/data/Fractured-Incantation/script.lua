
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
end

function onUpdatePost(elapsed)
    setProperty("timeTxt.alpha",0)
    setProperty("timeBar.alpha",0)
end

function onBeatHit()
    if curBeat > 160 and curBeat < 288 then
        triggerEvent('Add Camera Zoom', '0.03', '0.03');
        triggerEvent('Screen Shake', '0.05, 0.01', '0.05, 0.005');
        triggerEvent('Screen Shake', '0.05, 0.005', '0.05, 0.005');
    end

    if curBeat > 452 and curBeat < 576 then
        triggerEvent('Add Camera Zoom', '0.03', '0.03');
        triggerEvent('Screen Shake', '0.05, 0.01', '0.05, 0.005');
        triggerEvent('Screen Shake', '0.05, 0.005', '0.05, 0.005');
    end
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.038)
        end
    end
end
      
