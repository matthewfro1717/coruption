function onUpdate(elapsed)
	if dadName == 'epitome' then --replace the name for your character name
        if curStep >= 0 then
            songPos = getSongPosition()
          local currentBeat = (songPos/2000)*(bpm/90)
          setProperty('dad.angle',0+currentBeat*10)
        end
	end
end