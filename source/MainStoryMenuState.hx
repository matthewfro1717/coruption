package;

import flixel.FlxG;
import flixel.FlxSprite;

class MainStoryMenuState extends MusicBeatState
{
	var bg:FlxSprite;
	var bgBack:FlxSprite; // for flicker‼

	// dont need to reposition
	var buttonPathN:FlxSprite;
	var buttonPathH:FlxSprite;

	var onHardcore:Bool = false;
	var selected:Bool = false;

	override function create()
	{
		bgBack = new FlxSprite(0, 0).loadGraphic(Paths.image("mainmenuUI/normalbgh"));
		bgBack.setGraphicSize(1280, 720);
		bgBack.updateHitbox();
		add(bgBack);
		bg = new FlxSprite(0, 0).loadGraphic(Paths.image("mainmenuUI/normalbg"));
		bg.setGraphicSize(1280, 720);
		bg.updateHitbox();
		add(bg);
		buttonPathN = new FlxSprite(0, 100).loadGraphic(Paths.image("mainmenuUI/normaltext"));
		add(buttonPathN);
		buttonPathN.scale.set(0.75, 0.75);
		buttonPathN.updateHitbox();
		buttonPathH = new FlxSprite(793, 100).loadGraphic(Paths.image("mainmenuUI/hardcoretext"));
		buttonPathH.scale.set(0.75, 0.75);
		buttonPathH.updateHitbox();
		add(buttonPathH);
		buttonPathH.visible = false;
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (controls.UI_LEFT_P || controls.UI_RIGHT_P)
			toggleHardcore();
		if (controls.ACCEPT || mouseclicked())
			enter();
		if (controls.BACK)
			MusicBeatState.switchState(new MainMenuState());
		super.update(elapsed);
	}

	function toggleHardcore()
	{
		if (selected)
			return;
		FlxG.sound.play(Paths.sound('scrollMenu'));
		onHardcore = !onHardcore;

		buttonPathN.visible = !onHardcore;
		buttonPathH.visible = onHardcore;

		var ext = "normal";
		if (onHardcore)
			ext = "hardcore";

		bgBack.loadGraphic(Paths.image('mainmenuUI/${ext}bgh'));
		bgBack.setGraphicSize(1280, 720);
		bgBack.updateHitbox();
		bg.loadGraphic(Paths.image('mainmenuUI/${ext}bg'));
		bg.setGraphicSize(1280, 720);
		bg.updateHitbox();
	}

	function enter()
	{
		if (selected)
			return;
		selected = true;
		FlxG.sound.play(Paths.sound('confirmMenu'));
		buttonPathN.visible = false;
		buttonPathH.visible = false;
		flixel.effects.FlxFlicker.flicker(bg, 1, 0.125, false, false, function(_)
		{
			if (onHardcore)
				MusicBeatState.switchState(new StoryMenuState()); // pretend this is hardcore edition
			else
				MusicBeatState.switchState(new StoryMenuState());
		});
	}

	function mouseclicked()
	{
		var button = buttonPathN;
		if (onHardcore)
			button = buttonPathH;
		return FlxG.mouse.justPressed && FlxG.mouse.overlaps(button);
	}
}
