
local s1 = 1
local s2 = 1
local flip = 1

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

function onCreate()
    makeLuaSprite('offsettween','',0,0)
    setProperty('offsettween.alpha',0.25)
    makeLuaSprite('offsettween2','',0,0)
    makeLuaSprite('epicflash','',0,0)
    makeGraphic('epicflash',3000,3000,'FFFFFF')
    setObjectCamera('epicflash','other')
    addLuaSprite('epicflash',true)
    setProperty('epicflash.alpha', 0)
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
    strumx1 = 240
    strumx2 = 900
    strumy = 60
    mult = 1
    if downscroll then
        strumy = 550
        mult = -1
    end
    for i = 0,7 do
        makeLuaSprite('notes' .. i,'',0,0)
    end
    for i = 4,7 do
        setProperty('notes' .. i .. '.x',-330)
        setProperty('notes' .. i .. '.y',900)
        doTweenY('notes1' .. i,'notes' .. i,0,crochet*0.004,'backOut')
    end
end
function onSongStart()
    flip = -flip
    setProperty('offsettween.y',flip*30)
    setProperty('camGame.zoom',1.02)
    doTweenZoom('zoom1','camGame',1,crochet*0.001,'sineOut')
    doTweenY('notes2','offsettween',0,crochet*0.001,'sineOut')
    setProperty('offsettween.angle',40)
end
function onStepHit()
    floorStep = math.floor(currentStep)
    if floorStep < 64 then
        for i = 0,3 do
            if floorStep % 8 == i then
            setProperty('offsettween.angle',(4-i)*10)
            end
        end
        for i = 4,7 do
            if floorStep % 8 == i then
            setProperty('offsettween.angle',(8-i)*-10)
            end
        end
        if floorStep % 8 == 0 then
            setProperty('offsettween.y',-30)
            setProperty('camGame.zoom',1.02)
            doTweenZoom('zoom1','camGame',1,crochet*0.001,'sineOut')
            doTweenY('notes2','offsettween',0,crochet*0.001,'sineOut')
        end
        if floorStep % 8 == 4 then
            setProperty('offsettween.y',30)
            setProperty('camGame.zoom',1.02)
            doTweenZoom('zoom1','camGame',1,crochet*0.001,'sineOut')
            doTweenY('notes2','offsettween',0,crochet*0.001,'sineOut')
        end
    end
    if (floorStep >= 64 and floorStep < 448) or (floorStep >= 512 and floorStep < 832) then
        if floorStep % 8 == 0 then
            setProperty('offsettween.x',-80)
            doTweenX('p1','offsettween',0,stepCrochet*0.0018,'backIn')
        end
        if floorStep % 8 == 2 then
            setProperty('offsettween.y',50)
            doTweenY('p2','offsettween',0,stepCrochet*0.0038,'expoOut')
        end
        if floorStep % 8 == 5 then
            setProperty('offsettween.x',80)
            doTweenX('p3','offsettween',0,stepCrochet*0.0008,'linear')
        end
        if floorStep % 8 == 6 then
            setProperty('offsettween.y',-50)
            doTweenY('p4','offsettween',0,stepCrochet*0.0018,'expoOut')
        end
    end
    if floorStep >= 448 and floorStep < 504 then
        setProperty('offsettween.alpha',0.1)
        if floorStep % 4 == 0 then
            for i = 4,7 do
                setProperty('notes' .. i .. '.y',-110)
                doTweenY('epic' .. i,'notes' .. i,110,crochet*0.001,'linear')
            end
            setProperty('offsettween.x',40)
            doTweenX('bruh','offsettween',0,crochet*0.001,'sineOut')
        end
        setProperty('offsettween.y',getProperty('offsettween.y')+0.25)
    end
    if floorStep == 504 then
        doTweenAlpha('alph','offsettween',0.25,crochet*0.002,'sineOut')
            for i = 4,7 do
                doTweenY('epic' .. i,'notes' .. i,0,crochet*0.002,'sineOut')
            end
            setProperty('offsettween.x',90)
            doTweenX('bruh1','offsettween',0,crochet*0.002,'sineOut')
            doTweenY('bruh2','offsettween',12,crochet*0.002,'sineOut')
    end
end
function onUpdatePost()
    setProperty('introSoundsSuffix', '-bambi')
    setProperty('camHUD.zoom',0.8)
    setProperty('timeBar.alpha',0)
    setProperty('timeTxt.alpha',0)
    setProperty('healthBar.alpha',0)
    setProperty('iconP1.alpha',0)
    setProperty('iconP2.alpha',0)
    setProperty('scoreTxt.alpha',0)
    setProperty('boyfriend.scale.x',0.6)
    setProperty('boyfriend.scale.y',0.6)
    setProperty('dad.scale.x',0.6)
    setProperty('dad.scale.y',0.6)
    songPos = getSongPosition()
    currentStep = (songPos/1000)*(curBpm/15)
    offset1 = getProperty('offsettween.x')
    offset2 = getProperty('offsettween.y')
    offset3 = getProperty('offsettween.angle')
    speed = getProperty('offsettween.alpha')
    triggerEvent('Change Scroll Speed',speed, 0.001)
    s1 = -s1
    if s1 == 1 then
        s2 = -s2
    end
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'x',strumx1+(i-1.5)*110+getProperty('notes' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'y',strumy+getProperty('notes' .. i .. '.y')*mult)
        setPropertyFromGroup('strumLineNotes',i,'alpha',0)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'x',strumx2+(i-5.5)*110+getProperty('notes' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'y',strumy+getProperty('notes' .. i .. '.y')*mult)
    end
    if currentStep > 0 and currentStep < 64 then
        for i = 4,7 do
            setProperty('notes' .. i .. '.x',-330+math.sin((currentStep/4)*math.pi)*30)
            setProperty('notes' .. i .. '.y',math.sin((i/1.5+currentStep/16)*math.pi)*offset3)
            setPropertyFromGroup('strumLineNotes',i,'angle',offset3*0.5)

        end
    end
    if (currentStep >= 64 and currentStep < 448) or (currentStep >= 512 and currentStep < 832) then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'angle',0)
            setProperty('notes' .. i .. '.x',-330+offset2)
            setProperty('notes' .. i .. '.y',0+math.sin((i/3+currentStep/13)*math.pi)*offset1)
        end
    end
    if currentStep >= 448 and currentStep < 512 then
        for i = 4,7 do
            setProperty('notes' .. i .. '.x',-330+math.sin((i/2+currentStep/-16+offset2)*math.pi)*offset1)
        end
    end
end