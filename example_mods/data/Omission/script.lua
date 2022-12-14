function onUpdate()
	setProperty('timeBar.color', getColorFromHex('505050'))
    setProperty('timeBarBG.color', getColorFromHex('505050'))
end

function onBeatHit()
    if curBeat >= 0 then
        doTweenColor("colorDaddy1", "dad", "000000", 0.001, "linear")
        doTweenColor("coloBG1", "background", "000000", 0.001, "linear")
        doTweenColor("coloBF1", "boyfriend", "000000", 0.001, "linear")
    end

    if curBeat >= 1 then
        doTweenColor("colorDaddy3", "dad", "FFFFFF", 0.001, "linear")
        doTweenColor("coloBG3", "background", "FFFFFF", 0.001, "linear")
        doTweenColor("coloBF3", "boyfriend", "FFFFFF", 0.001, "linear")
    end

    if curBeat >= 96 then
        doTweenColor("colorDaddy", "dad", "000000", 0.001, "linear")
        doTweenColor("coloBG", "background", "000000", 0.001, "linear")
        doTweenColor("coloBF", "boyfriend", "000000", 0.001, "linear")
    end

    if curBeat >= 160 then
        doTweenColor("colorDaddy2", "dad", "FFFFFF", 0.001, "linear")
        doTweenColor("coloBG2", "background", "FFFFFF", 0.001, "linear")
        doTweenColor("coloBF2", "boyfriend", "FFFFFF", 0.001, "linear")
    end

end