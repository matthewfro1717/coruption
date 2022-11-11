local angleshit = 2;
local anglevar = 2;
local anglevar2 = 3.25;
local theepic = true;


function onBeatHit()
    if curBeat > 0 then
        setProperty('dad.y',getProperty('dad.y')+10)
        doTweenY('bounce1','dad',getProperty('dad.y')-10,crochet*0.001,'sineOut')
        setProperty('gf.y',getProperty('gf.y')+10)
        doTweenY('bounce3','gf',getProperty('gf.y')-10,crochet*0.001,'sineOut')
    end
    
    if curBeat > 116 and curBeat < 180 then
        for i = 4,7 do
            noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
        end
        triggerEvent('Add Camera Zoom', '0.05', '0.025');
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
    end
    
    if curBeat > 180 and curBeat > 308 then     
        triggerEvent('Add Camera Zoom', '0.05', '0.025');  
        for i = 4,7 do
            noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+90,crochet*0.001-0.01,'expoOut')
        end
    end

    if curBeat == 116 then
        doFlash(0.8,1.5,'FFFFFF')
    end
    if curBeat == 308 then
        doFlash(0.8,1.5,'FFFFFF')
    end
    if curBeat == 372 then
        noteTweenAlpha('itsnothere',0, 0, 0.001, 'sineOut')
        noteTweenAlpha('itsnothere1',1, 0, 0.001, 'sineOut')
        noteTweenAlpha('itsnothere2',2, 0, 0.001, 'sineOut')
        noteTweenAlpha('itsnothere3',3, 0, 0.001, 'sineOut')
        doFlash(1,1.5,'FFFFFF')
    end
    
    if curBeat >= 372 then
        setProperty('boyfriend.y',getProperty('boyfriend.y')+10)
        doTweenY('bounce2','boyfriend',getProperty('boyfriend.y')-10,crochet*0.001,'sineOut')
        triggerEvent('Add Camera Zoom', '0.05', '0.025');  
        for i = 4,7 do
            noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+15,crochet*0.001-0.01,'expoOut')
        end
    end

    if curStep == 2267 then
        setProperty("healthBar.alpha",0)

    end
    if curStep == 2269 then
        setProperty("iconP1.alpha",0)
        setProperty("iconP2.alpha",0)
    end
    if curStep == 2271 then
        noteTweenAlpha('itsnothere4',4, 0, 0.001, 'sineOut')
        noteTweenAlpha('itsnothere5',5, 0, 0.001, 'sineOut')
        noteTweenAlpha('itsnothere6',6, 0, 0.001, 'sineOut')
        noteTweenAlpha('itsnothere7',7, 0, 0.001, 'sineOut')
    end
    
end

function onUpdate()
    setProperty("timeBar.alpha",0)
    setProperty("timeTxt.alpha",0)
end

  

	

function onCreate()
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
    makeLuaText('dis', "Original Song by Sandi334_ (Dead Hope) | Cover / Remix by Emperor Yami", 600, 680, 0)
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

