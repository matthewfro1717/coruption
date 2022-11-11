local angleshit = 2;
local anglevar = 2;

function onBeatHit()
	for i = 4,7 do
		noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+45,crochet*0.001-0.01,'expoOut')
	end
	for i = 0,3 do
		noteTweenAngle('beatSpin' .. i,i,getPropertyFromGroup('strumLineNotes',i,'angle')+180,crochet*0.001-0.01,'expoOut')
	end
	triggerEvent('Add Camera Zoom', '0.05', '0.01');
	if curBeat % 2 == 0 then
		angleshit = anglevar;
		setProperty('iconP2.color', getColorFromHex('000000'))
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('healthBar.color', getColorFromHex('00FFFF'))
		doTweenColor('epic1','iconP2','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic2','dad','FFFFFF',crochet*0.001-0.01,'linear')
		doTweenColor('epic3','healthBar','FFFFFF',crochet*0.001-0.01,'linear')
	else
		angleshit = -anglevar;
	end
	setProperty('camHUD.angle',angleshit*3)
	doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
       

end



function opponentNoteHit(ipiss, piss2, piss3, sus) -- SUS? SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?SUS?
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
	triggerEvent('Add Camera Zoom', '0.05', '0.03');
	health = getProperty('health')
	if getProperty('health') > 0.15 then
		setProperty('health', health- 0.01)
	end
    end

    

