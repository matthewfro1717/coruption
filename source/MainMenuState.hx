package;

import sys.io.File;
import flixel.input.mouse.FlxMouse;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxBackdrop;
import sys.FileSystem;

using StringTools;

typedef MainMenuChar =
{
	public var name:String;
	public var idle:String;
	public var fps:Int;
	public var scale:Float;
	public var pos:Array<Int>;
	public var isAnimated:Bool;
	public var isChar:Bool;
	public var flipX:Bool;
}

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '2'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;

	public static var firstStart:Bool = true;

	public static var finishedFunnyMove:Bool = false;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

	var optionShit:Array<String> = ['story_mode', 'freeplay', 'options', "credits", "discord", "achievements"];

	var debugKeys:Array<FlxKey>;

	var elapsed:Float = 0.0;

	override function beatHit()
	{
		camGame.zoom = 1.0125;
		FlxTween.tween(camGame, {zoom: 1}, ((Conductor.crochet / 1000) / 1.5), {ease: FlxEase.expoOut});
		super.beatHit();
	}

	override function create()
	{
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg = new FlxSprite().loadGraphic(Paths.image("mainMenuBG"));
		bg.setGraphicSize(1280, 720);
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		var logo = new FlxSprite().loadGraphic(Paths.image("mainMenuLogoThingy"));
		logo.scale.set(0.74, 0.74);
		logo.y += 15;
		logo.updateHitbox();
		logo.screenCenter();
		add(logo);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 0.6;

		for (i in 0...optionShit.length)
		{
			var offset:Float = 240 - (Math.max(optionShit.length, 4) - 4) * 85;
			var menuItem:FlxSprite = new FlxSprite(100, (Math.floor(i / 2) * 200) + offset);
			var correcty = menuItem.y;
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.loadGraphic(Paths.image('mainmenu/' + optionShit[i]));
			menuItem.updateHitbox();
			menuItem.ID = i;
			// menuItem.screenCenter(X);
			if (i % 2 == 1)
				menuItem.x += 800;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6)
				scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;

			if (firstStart)
			{
				menuItem.y += FlxG.height * 1.1;
				FlxTween.tween(menuItem, {y: correcty}, 1 + (i * 0.25), {
					ease: FlxEase.expoInOut,
					onComplete: function(flxTween:FlxTween)
					{
						finishedFunnyMove = true;
						changeItem();
					}
				});
			}
		}
		firstStart = false;
		FlxG.mouse.visible = true;
		var versionShit:FlxText = new FlxText(12, FlxG.height - 64, 0, "Exospheric Corruption V" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Exospheric Engine V" + psychEngineVersion + " (PE 0.6.3)", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		this.elapsed += elapsed;
		for (mi in menuItems) // ineffient maybe
		{
			mi.y += Math.cos(this.elapsed) * 5;
		}
		Conductor.songPosition = FlxG.sound.music.time;
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-2);
			}

			if (controls.UI_LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(2);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}
			if (FlxG.mouse.justMoved) // kinda dumb but ehhhh
				for (menuItem in menuItems)
				{
					if (FlxG.mouse.overlaps(menuItem))
					{
						if (curSelected == menuItem.ID)
							break;
						curSelected = menuItem.ID;
						reloadSprites();
						FlxG.sound.play(Paths.sound('scrollMenu'));
						break;
					}
				}
			if (controls.ACCEPT || (FlxG.mouse.justPressed))
			{
				if (FlxG.mouse.justPressed)
				{
					var clickCheck = false;
					for (menuItem in menuItems)
					{
						if (FlxG.mouse.overlaps(menuItem))
						{
							clickCheck = true;
							break;
						}
					}
					if (!clickCheck)
						return;
				}
				if (optionShit[curSelected] == 'discord')
				{
					CoolUtil.browserLoad('https://discord.gg/exosphere');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							if (spr.ID % 2 == 1)
								FlxTween.tween(spr, {x: FlxG.width + 500}, 2, {
									ease: FlxEase.backInOut,
									type: ONESHOT,
									onComplete: function(twn:FlxTween)
									{
										spr.kill();
									}
								});
							else
								FlxTween.tween(spr, {x: -500}, 2, {
									ease: FlxEase.backInOut,
									type: ONESHOT,
									onComplete: function(twn:FlxTween)
									{
										spr.kill();
									}
								});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];
								FlxG.mouse.visible = false;

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
									case "achievements":
										MusicBeatState.switchState(new AchievementsMenuState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			else if (FlxG.keys.justPressed.FOUR)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MainStoryMenuState());
			}
			#end
		}

		super.update(elapsed);

		// menuItems.forEach(function(spr:FlxSprite)
		// {
		// 	// spr.screenCenter(X);
		// });
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= optionShit.length)
			curSelected -= optionShit.length;
		if (curSelected < 0)
			curSelected += optionShit.length;
		reloadSprites();
	}

	function reloadSprites()
	{
		menuItems.forEach(function(spr:FlxSprite)
		{
			if (spr.ID == curSelected)
			{
				spr.loadGraphic(Paths.image("mainmenu/" + optionShit[curSelected] + "Selected"));
			}
			else
			{
				spr.loadGraphic(Paths.image("mainmenu/" + optionShit[spr.ID]));
			}
			spr.updateHitbox();
		});
	}
}
