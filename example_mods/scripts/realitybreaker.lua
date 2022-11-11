function onUpdate()
    if dadName == 'realitybroke' then --replace the name for your character name
        setProperty("gf.alpha", 0)
        setProperty("boyfriend.scale.x", 0.6)
        setProperty("boyfriend.scale.y", 0.6)
        setProperty("dad.scale.x", 0.6)
        setProperty("dad.x", -100)
        setProperty("dad.scale.y", 0.6)

        songPos = getSongPosition()
        local currentBeat = (songPos / 1000) * (bpm / 60)
        setProperty('camHUD.angle', math.sin(currentBeat / 4) * 2)
        setProperty("dad.y", -180 + (math.sin(currentBeat / 4) * 50))
    end
end
