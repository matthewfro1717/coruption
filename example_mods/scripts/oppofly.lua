function onUpdate(elapsed)
	if dadName == 'oppositionexpunged' then --replace the name for your character name
        if curStep >= 0 then
            songPos = getSongPosition()
            local currentBeat = (songPos/1000)*(bpm/200)
            doTweenY(dadTweenY, 'dad', 100-130*math.sin((currentBeat*0.25)*math.pi),0.001)
          end
	end
end