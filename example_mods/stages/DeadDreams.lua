
function onCreate()
    makeLuaSprite('DeadDream', 'DeadDream', -500, -200)
    setLuaSpriteScrollFactor('DeadDream', 0.9, 0.9); 
    addLuaSprite('DeadDream')
    scaleObject('DeadDream', 0.5,0.5);
    makeLuaSprite('DeadDreamBlood', 'DeadDreamBlood', -500, -200);

    addLuaSprite('DeadDreamBlood', false);
    scaleObject('DeadDreamBlood', 0.5, 0.5);
    setProperty("DeadDreamBlood.alpha",0)
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
    end

    if curBeat == 532 then
        setProperty("StartRunning.alpha",0)
    end
end

function onUpdate()
    if curBeat == 372 then

        makeAnimatedLuaSprite('StartRunning','StartRunning',-1150, -200)
        addAnimationByPrefix('StartRunning','loop','idle',30,true)
        objectPlayAnimation('insane','loop',true)
        setScrollFactor('StartRunning', 0.9, 0.9)
        scaleObject('StartRunning', 1, 1);
    
        addLuaSprite('StartRunning', false);
    end
end