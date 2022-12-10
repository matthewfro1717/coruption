local windowX1 = 0;
local windowY1 = 0;
local windowX2 = 0;
local windowY2 = 0;
local windowX3 = 0;
local windowY3 = 0;
local shakevar = 0;
local shakespeed = 0.05;
local modchartX1 = 0;
local modchartX2 = 0;
local modchartX3 = 0;
local modchartX4 = 0;
local modchartX5 = 0;
local modchartX6 = 0;
local modchartX7 = 0;
local modchartX8 = 0;
local modchartX9 = 0;
local modchartX10 = 0;
local modchartX11 = 0;
local modchartX12 = 0;
local modchartX13 = 0;
local modchartX14 = 0;
local modchartX15 = 0;
local modchartX16 = 0;
local modchartY1 = 0;
local modchartY2 = 0;
local modchartY3 = 0;
local modchartY4 = 0;
local modchartY5 = 0;
local modchartY6 = 0;
local modchartY7 = 0;
local modchartY8 = 0;
local modchartY9 = 0;
local modchartY10 = 0;
local modchartY11 = 0;
local modchartY12 = 0;
local modchartY13 = 0;
local modchartY14 = 0;
local modchartY15 = 0;
local modchartY16 = 0;
local beatnum = 0;
local windowspeed = 0.03;
local modchartspeed = 0.1
local modchartN1 = 0;
local modchartN2 = 0
local attemptedPause = false
local defaultNotePos = {};

function onStartCountdown()
  setProperty('health', 2)
  end

function onCreate()
    windowX1 = getPropertyFromClass('openfl.Lib', 'application.window.x')+11050
    windowY1 = getPropertyFromClass('openfl.Lib', 'application.window.y')+11000
  windowX2 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10050
  windowY2 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000
  windowX3 = getPropertyFromClass('openfl.Lib', 'application.window.x')+10000
  windowY3 = getPropertyFromClass('openfl.Lib', 'application.window.y')+10000

    makeLuaText('pausestopper', "Hi Youtube! Are they having a reaction? - Exosphere", 600, 350, 175)
    setTextSize('pausestopper', 80)
    setTextColor('pausestopper', 'FFFFFF')
end

function onSongStart()
  for i = 0,7 do 
      x = getPropertyFromGroup('strumLineNotes', i, 'x')

      y = getPropertyFromGroup('strumLineNotes', i, 'y')

      table.insert(defaultNotePos, {x,y})
  end
end


function randomNote()
  for i = 0,3 do 
      setPropertyFromGroup('strumLineNotes', i, 'x', 
      defaultNotePos[i + 1][1] + math.floor(math.random(-150,150)))

      if downscroll == true then 
          ylowest = 50;
          yhighest = -150;
      else 
          ylowest = -150
          yhighest = 150;
      end

      setPropertyFromGroup('strumLineNotes', i, 'y', 
      defaultNotePos[i + 1][2] + math.floor(math.random(ylowest,yhighest)))
  end
end

function onUpdate(elapsed)
  health = getProperty('health')
  if attemptedPause then
      setProperty('health', health-0.01);
  end
  songPos = getSongPosition()
  local currentBeat = (songPos/1000)*(bpm/60)
  local currentStep = math.floor((songPos/1000)*(bpm/15))
  if currentBeat >= 0 and currentBeat <= 14 then
    if math.fmod(math.floor(currentBeat),2) == 0 and beatnum == 0 then
        windowX1 = windowX1 - 100
        windowX2 = windowX2 - 100
        beatnum = 1
    end
    if math.fmod(math.floor(currentBeat),2) == 1 and beatnum == 1 then
        windowX1 = windowX1 + 100
        windowX2 = windowX2 + 100
        beatnum = 0
    end
    windowY1 = windowY2 + 1000 + currentBeat*100 - math.floor(currentBeat)*100
  end
  if math.floor(currentBeat) >= 14 and math.floor(currentBeat) <= 15 then
    windowX1 = windowX1 + 100
    windowX2 = windowX2 + 100
  end
  if math.floor(currentBeat) == 16 then
    windowX1 = windowX3+1000
    windowX2 = windowX3
  end
  if math.floor(currentBeat) >= 80 and math.floor(currentBeat) <= 143 then
    if math.fmod(math.floor(currentStep+64),128) == 4 and beatnum == 0 then
      shakespeed = 0.05
      shakevar = 50
      beatnum = 1
    end
    if math.fmod(math.floor(currentStep+64),128) == 6 and beatnum == 1 then
      shakevar = 50
      beatnum = 2
    end
    if math.fmod(math.floor(currentStep+64),128) == 8 and beatnum == 2 then
      shakevar = 50
      beatnum = 3
    end
    if math.fmod(math.floor(currentStep+64),128) == 10 and beatnum == 3 then
      shakevar = 50
      beatnum = 4
    end
    if math.fmod(math.floor(currentStep+64),128) == 20 and beatnum == 4 then
      shakevar = 50
      beatnum = 5
    end
    if math.fmod(math.floor(currentStep+64),128) == 22 and beatnum == 5 then
      shakevar = 50
      beatnum = 6
    end
    if math.fmod(math.floor(currentStep+64),128) == 36 and beatnum == 6 then
      shakevar = 50
      beatnum = 7
    end
    if math.fmod(math.floor(currentStep+64),128) == 38 and beatnum == 7 then
      shakevar = 50
      beatnum = 8
    end
    if math.fmod(math.floor(currentStep+64),128) == 40 and beatnum == 8 then
      shakevar = 50
      beatnum = 9
    end
    if math.fmod(math.floor(currentStep+64),128) == 42 and beatnum == 9 then
      shakevar = 50
      beatnum = 10
    end
    if math.fmod(math.floor(currentStep+64),128) == 48 and beatnum == 10 then
      shakevar = 250
      beatnum = 0
    end
  end
  if math.floor(currentBeat) >= 144 and math.floor(currentBeat) <= 151 then
    modchartX1 = 200
    modchartX2 = 200
    modchartX3 = 200
    modchartX4 = 200
    modchartX9 = 80
    modchartX10 = 80
    modchartX11 = 80
    modchartX12 = 80
    if math.floor(currentBeat) <= 145 then
      windowX1 = -(windowX1+1000)
      windowX2 = -windowX2
      beatnum = 0
    end
    if math.floor(currentBeat) == 146 and beatnum == 0 then
      windowX1 = windowX3+1000
      windowX2 = windowX3
      windowY1 = windowY1+50
      beatnum = 1
    end
    if math.floor(currentBeat) == 147 and beatnum <= 2 then
      windowY1 = windowY1+100
      windowY2 = windowY2+100
      beatnum = 2
    end
    if  math.floor(currentBeat) == 148 and beatnum <= 3 then
      windowY1 = windowY3+1000
      windowY2 = windowY3
      windowX1 = -(windowX1+1000)
      windowX2 = -windowX2
      beatnum = 3
    end
    if  math.floor(currentBeat) == 149 and beatnum == 3 then
      windowX1 = windowX3+1000
      windowX2 = windowX3
      beatnum = 0
    end
  end 
  if math.floor(currentBeat) >= 152 and math.floor(currentBeat) <= 183 then
    if math.fmod(currentStep,8) == 0 and beatnum == 0 then
      modchartN1 = math.random(-1000,1000)
      modchartN2 = math.random(-1000,1000)
      modchartspeed = 0.3
      modchartX5 = 0 + modchartN1/100 + math.random(-8,8)
      modchartX6 = 0 + modchartN1/100 + math.random(-8,8)
      modchartX7 = 0 + modchartN1/100 + math.random(-8,8)
      modchartX8 = 0 + modchartN1/100 + math.random(-8,8)
      modchartY5 = 0 + modchartN2/100 + math.random(0,30)
      modchartY6 = 0 + modchartN2/100 + math.random(0,30)
      modchartY7 = 0 + modchartN2/100 + math.random(0,30)
      modchartY8 = 0 + modchartN2/100 + math.random(0,30)
      beatnum = 1
    end
    if math.fmod(currentStep,8) == 4 and beatnum == 1 then
      modchartN1 = math.random(-1000,1000)
      modchartN2 = math.random(-1000,1000)
      modchartX5 = 0 + modchartN1/100 + math.random(-8,8)
      modchartX6 = 0 + modchartN1/100 + math.random(-8,8)
      modchartX7 = 0 + modchartN1/100 + math.random(-8,8)
      modchartX8 = 0 + modchartN1/100 + math.random(-8,8)
      modchartY5 = 0 + modchartN2/100 + math.random(0,30)
      modchartY6 = 0 + modchartN2/100 + math.random(0,30)
      modchartY7 = 0 + modchartN2/100 + math.random(0,30)
      modchartY8 = 0 + modchartN2/100 + math.random(0,30)
      beatnum = 0
    end
  end
  if math.floor(currentBeat) >= 184 and math.floor(currentBeat) <= 215 then
    if math.fmod(currentStep,8) == 0 and beatnum == 0 then
      shakespeed = 0.06
      shakevar = 100
      modchartN1 = math.random(-3000,3000)
      modchartN2 = math.random(0,3000)
      modchartspeed = 0.3
      modchartX5 = -32 + modchartN1/100 + math.random(-8,8)
      modchartX6 = -32 + modchartN1/100 + math.random(-8,8)
      modchartX7 = -32 + modchartN1/100 + math.random(-8,8)
      modchartX8 = -32 + modchartN1/100 + math.random(-8,8)
      modchartY5 = 0 + modchartN2/100 + math.random(0,30)
      modchartY6 = 0 + modchartN2/100 + math.random(0,30)
      modchartY7 = 0 + modchartN2/100 + math.random(0,30)
      modchartY8 = 0 + modchartN2/100 + math.random(0,30)
      beatnum = 1
    end
    if math.fmod(currentStep,8) == 4 and beatnum == 1 then
      shakevar = 100
      modchartN1 = math.random(-3000,3000)
      modchartN2 = math.random(0,3000)
      modchartX5 = -64 + modchartN1/100 + math.random(-15,15)
      modchartX6 = -64 + modchartN1/100 + math.random(-15,15)
      modchartX7 = -64 + modchartN1/100 + math.random(-15,15)
      modchartX8 = -64 + modchartN1/100 + math.random(-15,15)
      modchartX13 = -200
      modchartX14 = -200
      modchartX15 = -200
      modchartX16 = -200
      modchartY5 = 0 + modchartN2/100 + math.random(0,50)
      modchartY6 = 0 + modchartN2/100 + math.random(0,50)
      modchartY7 = 0 + modchartN2/100 + math.random(0,50)
      modchartY8 = 0 + modchartN2/100 + math.random(0,50)
      beatnum = 0
    end
  end
  if math.floor(currentBeat) == 216 then
    modchartspeed = 0.2
    modchartX5 = 0
    modchartX6 = 0
    modchartX7 = 0
    modchartX8 = 0
    modchartX13 = 0
    modchartX14 = 0
    modchartX15 = 0
    modchartX16 = 0
    modchartY5 = 0
    modchartY6 = 0
    modchartY7 = 0
    modchartY8 = 0
    longzoom = true
  end
  if math.floor(currentBeat) >= 280 and math.floor(currentBeat) <= 311 then
    if math.floor(currentBeat) == 306 then
      beatnum = 1
    end
    if math.floor(currentStep) == 1232 and beatnum == 1 then
      beatnum = 2
    end
    if math.floor(currentStep) == 1234 and beatnum == 2 then
      beatnum = 3
    end
    if math.floor(currentStep) == 1236 and beatnum == 3 then
      beatnum = 4
    end
    if math.floor(currentStep) == 1238 and beatnum == 4 then
      beatnum = 5
    end
    if math.floor(currentStep) == 1240 and beatnum == 5 then
      beatnum = 6
    end
    if math.floor(currentStep) == 1241 and beatnum == 6 then
      beatnum = 7
    end
    if math.floor(currentStep) == 1242 and beatnum == 7 then
      beatnum = 8
    end
    if math.floor(currentStep) == 1243 and beatnum == 8 then
      beatnum = 9
    end
    if math.floor(currentStep) == 1244 and beatnum == 9 then
      beatnum = 10
    end
    if math.floor(currentStep) == 1245 and beatnum == 10 then
      beatnum = 11
    end
  end
    shakevar = shakevar +((0-shakevar)*shakespeed)
  windowX1 = windowX1+((windowX2-windowX1+1000)*windowspeed)
  windowY1 = windowY1+((windowY2-windowY1+1000)*windowspeed)
  modchartX1 = modchartX1+(modchartX5-modchartX1*modchartspeed)
  modchartX2 = modchartX2+(modchartX6-modchartX2*modchartspeed)
  modchartX3 = modchartX3+(modchartX7-modchartX3*modchartspeed)
  modchartX4 = modchartX4+(modchartX8-modchartX4*modchartspeed)
  modchartY1 = modchartY1+(modchartY5-modchartY1*modchartspeed)
  modchartY2 = modchartY2+(modchartY6-modchartY2*modchartspeed)
  modchartY3 = modchartY3+(modchartY7-modchartY3*modchartspeed)
  modchartY4 = modchartY4+(modchartY8-modchartY4*modchartspeed)
  modchartX9 = modchartX9+(modchartX13-modchartX9*modchartspeed)
  modchartX10 = modchartX10+(modchartX14-modchartX10*modchartspeed)
  modchartX11 = modchartX11+(modchartX15-modchartX11*modchartspeed)
  modchartX12 = modchartX12+(modchartX16-modchartX12*modchartspeed)
  modchartY9 = modchartY9+(modchartY13-modchartY9*modchartspeed)
  modchartY10 = modchartY10+(modchartY14-modchartY10*modchartspeed)
  modchartY11 = modchartY11+(modchartY15-modchartY11*modchartspeed)
  modchartY12 = modchartY12+(modchartY16-modchartY12*modchartspeed)
  noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 + modchartY9, 0.001)
  noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 + modchartY10, 0.001)
  noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 + modchartY11, 0.001)
  noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 + modchartY12, 0.001)
  noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + modchartY1, 0.001)
  noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + modchartY2, 0.001)
  noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + modchartY3, 0.001)
  noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + modchartY4, 0.001)
  noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 + modchartX9, 0.001)
  noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 + modchartX10, 0.001)
  noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 + modchartX11, 0.001)
  noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 + modchartX12, 0.001)
  noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + modchartX1, 0.001)
  noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + modchartX2, 0.001)
  noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + modchartX3, 0.001)
  noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + modchartX4, 0.001)
  setPropertyFromClass('openfl.Lib','application.window.x',math.fmod(windowX1,2000) - 1000 + math.random((shakevar*-1),shakevar))
  setPropertyFromClass('openfl.Lib','application.window.y',math.fmod(windowY1,2000) - 1000 + math.random((shakevar*-1),shakevar))
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
  if piss2 == 0 then
    randomNote()
  triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
  elseif piss2 == 1 then
    randomNote()
      triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');
  elseif piss2 == 2 then
    randomNote()
      triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01');
  elseif piss2 == 3 then
    randomNote()
      triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
          triggerEvent('Add Camera Zoom', '0.01, 0.01', '0.01, 0.01'); 
  end
  if mustHitSection == false then
    randomNote()
      health = getProperty('health')
      if getProperty('health') > 0.1 then
          setProperty('health', health- 0.012);
      end
  end
end

function goodNoteHit()
  hp = getProperty('health')
  setProperty('health',hp+0.02)
end

function onPause()
  addLuaText('pausestopper')
  attemptedPause = true
return Function_Stop;
end