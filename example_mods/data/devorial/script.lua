function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SIX') then
        loadSong('Skill-Issue', 'Skill-Issue', true)
    end
        setProperty('timeBar.color', getColorFromHex('a5004d'))
        setProperty('timeBarBG.color', getColorFromHex('a5004d'))
end
