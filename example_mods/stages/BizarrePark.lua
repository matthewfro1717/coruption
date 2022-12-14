function onCreate()
    makeLuaSprite('BizarrePark', 'BizarrePark', -600, -350)
    setLuaSpriteScrollFactor('BizarrePark', 0.9, 0.9); 
    addLuaSprite('BizarrePark')
    makeLuaSprite('greengalaxy', 'greengalaxy', -560, -500);

    addLuaSprite('greengalaxy', false);
    scaleObject('greengalaxy', 2, 2);
    setProperty("greengalaxy.alpha",0)
end

