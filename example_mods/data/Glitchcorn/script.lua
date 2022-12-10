
local beatnum = 0;
local angleshit = 1;
local anglevar = 1;
local longzoom = true

local allowCountdown = false
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
  setProperty("dad.scale.x", 0.6)
  setProperty("dad.scale.y", 0.6)
  setProperty("boyfriend.scale.x", 0.6)
  setProperty("boyfriend.scale.y", 0.6)
  setProperty('timeBar.color', getColorFromHex('505050'))
  setProperty('timeBarBG.color', getColorFromHex('505050'))

	setProperty("gf.alpha", 0)
end


function onUpdate(elapsed)

  songPos = getSongPosition()
  local currentBeat = (songPos/1000)*(bpm/60)
  local currentStep = math.floor((songPos/1000)*(bpm/15))
  if math.floor(currentBeat) >= 80 and math.floor(currentBeat) <= 143 then
    if math.fmod(math.floor(currentStep+64),128) == 4 and beatnum == 0 then
      doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
    end
    if math.fmod(math.floor(currentStep+64),128) == 6 and beatnum == 1 then
      doTweenColor("colorBR", "dad", "0000FF", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "0000FF", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
      setProperty('timeBar.color', getColorFromHex('00ff00'))
      setProperty('timeBarBG.color', getColorFromHex('00ff00'))
      beatnum = 2
    end
    if math.fmod(math.floor(currentStep+64),128) == 8 and beatnum == 2 then
      doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.7, 0.13, 'sineOut')
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 3
    end
    if math.fmod(math.floor(currentStep+64),128) == 10 and beatnum == 3 then
      doTweenColor("colorBR", "dad", "0000FF", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "0000FF", 0.001, "sineInOut")
      doTweenColor("colorBR", "dad", "FFFFFF", 0.5, "sineInOut")
      doTweenColor("coloUH", "background", "FFFFFF", 0.5, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.9, 0.13, 'sineOut')
      setProperty('timeBar.color', getColorFromHex('505050'))
      setProperty('timeBarBG.color', getColorFromHex('505050'))
      beatnum = 4
    end
    if math.fmod(math.floor(currentStep+64),128) == 20 and beatnum == 4 then
      doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.4, 0.13, 'sineOut')
      beatnum = 5
    end
    if math.fmod(math.floor(currentStep+64),128) == 22 and beatnum == 5 then
      doTweenColor("colorBR", "dad", "0000FF", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "0000FF", 0.001, "sineInOut")
      doTweenColor("colorBR", "dad", "FFFFFF", 0.5, "sineInOut")
      doTweenColor("coloUH", "background", "FFFFFF", 0.5, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.8, 0.13, 'sineOut')
      setProperty('timeBar.color', getColorFromHex('505050'))
      setProperty('timeBarBG.color', getColorFromHex('505050'))
      beatnum = 6
    end
    if math.fmod(math.floor(currentStep+64),128) == 36 and beatnum == 6 then
      doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.3, 0.13, 'sineOut')
      beatnum = 7
    end
    if math.fmod(math.floor(currentStep+64),128) == 38 and beatnum == 7 then
      doTweenColor("colorBR", "dad", "0000FF", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "0000FF", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.5, 0.13, 'sineOut')
      beatnum = 8
    end
    if math.fmod(math.floor(currentStep+64),128) == 40 and beatnum == 8 then
      doTweenColor("colorBR", "dad", "FF0000", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "FF0000", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.7, 0.13, 'sineOut')
      beatnum = 9
    end
    if math.fmod(math.floor(currentStep+64),128) == 42 and beatnum == 9 then
      doTweenColor("colorBR", "dad", "0000FF", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "0000FF", 0.001, "sineInOut")
      doTweenZoom('OhSHIT', 'camGame', 1.9, 0.13, 'sineOut')
      beatnum = 10
    end
    if math.fmod(math.floor(currentStep+64),128) == 48 and beatnum == 10 then
      doTweenColor("colorBR", "dad", "000000", 0.001, "sineInOut")
      doTweenColor("coloUH", "background", "000000", 0.001, "sineInOut")
      doTweenColor("colorBR", "dad", "FFFFFF", 1, "sineInOut")
      doTweenColor("coloUH", "background", "FFFFFF", 1, "sineInOut")
      setProperty('timeBar.color', getColorFromHex('505050'))
      setProperty('timeBarBG.color', getColorFromHex('505050'))
      beatnum = 0
    end
  end
  if math.floor(currentBeat) >= 144 and math.floor(currentBeat) <= 151 then
    if longzoom then
      doTweenZoom('OhSHIT', 'camGame', 1.9, 2.6, 'sineInOut')
      longzoom = false
    end
    if math.floor(currentBeat) <= 145 then
      beatnum = 0
    end
    if math.floor(currentBeat) == 146 and beatnum == 0 then
      beatnum = 1
    end
    if math.floor(currentBeat) == 147 and beatnum <= 2 then
      beatnum = 2
    end
    if  math.floor(currentBeat) == 148 and beatnum <= 3 then
      beatnum = 3
    end
    if  math.floor(currentBeat) == 149 and beatnum == 3 then
      beatnum = 0
    end
  end 
  if math.floor(currentBeat) >= 152 and math.floor(currentBeat) <= 183 then
    if math.fmod(currentStep,8) == 0 and beatnum == 0 then
      beatnum = 1
    end
    if math.fmod(currentStep,8) == 4 and beatnum == 1 then
      beatnum = 0
    end
  end
  if math.floor(currentBeat) >= 184 and math.floor(currentBeat) <= 215 then
    if math.fmod(currentStep,8) == 0 and beatnum == 0 then
      beatnum = 1
    end
    if math.fmod(currentStep,8) == 4 and beatnum == 1 then
      beatnum = 0
    end
  end
  if math.floor(currentBeat) == 216 then
    longzoom = true
  end
  if math.floor(currentBeat) >= 280 and math.floor(currentBeat) <= 311 then
    if longzoom then
      doTweenZoom('OhSHIT', 'camGame', 1.9, 8.8, 'sineInOut')
      doTweenColor("colorBR", "dad", "008800", 1, "sineInOut")
      doTweenColor("coloUH", "background", "008800", 1, "sineInOut")
      setProperty('timeBar.color', getColorFromHex('008900'))
      setProperty('timeBarBG.color', getColorFromHex('008900'))
      longzoom = false
    end
    if math.floor(currentBeat) == 306 then
      doTweenColor("colorBR", "dad", "FF1111", 0.2, "sineOut")
      doTweenColor("coloUH", "background", "FF1111", 0.2, "sineOut")
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 1
    end
    if math.floor(currentStep) == 1232 and beatnum == 1 then
      doTweenColor("colorBR", "dad", "11FF11", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "11FF11", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('008900'))
      setProperty('timeBarBG.color', getColorFromHex('008900'))
      beatnum = 2
    end
    if math.floor(currentStep) == 1234 and beatnum == 2 then
      doTweenColor("colorBR", "dad", "FF1111", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "FF1111", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 3
    end
    if math.floor(currentStep) == 1236 and beatnum == 3 then
      doTweenColor("colorBR", "dad", "11FF11", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "11FF11", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('008900'))
      setProperty('timeBarBG.color', getColorFromHex('008900'))
      beatnum = 4
    end
    if math.floor(currentStep) == 1238 and beatnum == 4 then
      doTweenColor("colorBR", "dad", "FF1111", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "FF1111", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 5
    end
    if math.floor(currentStep) == 1240 and beatnum == 5 then
      doTweenColor("colorBR", "dad", "11FF11", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "11FF11", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('008900'))
      setProperty('timeBarBG.color', getColorFromHex('008900'))
      beatnum = 6
    end
    if math.floor(currentStep) == 1241 and beatnum == 6 then
      doTweenColor("colorBR", "dad", "FF1111", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "FF1111", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 7
    end
    if math.floor(currentStep) == 1242 and beatnum == 7 then
      doTweenColor("colorBR", "dad", "11FF11", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "11FF11", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('008900'))
      setProperty('timeBarBG.color', getColorFromHex('008900'))
      beatnum = 8
    end
    if math.floor(currentStep) == 1243 and beatnum == 8 then
      doTweenColor("colorBR", "dad", "FF1111", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "FF1111", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 9
    end
    if math.floor(currentStep) == 1244 and beatnum == 9 then
      doTweenColor("colorBR", "dad", "11FF11", 0.001, "sineOut")
      doTweenColor("coloUH", "background", "11FF11", 0.001, "sineOut")
      setProperty('timeBar.color', getColorFromHex('008900'))
      setProperty('timeBarBG.color', getColorFromHex('008900'))
      beatnum = 10
    end
    if math.floor(currentStep) == 1245 and beatnum == 10 then
      doTweenColor("colorBR", "dad", "FF1111", 0.3, "sineOut")
      doTweenColor("coloUH", "background", "FF1111", 0.3, "sineOut")
      setProperty('timeBar.color', getColorFromHex('850101'))
      setProperty('timeBarBG.color', getColorFromHex('850101'))
      beatnum = 11
    end
  end
end


function onBeatHit()

  if curBeat > 0 then
    if curBeat % 2 == 0 then
        angleshit = anglevar;
    else
        angleshit = -anglevar;
    end
    setProperty('camHUD.angle',angleshit*3)
    setProperty('camGame.angle',angleshit*3)
    doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
    doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
    doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
    doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    triggerEvent('Add Camera Zoom', '0.04, 0.04', '0.04, 0.04');

  end

  local currentBeat = (songPos/1000)*(bpm/60)
  if math.floor(currentBeat) == 1 then
  doTweenZoom('OhSHIT', 'camGame', 1.2, 0.8, 'sineInOut')
  doTweenColor("colorBR", "dad", "FFFFFF", 1, "sineInOut")
  doTweenColor("coloUH", "background", "FFFFFF", 1, "sineInOut")
  end
end