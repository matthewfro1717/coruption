local angleshit = 1;
local anglevar = 1;

function onBeatHit()
    if curBeat > 0 then
        if curBeat % 4 == 0 then
            angleshit = anglevar;
            triggerEvent('Change Scroll Speed', '0.7', '0.001');
            triggerEvent('Change Scroll Speed', '1', '0.2');

        else
            angleshit = -anglevar;
        end
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
        triggerEvent('Add Camera Zoom', '0.01', '0.01');
    end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
    	setProperty('health', health-0.015);
    end
end