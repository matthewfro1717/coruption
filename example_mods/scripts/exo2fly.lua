function onUpdate(elapsed)
	if dadName == 'exosphereangry' then --replace the name for your character name
        if curStep >= 0 then
            songPos = getSongPosition()
            local currentBeat = (songPos/1000)*(bpm/200)
            doTweenY(dadTweenY, 'dad', -300-130*math.sin((currentBeat*0.25)*math.pi),0.001)
          end
	end
  if dadName == 'exosphereguitar' then --replace the name for your character name
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/200)
        doTweenY(dadTweenY, 'dad', -300-130*math.sin((currentBeat*0.25)*math.pi),0.001)
      end
end
if dadName == 'exospheremad' then --replace the name for your character name
  if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
      doTweenY(dadTweenY, 'dad', -300-130*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
end

end