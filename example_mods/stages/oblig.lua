function onCreate()
	-- background shit
    makeLuaSprite('Death', 'Death', -500,-700)
    setLuaSpriteScrollFactor('Death', 0.9, 0.9); 
    addLuaSprite('Death')
	scaleObject('Death', 0.3,0.3);
end

function onCreatePost()
    setProperty("boyfriend.scale.x", 0.3)
    setProperty("boyfriend.scale.y", 0.3)
    setProperty("boyfriend.alpha", 0.009)
    addGlitchEffect('Death', 0.6, 0.6);
end

function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.032);
        end
    end
    if piss2 == 0 then
      triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 1 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 2 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    elseif piss2 == 3 then
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    end

end   