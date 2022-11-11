function onUpdate(elapsed)
if dadName == 'cheatingbambi' then
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/300)
        doTweenY(dadTweenY, 'dad', -300-130*math.sin((currentBeat*0.25)*math.pi),0.001)
      end
    end
end