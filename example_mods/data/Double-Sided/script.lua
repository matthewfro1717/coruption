function onUpdate()
  if curBeat > 4 then
    if curBeat % 2 == 0 then
        setProperty('timeBar.color', getColorFromHex('FFFFFF'))
        setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
    else
        setProperty('timeBar.color', getColorFromHex('505050'))
        setProperty('timeBarBG.color', getColorFromHex('505050'))
    end
end
end