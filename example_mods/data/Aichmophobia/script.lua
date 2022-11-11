function onUpdate()
    setProperty('timeBar.color', getColorFromHex('5D3FD3'))
    setProperty('timeBarBG.color', getColorFromHex('5D3FD3'))
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.THREE') then
        loadSong('Quadriplegia', 'Quadripegia', true)
	end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0 then
            setProperty('health', health- 0.01);
        end
    end
end

