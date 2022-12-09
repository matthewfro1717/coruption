package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.math.FlxRect;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.FlxBasic;

class MusicBeatState extends FlxUIState
{
	private var curSection:Int = 0;
	private var stepsToDo:Int = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;

	private var curDecStep:Float = 0;
	private var curDecBeat:Float = 0;
	private var controls(get, never):Controls;

	public static var camBeat:FlxCamera;

	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	override function create()
	{
		camBeat = FlxG.camera;
		var skip:Bool = FlxTransitionableState.skipNextTransOut;
		super.create();

		if (!skip)
		{
			if (Std.isOfType(FlxG.state, PlayState))
				openSubState(new CustomFadeTransition(0.7, true, getImageName()));
			else
				openSubState(new CustomFadeTransition(0.7, true));
		}
		FlxTransitionableState.skipNextTransOut = false;
	}

	override function update(elapsed:Float)
	{
		// everyStep();
		var oldStep:Int = curStep;

		updateCurStep();
		updateBeat();

		if (oldStep != curStep)
		{
			if (curStep > 0)
				stepHit();

			if (PlayState.SONG != null)
			{
				if (oldStep < curStep)
					updateSection();
				else
					rollbackSection();
			}
		}

		if (FlxG.save.data != null)
			FlxG.save.data.fullscreen = FlxG.fullscreen;

		super.update(elapsed);
	}

	private function updateSection():Void
	{
		if (stepsToDo < 1)
			stepsToDo = Math.round(getBeatsOnSection() * 4);
		while (curStep >= stepsToDo)
		{
			curSection++;
			var beats:Float = getBeatsOnSection();
			stepsToDo += Math.round(beats * 4);
			sectionHit();
		}
	}

	private function rollbackSection():Void
	{
		if (curStep < 0)
			return;

		var lastSection:Int = curSection;
		curSection = 0;
		stepsToDo = 0;
		for (i in 0...PlayState.SONG.notes.length)
		{
			if (PlayState.SONG.notes[i] != null)
			{
				stepsToDo += Math.round(getBeatsOnSection() * 4);
				if (stepsToDo > curStep)
					break;

				curSection++;
			}
		}

		if (curSection > lastSection)
			sectionHit();
	}

	private function updateBeat():Void
	{
		curBeat = Math.floor(curStep / 4);
		curDecBeat = curDecStep / 4;
	}

	private function updateCurStep():Void
	{
		var lastChange = Conductor.getBPMFromSeconds(Conductor.songPosition);

		var shit = ((Conductor.songPosition - ClientPrefs.noteOffset) - lastChange.songTime) / lastChange.stepCrochet;
		curDecStep = lastChange.stepTime + shit;
		curStep = lastChange.stepTime + Math.floor(shit);
	}

	static function getImageName() // for transition
	{
		var imageName = null;
		switch (Paths.formatToSongPath(PlayState.SONG.song))
		{
			default: // dont need to explain
				imageName = "default";

			case "quantum", "valley": // dave
				imageName = "davefnf";
			case "uprising-terror":
				imageName = "daveworried";
			case "censure":
				imageName = "insanelouddave";

			case "farm", "starch": // expunged
				imageName = "expung";
			case "epitome":
				imageName = "eptiome";
			case "insane", "oblivious":
				imageName = "insaneloud";

			case "resentful", "fuming": // bambi
				imageName = "bambi";
			case "dereliction":
				imageName = "blackout";
			case "doomed":
				imageName = "glitchcorn";
			case "glitchcorn":
				imageName = "glitchedcorn";

			case "homework", "lesson", "grounded":
				imageName = "hairman";
			case "defiance":
				imageName = "nohairman";

			case "devoid", "overlord", "inevitable", "violence", "exospheric", "gloomy-despair": // exosphere
				imageName = "exosphere";

			case "archangel", "precariousness": // flyhigh
				imageName = "flyperson";
			case "intrusion":
				imageName = "homeinvasion";

			case "idiocy": // bandumb
				imageName = "epicloadignscrene";
			case "tricked":
				imageName = "bandumbangry";
			case "gobstopper", "numbskull":
				imageName = "truebandumb";

			case "annoyance": // zander
				imageName = "anoy";
			case "half-sided":
				imageName = "halfsid";
			case "half-hearted":
				imageName = "noheart";
			case "standoff":
				imageName = "stand";

			case "greetings", "room-tour": // allure
				imageName = "allure1";
			case "imprisonment", "anathematized":
				imageName = "allure2";

			case "disregard": // yes
				imageName = "unregardant";

			case "atmospherical": // secret songs
				imageName = "atmosphere";
			case "purgatory":
				imageName = "purgate";
			case "disheartened":
				imageName = "blackout";
				if (ClientPrefs.gorestuff)
					imageName = "thisheartand";
			case "fractured-incantation":
				imageName = "plush";
			case "charlatan":
				imageName = "chartan";
			case "supreme":
				imageName = "suspreme";
			case "nemesis":
				imageName = "nemesus";
			case "divine-punishment":
				imageName = "apunishmentintime";
		}
		return imageName;
	}

	public static function switchState(nextState:FlxState)
	{
		// Custom made Trans in
		var curState:Dynamic = FlxG.state;
		var leState:MusicBeatState = curState;
		var imageName = null;
		if (Std.isOfType(nextState, PlayState))
		{
			imageName = getImageName();
		}
		if (!FlxTransitionableState.skipNextTransIn)
		{
			leState.openSubState(new CustomFadeTransition(0.6, false, imageName));
			if (FlxG.state == nextState)
				CustomFadeTransition.finishCallback = function()
				{
					FlxG.resetState();
				};
			else
				CustomFadeTransition.finishCallback = function()
				{
					FlxG.switchState(nextState);
				};
			// trace('changed state');
			return;
		}
		FlxTransitionableState.skipNextTransIn = false;
		FlxG.switchState(nextState);
	}

	public static function resetState()
	{
		MusicBeatState.switchState(FlxG.state);
	}

	public static function getState():MusicBeatState
	{
		var curState:Dynamic = FlxG.state;
		var leState:MusicBeatState = curState;
		return leState;
	}

	public function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
	}

	public function beatHit():Void
	{
		// trace('Beat: ' + curBeat);
	}

	public function sectionHit():Void
	{
		// trace('Section: ' + curSection + ', Beat: ' + curBeat + ', Step: ' + curStep);
	}

	function getBeatsOnSection()
	{
		var val:Null<Float> = 4;
		if (PlayState.SONG != null && PlayState.SONG.notes[curSection] != null)
			val = PlayState.SONG.notes[curSection].sectionBeats;
		return val == null ? 4 : val;
	}
}
