function onCreate()
	-- background shit
    makeLuaSprite('half2', 'corrupteddimension', -2900,-2300)
    setLuaSpriteScrollFactor('half2', 0.9, 0.9); 
    addLuaSprite('half2')
	scaleObject('half2', 6, 9);
    setProperty('half2.alpha', 0)

    makeLuaSprite('2', 'Blackout', -2900,-2300)
    setLuaSpriteScrollFactor('2', 0.9, 0.9); 
    addLuaSprite('2', true)
    setProperty('2.alpha', 0)
	scaleObject('2', 6, 9);
end

function onCreatePost()
    addGlitchEffect('half2', 0.5, 0.5);
end

function onUpdate()
    if curBeat > 4 then
      if curBeat % 2 == 0 then
          setProperty('timeBar.color', getColorFromHex('FFFFFF'))
          setProperty('timeBarBG.color', getColorFromHex('FFFFFF'))
      else
          setProperty('timeBar.color', getColorFromHex('505050'))
          setProperty('timeBarBG.color', getColorFromHex('505050'))
      end

      if curBeat >= 127 then
        doTweenAlpha('aasssdgsdf', '2', '1', '1', 'linear');
      end

      if curBeat >= 145 then
            setProperty('timeBar.color', getColorFromHex('5D3FD3'))
            setProperty('timeBarBG.color', getColorFromHex('5D3FD3'))
      end

      if curBeat >= 160 then
        setProperty('camGame.zoom', 0.2)
        setProperty('2.alpha', 0)
        setProperty('half2.alpha', 1)
        setProperty("boyfriend.scale.x", 0.4)
        setProperty("boyfriend.scale.y", 0.4)
        setProperty("dad.scale.x", 5)
        setProperty("dad.scale.y", 5)
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
        setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))

      end
      
    end
end