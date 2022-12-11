package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Looking at the Credits", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['EC Developers'],
			['ReeVrze',             'ree',              'Director, Composer, Charter, Artist, and Voicr Actor of Azstroth',             'https://www.youtube.com/c/ReeVrze',                                      'ba3915'],
			['Emperor Yami',        'yami',             'Composer and Voice Actor',                                                     'https://www.youtube.com/channel/UCGYq0oofj5gUxXacghgxsDw',               'b3b3b3'],
			['polyoah',             'polyoah',          'Artist and Animator',                                                          'https://www.youtube.com/channel/UCXEX7pWCLVHHQpSGG-FJTAA',               'ffffff'],
			['null_y34r',           'null',             'Composer',                                                                     'https://www.youtube.com/channel/UCJWH0H_qSgPCIbI8Plc5Emw',               'fef1fa'], 
			['Farjd',               'farjd',            'Composer and Charter',                                                         'https://www.youtube.com/channel/UCj6b9fttoy5_2WSSm3_mIqg',               'afb3b6'],
			['ToxicFlame',          'toxic',            'Composer and Charter',                                                         'https://www.youtube.com/channel/UCKBgCgsxSpdqFPryS7NAWWQ',               'ffdc6a'],
			['hydration',           'hydration',        'Lua Coder',                                                                    'https://www.youtube.com/channel/UCoIiLmqinRdOTRcVs3W990w',               '2f5aaa'],
			['Reginald Reborn',     'reginald',         'Artist',                                                                       'https://www.youtube.com/channel/UCEqHSAUTzOAssJe8j4ZI3iw',               '333333'],
			['Skrimblo',            'skrimblo',         'Voice Actor: Exosphere / FlyHigh',                                             'https://www.youtube.com/channel/UCuvxHrBJ8iIMx9_GzJJm1Gg',               'd8d8d8'],
			['SolarSonia',          'soniya',           'Artist',                                                                       'https://www.youtube.com/channel/UCRUXoMt73UbJ6agMfV8a2ig',               'e8ccb0'],
			['MinecraftBoy2038',    'mcboy',            'Source and Lua Coder',                                                         'https://www.youtube.com/c/MinecraftBoy2038',                             'a81022'],
			['SpiralGraveStudios',  'spiral',           'Artist',                                                                       'https://www.youtube.com/channel/UCDcJgi_SkoeeRIk5r2E7FJQ',               '00c3ff'],
			['mikey!!',             'mikey',            'Artist',                                                                       'https://www.youtube.com/channel/UCJFqBfVUoOoHhiIllaKraqw',               'ffc13b'],
			['hortas',              'hortas',           'Composer',                                                                     'https://www.youtube.com/channel/UCvR1oxdjnB9hV-MLeH339Kg',               'aa4eff'],
			['Gabelex',             'gablex',           'Artist',                                                                       'https://www.youtube.com/channel/UCIgEqfx8e2Elm3bxmh0mJ4A',               '0077ff'],
			['GoddessAwe',          'awe',              'Composer',                                                                     'https://www.youtube.com/channel/UCm_J_m6_tbNKHwlV1YBH7cw',               'ce3643'], 
			['Vtolligunt',          'vtol',             'Artist / Chromatics [Allure]',                                                 'https://www.youtube.com/channel/UCzoX8AupSUeQ8QSix3sa1Ww',               'b363ff'], 
			['HenZawu',             'hen',              'Artist',                                                                       'https://www.youtube.com/channel/UCI4hh3AYm8_3JzVfuFDW1vg',               'fa1a04'],
			['EpicRandomness11',    'random',           'Composer',                                                                     'https://www.youtube.com/channel/UCltC-E3CBWfvZXgLypAKIyQ',               'ffffff'],
			['Kyson',               'kyson',            'Charter',                                                                      'https://www.youtube.com/channel/UCPfz7f4ecd_gLhfx7Uy2Sew',               '3698ff'],
			['RafPlayz69YT',        'raf',              'Source Coder',                                                                 'https://www.youtube.com/channel/UCmXh1HTaH_KRwisl0892KLA',               '919191'],
			['Light',               'light',            'Artist',                                                                       'https://www.youtube.com/channel/UCth0bT8vQiLl9wVPzZ7BGGw',               'ffffff'],
			['Ufer',                'ufer',             'Charter',                                                                      'https://www.youtube.com/channel/UCmkClt8tBygJXxTPSkSBhvQ',               '454545'],
			['cyanrio',             'cyan',             'Artist and Voice Actor',                                                       'https://www.youtube.com/channel/UCUSmB_ZQdiBhPLNmmywj1UA',               '0c0c69'],
			['TeeJay',              'blank',            'Sprite Animator',                                                              'https://www.youtube.com/channel/UChV3iaDk2iEyLrkUrF6m0vA',               'FFFFFF'], // NO CREDIT ICON
			[''],
			['EC Contributors'],
			['OOF PRODUCTIONS',     'oof',              'Coder and Sprite Artist',                                      'https://www.youtube.com/channel/UCVAf4TewS2ckoiHa8s8QiQg',               'f1f18e'],
			['LooshGamer12',        'blank',            'Artist',                                                       'https://www.youtube.com/channel/UC4Upl0VpIIEqq19VLwXDV-Q',               'FFFFFF'],
			['hafp',                'blank',            'Composer',                                                     'https://www.youtube.com/channel/UCCiNV343OnSg_q2ylmQ28Pg',               'FFFFFF'],
			['Oxy',                 'blank',            'Composer',                                                     'https://www.youtube.com/channel/UCgTW7cQcfqduIqlu-bSZGZg',               'FFFFFF'],
			['Strats',              'blank',            'Composer',                                                     'https://www.youtube.com/channel/UCn_lq7My-uJnqZVKosKt35g',               'FFFFFF'],
			['rembulous',           'rem',              'Vocals: Gloomy Despair',                                       'https://twitter.com/rembulous',                                          'efe9f1'],
			['JammedCassette',      'blank',            'Composer',                                                     '???',                                  'FFFFFF'], // NO SOCIAL LINK
			['ShiftyTM',            'blank',            'Composer',                                                     'https://www.youtube.com/channel/UC8NHfjpy6tNWgnM7889S1Ew',               'FFFFFF'],
			['vvxrthy',             'blank',            'Composer',                                                     'https://www.youtube.com/channel/UC_lJmvYgeAwzcYaeYXlZ7vg',               'FFFFFF'],
			['ThiccWandMoment',     'blank',            'Icon Artist',                                                  '???',                                  'FFFFFF'], // NO SOCIAL LINK
			['DJ Jayden',           'blank',            'Original Composer of Blocked Forever',                         '???',                                  'FFFFFF'], // NO SOCIAL LINK
			['Roundcat',            'blank',            'Opppsition Expunged Sprites',                                  '???',                                  'FFFFFF'], // NO SOCIAL LINK
			['Cheese Farmer',       'blank',            'GF Phone Sprites',                                             '???',                                  'FFFFFF'], // NO SOCIAL LINK
			['NerRuiAnte',          'blank',            'Artist',                                                       '???',                                  'FFFFFF'], // NO SOCIAL LINK
			['Top 10 Awesome',      'T1A',              'Funni Composer',                                               'https://www.youtube.com/channel/UC6NtPGdUgKSC8Wx1F-GN4tg',               'ffee00'],
			['Devoid',              'Void',             'Credit Icon Artist',                                           'https://www.youtube.com/channel/UCKWc85Z--5Xb6enYFEkw2TQ',               '969ab0'],
			['joolian',             'joolian',          'Composer',                                                     'https://www.youtube.com/channel/UCodhrSzni1q310Xpx72Ehzg',               '0033ff'],
			['Delta',               'blank',            'Original Freeplay and Judgement Counter Code',                 'https://www.youtube.com/channel/UCdFBiot5gdR8y8sCazo4dVg',               'FFFFFF'],
			[''],
			['Special Thanks'],
			['ThearchyExpungedOfficial', 'thearchy',    'Tried to help',                                                'https://www.youtube.com/channel/UCbgMNTmUX5xqT52-3qU1Xog',               'ffffff'], 
			['Danimates',           'dan',              'Crumb Edition Collab + Chromatic for Starch Remix',            'https://www.youtube.com/c/DanimatesYoutube',                             '880015'],
			['Lucho_Gamer',         'lucho',            'Animated Health Bar',                                          'https://www.youtube.com/channel/UCwOUVKrxdHb6IbI-Z-4gnnw',               'dca045'],
			['notweuz_',            'weuz',             'Code parts from OS Engine',                                    'https://twitter.com/notweuz_',                                           '8633F2'],
			['nelifs',              'nelifs',           'Another Programmer from OS Engine',                            'https://github.com/nelifs',                                              '1C1C1C'],
			['SillyFangirl',        'blank',            'Support',                                                      'https://www.youtube.com/c/SillyFangirlosu',                              'FFFFFF'], 
			['Dever',               'dever',            'Support + Chromatics for Dever',                               'https://www.youtube.com/@deverfnf',                                      '3dd650'], 
			['NSR',                 'NSR',              'Support',                                                      'https://www.youtube.com/@NSR',                                           'd11f64'],
			['bobyt',               'blank',            'Support and being cool',                                       'https://www.youtube.com/channel/UCb3IwHNuPgT2w2pr31LOFbg',               'FFFFFF'], // NO CREDIT ICON
			['Lylcaruis',           'blank',            'Support',                                                      'https://www.youtube.com/@Lylcaruis',                                     'FFFFFF'], // NO CREDIT ICON
			['RhythmShadow',        'blank',            'Support',                                                      'https://www.youtube.com/channel/UChAT-I3TjfdL0z-FOpJKmJQ',               'FFFFFF'], // NO CREDIT ICON
			['RVGames',             'blank',            'Support',                                                      'https://www.youtube.com/@RVGames2003',                                   'FFFFFF'], // NO CREDIT ICON
			['Used Napkin',         'blank',            'Support',                                                      'https://www.youtube.com/@UsedNapkin',                                    'FFFFFF'], // NO CREDIT ICON
			['And You!',            'You!',             'Yes, you! Thank you for playing Exospheric Corruption :)',     'https://twitter.com/Exozphere',                                          'cb7d5c'], // Hold up, does this need a credit icon????     
			[''],
			['Socials'],
			['Discord Server',      'discord',          'Press Enter / Space to join the Discord!',                     'https://discord.gg/wvUPHxFudk',        '5165f6'],
			['Twitter',             'twitter',          'Press Enter / Space to follow us! (@Exozphere)',               'https://twitter.com/Exozphere',        '55acee'],
			[''],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',								'https://twitter.com/Shadow_Mario_',	'444444'],
			['RiverOaken',			'river',			'Main Artist/Animator of Psych Engine',							'https://twitter.com/RiverOaken',		'B42F71'],
			['shubs',				'shubs',			'Additional Programmer of Psych Engine',						'https://twitter.com/yoshubs',			'5E99DF'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'bb',				'Ex-Programmer of Psych Engine',								'https://twitter.com/bbsub3',			'3E813A'],
			[''],
			['Engine Contributors'],
			['iFlicky',				'flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',		'https://twitter.com/flicky_i',			'9E29CF'],
			['SqirraRNG',			'sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform',	'https://twitter.com/gedehari',			'E1843A'],
			['EliteMasterEric',		'mastereric',		'Runtime Shaders support',										'https://twitter.com/EliteMasterEric',	'FFBD40'],
			['PolybiusProxy',		'proxy',			'.MP4 Video Loader Library (hxCodec)',							'https://twitter.com/polybiusproxy',	'DCD294'],
			['KadeDev',				'kade',				'Fixed some cool stuff on Chart Editor\nand other PRs',			'https://twitter.com/kade0912',			'64A250'],
			['Keoiki',				'keoiki',			'Note Splash Animations',										'https://twitter.com/Keoiki_',			'D2D2D2'],
			['Nebula the Zorua',	'nebula',			'LUA JIT Fork and some Lua reworks',							'https://twitter.com/Nebula_Zorua',		'7D40B2'],
			['Smokey',				'smokey',			'Sprite Atlas Support',											'https://twitter.com/Smokey_5_',		'483D92'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",							'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",								'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",								'https://twitter.com/evilsk8r',			'5ABD4B'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",								'https://twitter.com/kawaisprite',		'378FC7']
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}