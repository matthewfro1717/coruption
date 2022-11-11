
function onCreate()
    makeLuaSprite('DeadDream', 'DeadDream', -500, -200)
    setLuaSpriteScrollFactor('DeadDream', 0.9, 0.9); 
    addLuaSprite('DeadDream')
    scaleObject('DeadDream', 0.5,0.5);
    makeLuaSprite('DeadDreamBlood', 'DeadDreamBlood', -500, -200);

    addLuaSprite('DeadDreamBlood', false);
    scaleObject('DeadDreamBlood', 0.5, 0.5);
    setProperty("DeadDreamBlood.alpha",0)

   --[[ addLuaSprite('StartRunning', false);
    makeAnimatedLuaSprite('StartRunning','StartRunning', -500, -200);
    addAnimationByPrefix('StartRunning', 'idle', 'idle', 18, true);
    setLuaSpriteScrollFactor('StartRunning', 1, 1);
    setProperty("StartRunning.alpha",0)]]
    
    makeLuaSprite('Pathway', 'Pathway', -210, -50);

    addLuaSprite('Pathway', false);
    scaleObject('Pathway', 0.5, 0.5);
    setProperty("Pathway.alpha",0)

end
function onCreatePost()
    addGlitchEffect('Cheating', 2, 2);
end

function onBeatHit()
    if curBeat == 116 then
        setProperty("DeadDreamBlood.alpha",1)
        setProperty("DeadDream.alpha",0)
    end

    if curBeat == 372 then
        setProperty("DeadDreamBlood.alpha",0)
        setProperty("Pathway.alpha",1)
    end
    
    if curBeat == 532 then
        setProperty("Pathway.alpha",0)
    end
end
