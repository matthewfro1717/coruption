function onCreate()
	triggerEvent('Add Camera Zoom', '6', '6');
end

function onUpdate()
	setProperty('timeBar.color', getColorFromHex('023020'))
	setProperty('timeBarBG.color', getColorFromHex('023020'))
end


function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	health = getProperty('health')
	if getProperty('health') > 0.15 then
		setProperty('health', health- 0.01)
	end
    end

    

