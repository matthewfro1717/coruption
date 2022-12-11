package;

import flixel.group.FlxSpriteGroup;
import flixel.effects.FlxFlicker;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;
import flixel.util.FlxStringUtil;
import openfl.utils.Assets as OpenFlAssets;
import lime.utils.Assets;
#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	var curSelected:Int = 0;
	var curDifficulty:Int = 1;

	var bg:FlxSprite;
	var scoreBG:FlxSprite;
	var scoreText:FlxText;
	var freeplayDifficulty:FlxSprite;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;
	var colorTween:FlxTween;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;
	private var curChar:String = "unknown";

	private var InMainFreeplayState:Bool = false;

	private var AllPossibleSongs:Array<String> = ["main", "anomaly", "extra", "joke", "hidden", "secret"];

	private var CurrentPack:Int = 0;

	var loadingPack:Bool = false;

	private var iconArray:Array<HealthIcon> = [];
	var categoryIcons:Array<FlxSprite> = [];

	override function create()
	{
		Conductor.bpmChangeMap = [];
		Conductor.changeBPM(100);
		#if desktop
		DiscordClient.changePresence("In the Freeplay Menu", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		var hiddenSongsJson = haxe.Json.parse(Assets.getText("assets/weeks/hidden.json"));
		var hasHidden = false;
		for (songData in cast(hiddenSongsJson.songs, Array<Dynamic>))
		{
			if (ClientPrefs.songPlayedHidden.exists(Paths.formatToSongPath(songData[0])))
			{
				hasHidden = true;
				break;
			}
		}
		if (!hasHidden)
			AllPossibleSongs.remove("hidden");
		for (i in 0...AllPossibleSongs.length)
		{
			var categoryIcon = new FlxSprite().loadGraphic(Paths.image('week_icons_' + (AllPossibleSongs[i].toLowerCase())));
			categoryIcon.setGraphicSize(Std.int(categoryIcon.width * 0.7));
			categoryIcon.updateHitbox();
			categoryIcon.screenCenter();
			categoryIcon.x += i * 1280;
			add(categoryIcon);
			categoryIcons.push(categoryIcon);
		}
		for (icon in categoryIcons)
		{
			FlxTween.tween(icon, {x: ((categoryIcons.indexOf(icon) - CurrentPack) * 1280) + ((FlxG.width - icon.width) / 2)}, 0.2, {
				ease: FlxEase.cubeInOut
			});
		}

		bottomInfoTextBG = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
		bottomInfoTextBG.alpha = 0.6;
		#if PRELOAD_ALL
		defbottomText = "Press SPACE to listen to the Song / Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.";
		#else
		defbottomText = "Press RESET to Reset your Score and Accuracy.";
		#end
		bottomInfoText = new FlxText(bottomInfoTextBG.x + -10, bottomInfoTextBG.y + 3, FlxG.width, defbottomText, 21);
		bottomInfoText.setFormat(Paths.font("comicsanslol.ttf"), 18, FlxColor.WHITE, RIGHT);
		bottomInfoText.scrollFactor.set();
		super.create();
	}

	var bottomInfoTextBG:FlxSprite;
	var bottomInfoText:FlxText;
	var defbottomText:String = "";

	public function LoadProperPack()
	{
		var pack:String = AllPossibleSongs[CurrentPack].toLowerCase();
		var packJson = haxe.Json.parse(Assets.getText("assets/weeks/" + pack + ".json"));
		for (songData in cast(packJson.songs, Array<Dynamic>))
		{
			if (pack == "hidden" && !ClientPrefs.songPlayedHidden.exists(Paths.formatToSongPath(songData[0]))) // dont get (thats stupid)
				continue;
			// this code sucks (and is very dangerous) but is better than hard-coded
			if (["disheartened", "divine-punishment", "fractured-incantation", "numbskull"].contains(Paths.formatToSongPath(songData[0])))
				addSong(songData[0], FlxColor.fromRGB(songData[2][0], songData[2][1], songData[2][2]), songData[1], true, false);
			else if (["purgatory", "supreme", "nemesis", "atmospherical", "charlatan"].contains(Paths.formatToSongPath(songData[0])))
				addSong(songData[0], FlxColor.fromRGB(songData[2][0], songData[2][1], songData[2][2]), songData[1], true, true);
			else
				addSong(songData[0], FlxColor.fromRGB(songData[2][0], songData[2][1], songData[2][2]), songData[1], false, false);
		}
	}

	public function isSongLocked(songName:String, achievementUnlockAllow:Bool = true)
	{
		var song = Paths.formatToSongPath(songName);
		if (ClientPrefs.songPlayed.exists(song))
		{
			var locked = true;
			if (ClientPrefs.songPlayed.get(song))
				locked = false;
			else if ((["supreme", "nemesis", "atmospherical", "purgatory", "charlatan"].contains(song)
				&& Achievements.isAchievementUnlocked(song + "_unlock"))
				&& achievementUnlockAllow) // achievement songs
				locked = false;
			return locked;
		}
		else
			return false;
	}

	public function GoToActualFreeplay()
	{
		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songLocked = isSongLocked(songs[i].songName, false);
			var songText:Alphabet; // to allow it to compile (i think)
			if (songLocked)
			{
				songText = new Alphabet(0, (70 * i) + 30, "", true);
				for (letter in songs[i].songName)
				{
					songText.text += "?";
				}
			}
			else
				songText = new Alphabet(0, (70 * i) + 30, songs[i].songName, true);

			songText.isMenuItem = true;
			songText.itemType = "D-Shape";
			songText.targetY = i;
			grpSongs.add(songText);
			if (songText.width > 980)
			{
				var textScale:Float = 980 / songText.width;
				songText.scale.x = textScale;
				for (letter in songText.letters)
				{
					letter.x *= textScale;
					letter.offset.x *= textScale;
				}
				// songText.updateHitbox();
				// trace(songs[i].songName + ' new scale: ' + textScale);
			}
			var icon:HealthIcon; // refer above
			if (songLocked)
				icon = new HealthIcon("gfgone");
			else
				icon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			iconArray.push(icon);
			add(icon);
		}

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.WHITE, RIGHT);
		scoreText.x = 780;

		scoreBG = new FlxSprite(scoreText.x - 13, 0).makeGraphic(520, 45, 0xFF000000);
		scoreBG.alpha = 0.5;
		freeplayDifficulty = new FlxSprite();
		reloadFreeplayDifficulty();
		add(freeplayDifficulty);
		add(scoreBG);
		add(scoreText);
		add(bottomInfoTextBG);
		add(bottomInfoText);
		changeSelection();
		changeDiff();

		// var swag:Alphabet = new Alphabet(1, 0, "swag");
	}

	public function addSong(songName:String, color:FlxColor, songCharacter:String, isLocked:Bool, isAchievement:Bool)
	{
		songs.push(new SongMetadata(songName, color, songCharacter, isLocked, isAchievement));
	}

	public function UpdatePackSelection(change:Int)
	{
		if (loadingPack)
			return;
		CurrentPack += change;
		if (CurrentPack == -1)
		{
			CurrentPack = AllPossibleSongs.length - 1;
			for (icon in categoryIcons)
			{
				FlxTween.tween(icon, {x: (((AllPossibleSongs.length - 1) - categoryIcons.indexOf(icon)) * -1280) + ((FlxG.width - icon.width) / 2)}, 0.2, {
					ease: FlxEase.cubeInOut
				});
			}
		}
		if (CurrentPack == AllPossibleSongs.length)
		{
			CurrentPack = 0;
			for (icon in categoryIcons)
			{
				FlxTween.tween(icon, {x: (categoryIcons.indexOf(icon) * 1280) + ((FlxG.width - icon.width) / 2)}, 0.2, {
					ease: FlxEase.cubeInOut
				});
			}
		}
		if (change != 0)
		{
			if (change < 0)
			{
				for (icon in categoryIcons)
				{
					FlxTween.tween(icon, {x: ((CurrentPack - categoryIcons.indexOf(icon)) * -1280) + ((FlxG.width - icon.width) / 2)}, 0.2, {
						ease: FlxEase.cubeInOut,
					});
				}
			}
			else
			{
				for (icon in categoryIcons)
				{
					FlxTween.tween(icon, {x: ((categoryIcons.indexOf(icon) - CurrentPack) * 1280) + ((FlxG.width - icon.width) / 2)}, 0.2, {
						ease: FlxEase.cubeInOut
					});
				}
			}
		}
	}

	override function beatHit()
	{
		super.beatHit();
		if (loadingPack)
			return;
		FlxG.camera.zoom = 1.05;
		FlxTween.tween(FlxG.camera, {zoom: 1}, 0.3, {ease: FlxEase.quadOut});
	}

	public function addWeek(songs:Array<String>, color:FlxColor, ?songCharacters:Array<String>, ?isLocked:Bool = false, ?isAchievement:Bool = false)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, color, songCharacters[num], isLocked, isAchievement);

			if (songCharacters.length != 1)
				num++;
		}
	}

	var holdTime:Float = 0;
	var instPlaying:Int = -1;

	private static var vocals:FlxSound = null;

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		Conductor.songPosition = FlxG.sound.music.time;
		if (!InMainFreeplayState)
		{
			if (controls.UI_LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				UpdatePackSelection(-1);
			}
			if (controls.UI_RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				UpdatePackSelection(1);
			}
			if (controls.ACCEPT && !loadingPack)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				loadingPack = true;
				LoadProperPack();
				FlxTween.tween(categoryIcons[CurrentPack], {alpha: 0, y: categoryIcons[CurrentPack].y + 200}, 0.2, {
					ease: FlxEase.cubeInOut,
				});
				FlxTween.completeTweensOf(FlxG.camera);
				new FlxTimer().start(0.5, function(Dumbshit:FlxTimer)
				{
					FlxG.camera.zoom = 1;
					GoToActualFreeplay();
					InMainFreeplayState = true;
					loadingPack = false;
					changeSelection(0);
				});
			}
			if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
			}

			return;
		}

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		scoreText.text = 'PERSONAL BEST: ' + lerpScore + ' (' + Math.floor(lerpRating * 100) + '%)';
		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		var ctrl = FlxG.keys.justPressed.CONTROL;
		var fuckyou = FlxG.keys.justPressed.SEVEN;

		var shiftMult:Int = 1;
		if (FlxG.keys.pressed.SHIFT)
			shiftMult = 3;

		if (upP)
		{
			changeSelection(-1);
			FlxG.sound.play(Paths.sound('scrollMenu'));
			holdTime = 0;
		}
		if (downP)
		{
			changeSelection(1);
			FlxG.sound.play(Paths.sound('scrollMenu'));
			holdTime = 0;
		}

		if (controls.UI_DOWN || controls.UI_UP)
		{
			var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
			holdTime += elapsed;
			var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

			if (holdTime > 0.5 && checkNewHold - checkLastHold > 0)
			{
				changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				FlxG.sound.play(Paths.sound('scrollMenu'));
			}
		}

		if (ctrl)
		{
			persistentUpdate = false;
			openSubState(new GameplayChangersSubstate());
		}

		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new FreeplayState());

			if (accepted)
			{
				var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);

				trace(poop);

				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = curDifficulty;
			}
		}
		if (fuckyou)
		{
			FlxG.sound.music.volume = 0;
			PlayState.SONG = Song.loadFromJson("numbskull", "numbskull"); // you dun fucked up again
			FlxG.save.data.oppositionFound = true;

			new FlxTimer().start(0.25, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState());
				FlxG.sound.music.volume = 0;
				FreeplayState.destroyFreeplayVocals();
			});
		}

		if (space && instPlaying != curSelected)
		{
			if (isSongLocked(songs[curSelected].songName, false))
				return;
			destroyFreeplayVocals();
			Paths.currentModDirectory = songs[curSelected].folder;
			var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);
			PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
			if (PlayState.SONG.needsVoices)
				vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
			else
				vocals = new FlxSound();

			Conductor.mapBPMChanges(PlayState.SONG);
			Conductor.changeBPM(PlayState.SONG.bpm);
			FlxG.sound.list.add(vocals);
			FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 0.7);
			vocals.play();
			vocals.persist = true;
			vocals.looped = true;
			vocals.volume = 0.7;
			instPlaying = curSelected;
		}
		else if (accepted)
		{
			if (isSongLocked(songs[curSelected].songName))
				return;
			var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
			var poop:String = Highscore.formatSong(songLowercase, curDifficulty);
			if (!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop))
				&& !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop)))
			{
				poop = songLowercase;
				curDifficulty = 1;
			}

			PlayState.SONG = Song.loadFromJson(poop, songLowercase);
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty;
			FlxG.sound.play(Paths.sound('confirmMenu'));
			loadingPack = true;
			for (i in 0...grpSongs.members.length)
			{
				if (i == curSelected)
					continue;
				FlxTween.tween(grpSongs.members[i], {alpha: 0}, 0.375, {ease: FlxEase.sineOut});
				FlxTween.tween(iconArray[i], {alpha: 0}, 0.375, {ease: FlxEase.sineOut});
			}
			if (!isSongLocked(songs[curSelected].songName, false))
			{
				var spriteGroup = new FlxSpriteGroup();
				spriteGroup.add(grpSongs.members[curSelected]);
				spriteGroup.add(iconArray[curSelected]);
				FlxFlicker.flicker(spriteGroup, 1, 0.1, function(_)
				{
					FlxG.sound.music.volume = 0;
					destroyFreeplayVocals();
					LoadingState.loadAndSwitchState(new PlayState());
				});
			}
			else
			{
				FlxG.sound.music.volume = 0;
				destroyFreeplayVocals();
				LoadingState.loadAndSwitchState(new PlayState());
			}
		}
		else if (controls.RESET)
		{
			openSubState(new ResetScoreSubState(songs[curSelected].songName, curDifficulty, songs[curSelected].songCharacter));
			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
		super.update(elapsed);
	}

	public static function destroyFreeplayVocals()
	{
		if (vocals != null)
		{
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 4;
		if (curDifficulty > 4)
			curDifficulty = 0;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		PlayState.storyDifficulty = curDifficulty;
	}

	function changeSelection(change:Int = 0)
	{
		if (loadingPack)
			return;
		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;

		if (curSelected >= songs.length)
			curSelected = 0;

		if (curDifficulty < 2) // idk man
			curDifficulty = 2;

		if (curDifficulty > 2)
			curDifficulty = 2;

		if (change != 0)
			reloadFreeplayDifficulty();

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		if (songs[curSelected].isLocked && isSongLocked(songs[curSelected].songName, false))
			bottomInfoText.text = songs[curSelected].descLocked;
		else
			bottomInfoText.text = defbottomText;
		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
		changeDiff();

		if (colorTween != null)
		{
			colorTween.cancel();
		}
		var colorTo = songs[curSelected].color;
		if (songs[curSelected].isLocked && isSongLocked(songs[curSelected].songName, false))
			colorTo = FlxColor.fromRGB(50, 50, 50); // grey
		colorTween = FlxTween.color(bg, 1, bg.color, colorTo, {
			onComplete: function(twn:FlxTween)
			{
				colorTween = null;
			}
		});
	}

	function reloadFreeplayDifficulty()
	{
		if (songs[curSelected].isLocked && isSongLocked(songs[curSelected].songName, false))
		{
			freeplayDifficulty.visible = false;
			return; // useless to update when invis
		}
		else
			freeplayDifficulty.visible = true;
		freeplayDifficulty.loadGraphic(Paths.image("freeplaydifficulty/" + getFreeplayDifficulty()));
		freeplayDifficulty.setGraphicSize(600);
		freeplayDifficulty.updateHitbox();
		freeplayDifficulty.setPosition(FlxG.width - freeplayDifficulty.width / 1.25, FlxG.height - freeplayDifficulty.height / 1.25);
	}

	function getFreeplayDifficulty()
	{
		switch (Paths.formatToSongPath(songs[curSelected].songName))
		{
			case "scythe", "kysophobia":
				return "peaceful";

			case "greetings":
				return "easy";

			case "quantum", "valley", "uprising-terror", "farm", "starch", "homework", "lesson", "grounded", "violence", "precariousness", "idiocy",
				"room-tour", "obliteration", "toothpicked", "exotron", "apeirogon", "effulgence", "overwhelm", "devorial":
				return "normal";

			case "censure", "epitome", "oblivious", "defiance", "resentful", "fuming", "devoid", "overlord", "endearment", "archangel", "intrusion",
				"annoyance", "half-sided", "half-hearted", "imprisonment", "anathematized", "epsilokorasiophobia", "omission", "disoriented",
				"defenestration", "spyware", "outerspace", "preimminent", "anemoia", "septuagint", "yard", "convenience", "encore", "disarranging",
				"soundless", "computer-virus", "approaching-yourself", "dead-dream", "real-delirium", "real-nemesis", "dimensional", "skill-issue", "stand-off":
				return "hard";

			case "insane", "dereliction", "doomed", "glitchcorn", "inevitable", "exospheric", "gloomy-despair", "gobstopper", "reality-breaking", "hyperness",
				"lolipop", "resilient", "pentagon", "jinxed", "demigod", "holy-flame", "omnipotent", "screwed", "atmospheric-anomaly", "fractured-incantation":
				return "difficult";

			case "pseptuagint5", "unexpected", "aichmophobia", "quadriplegia", "hydromania", "atmospherical", "charlatan", "purgatory":
				return "severe";

			case "disregard", "seraphic", "undercharted", "supreme", "nemesis":
				return "intense";

			case "disheartened", "numbskull":
				return "extreme";

			case "divine-punishment":
				return "divine";
		}
		return "normal"; // default
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var color:FlxColor = FlxColor.WHITE; // fallback
	public var songCharacter:String = "";
	public var folder:String = "";

	// locked vars
	public var isLocked:Bool = false;
	public var isAchievement:Bool = false;
	public var descLocked:String = "";

	public function new(song:String, color:FlxColor, songCharacter:String, ?isLocked:Bool = false, ?isAchievement:Bool = false)
	{
		this.songName = song;
		this.color = color;
		this.songCharacter = songCharacter;
		this.folder = Paths.currentModDirectory;
		if (this.folder == null)
			this.folder = '';
		this.isLocked = isLocked;
		this.isAchievement = isAchievement;
		if (isLocked)
		{
			descLocked = "If you see this, something went wrong! Report to the devs!";
			if (isAchievement && !(isLocked && song.toLowerCase() == "charlatan"))
			{
				var index = Achievements.getAchievementIndex(song.toLowerCase() + "_unlock");
				if (index == -1) // no good
					return;
				descLocked = 'Unlock the achievement ${Achievements.achievementsStuff[index][0]} to unlock this song.';
			}
			else
			{
				switch (Paths.formatToSongPath(songName)) // just in case
				{
					case "charlatan":
						descLocked = "One's mind goes hectic, and insanely deranged. Once he sees you, it will all end in pain.";
					case "numbskull":
						descLocked = "Purgatory's Opposition is the key, one of the numbers will set him free.";
					case "fractured-incantation":
						descLocked = "A curse placed after the third, failure is how it happened I heard.";
					case "disheartened":
						descLocked = "Giving up on her stage of anger will then lead you to something stranger.";
					case "divine-punishment":
						descLocked = "A leader who doesn't give up for a reason, yet you did the oppositite which acted as treason.";
				}
			}
		}
	}
}
