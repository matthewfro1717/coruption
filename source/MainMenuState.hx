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

	var optionShit:Array<String> = ['story_mode', 'freeplay', 'credits', 'options'];
	var ogLength:Int = 0;

	var backdrop:FlxBackdrop;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var char:FlxSprite;

	override function beatHit()
	{
		@:privateAccess
		if (curBeat % 2 == 0 && char.animation.getByName("idle") != null && !char.animation.getByName("idle").looped)
			char.animation.play("idle");
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

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		var theBG:BGSprite = new BGSprite('purpleyard', 200, -175, 0, 0);
		add(theBG);

		backdrop = new FlxBackdrop(Paths.image('backd'), 0.2, 0, true, true);
		backdrop.velocity.set(200, 110);
		backdrop.updateHitbox();
		backdrop.alpha = 0.5;
		backdrop.screenCenter(X);
		add(backdrop);

		var bga:FlxSprite = new FlxSprite(-120).loadGraphic(Paths.image('selec'));
		bga.setGraphicSize(Std.int(bg.width * 1.175));
		bga.updateHitbox();
		bga.screenCenter();
		bga.antialiasing = ClientPrefs.globalAntialiasing;
		add(bga);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140) + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			// menuItem.screenCenter(X);
			menuItem.x += 100;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6)
				scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;

			// menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
			if (firstStart)
			{
				menuItem.y += FlxG.height * 1.1;
				FlxTween.tween(menuItem, {y: offset + (i * 140)}, 1 + (i * 0.25), {
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
		ogLength = optionShit.length;
		optionShit.push("achievements");
		var trophyIcon = new FlxSprite().loadGraphic(Paths.image("trophyicon"));
		trophyIcon.updateHitbox();
		trophyIcon.x = FlxG.width - trophyIcon.width - 15;
		trophyIcon.y = 15;
		trophyIcon.ID = 4;
		menuItems.add(trophyIcon);
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

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();
		var possibleChars:Array<MainMenuChar> = [];
		for (json in FileSystem.readDirectory("assets/images/menuMainChars"))
		{
			if (FileSystem.isDirectory("assets/images/menuMainChars/" + json))
				continue;
			possibleChars.push(haxe.Json.parse(File.getContent(Sys.getCwd() + "assets/images/menuMainChars/" + json)));
		}
		var charChosen = FlxG.random.getObject(possibleChars);
		char = new FlxSprite();
		if (charChosen.isAnimated)
		{
			if (charChosen.isChar)
				char.frames = Paths.getSparrowAtlas("characters/" + charChosen.name);
			else
				char.frames = Paths.getSparrowAtlas("menuMainChars/images/" + charChosen.name);
			if (charChosen.name.contains("bamb") && charChosen.name.contains("exo"))
				char.animation.addByPrefix("idle", charChosen.idle, charChosen.fps, true);
			else
				char.animation.addByPrefix("idle", charChosen.idle, charChosen.fps, false);
		}
		else
			char.loadGraphic(Paths.image("menuMainChars/images/" + charChosen.name));
		char.scale.set(charChosen.scale, charChosen.scale);
		if (charChosen.isAnimated)
			char.animation.play("idle");
		char.screenCenter();
		char.x += charChosen.pos[0];
		char.y += charChosen.pos[1];
		char.flipX = charChosen.flipX;
		add(char);
		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		Conductor.songPosition = FlxG.sound.music.time;
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
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
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							if (spr.ID > 3)
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
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			// spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= ogLength)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = ogLength - 1;
		reloadSprites();
	}

	function reloadSprites()
	{
		menuItems.forEach(function(spr:FlxSprite)
		{
			if (spr.ID > 3)
			{
				if (curSelected == 4) // i have to do this horribleness
				{
					spr.loadGraphic(Paths.image("trophyiconSelected"));
					spr.x = FlxG.width - spr.width - 8;
					spr.y = 8;
				}
				else
				{
					spr.loadGraphic(Paths.image("trophyicon"));
					spr.x = FlxG.width - spr.width - 10;
					spr.y = 10;
				}
				return;
			}
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if (menuItems.length > 4)
				{
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
