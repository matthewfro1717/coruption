local angleshit = 1;
local anglevar = 1;
local alphaisfucked = true; --made this since for some fucking reason pb kept appearing when they weren't supposed too xD

function onCreate()
	-- background shit
    makeLuaSprite('omissioned', 'omissioned', -900,-700)
    setLuaSpriteScrollFactor('omissioned', 0.9, 0.9); 
    addLuaSprite('omissioned')
	scaleObject('background', 0.3,0.3);


end

function onCreatePost()
    addGlitchEffect('omissioned', 0.5, 0.5);
end


function onBeatHit()
    if curBeat > 0 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
    end


