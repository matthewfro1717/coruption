function onCreate()
	-- background shit
    makeLuaSprite('OppositonLol', 'OppositonLol', -1250,-750)
    setLuaSpriteScrollFactor('OppositonLol', 0.9, 0.9); 
    addLuaSprite('OppositonLol')
	scaleObject('OppositonLol', 2,2);
    setScrollFactor('OppositonLol', 0, 0);

    makeLuaSprite('ThanosGround', 'ThanosGround', 650,130)
    setLuaSpriteScrollFactor('ThanosGround', 0.9, 0.9); 
    addLuaSprite('ThanosGround')
	scaleObject('ThanosGround', 0.6,0.6);
    setScrollFactor('ThanosGround', 1, 1);


end

function onCreatePost()
    addGlitchEffect ('OppositonLol', 1, 5);
    addBloomEffect("hud", 0, 0);
    addBloomEffect("game", 0, 0);
    addScanlineEffect("hud");
    addChromaticAbberationEffect("game");
    addChromaticAbberationEffect("hud");
end

