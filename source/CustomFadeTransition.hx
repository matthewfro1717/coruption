package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.math.FlxRect;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.FlxCamera;

class CustomFadeTransition extends MusicBeatSubstate
{
	public static var finishCallback:Void->Void;

	private var leTween:FlxTween = null;

	public static var nextCamera:FlxCamera;

	var isTransIn:Bool = false;
	var transBlack:FlxSprite;
	var transGradient:FlxSprite;

	var imageName:String;

	public function new(duration:Float, isTransIn:Bool, ?imageName:String)
	{
		super();

		this.isTransIn = isTransIn;
		this.imageName = imageName;
		var zoom:Float = CoolUtil.boundTo(FlxG.camera.zoom, 0.05, 1);
		var width:Int = Std.int(FlxG.width / zoom);
		var height:Int = Std.int(FlxG.height / zoom);
		transGradient = FlxGradient.createGradientFlxSprite(width, height, (isTransIn ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
		transGradient.scrollFactor.set();
		if (imageName == null)
		{
			add(transGradient);
			transBlack = new FlxSprite().makeGraphic(width, height + 400, FlxColor.BLACK);
		}
		else
		{
			transBlack = new FlxSprite().loadGraphic(Paths.image("loadingscreens/" + imageName));
		}
		transBlack.scrollFactor.set();
		add(transBlack);

		transGradient.x -= (width - FlxG.width) / 2;
		if (imageName == null)
			transBlack.x = transGradient.x;

		if (isTransIn) // second one
		{
			if (imageName == null) // normal
			{
				transGradient.y = transBlack.y - transBlack.height;
				FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
					onComplete: function(twn:FlxTween)
					{
						close();
					},
					ease: FlxEase.linear
				});
			}
			else // image
			{
				transBlack.alpha = 1;
				leTween = FlxTween.tween(transBlack, {alpha: 0}, duration, {
					onComplete: function(twn:FlxTween)
					{
						close();
					},
					ease: FlxEase.cubeIn
				});
			}
		}
		else // first one
		{
			transGradient.y = -transGradient.height;
			if (imageName == null) // normal
			{
				transBlack.y = transGradient.y - transBlack.height + 50;
				leTween = FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
					onComplete: function(twn:FlxTween)
					{
						if (finishCallback != null)
						{
							finishCallback();
						}
					},
					ease: FlxEase.linear
				});
			}
			else // image
			{
				transBlack.alpha = 0;
				leTween = FlxTween.tween(transBlack, {alpha: 1}, duration, {
					onComplete: function(twn:FlxTween)
					{
						if (finishCallback != null)
						{
							finishCallback();
						}
					},
					ease: FlxEase.quartOut
				});
			}
		}

		if (nextCamera != null)
		{
			transBlack.cameras = [nextCamera];
			transGradient.cameras = [nextCamera];
		}
		nextCamera = null;
	}

	override function update(elapsed:Float)
	{
		if (imageName == null)
		{
			notImageMove();
			super.update(elapsed);
			notImageMove();
		}
		else
		{
			// imageMove();
			super.update(elapsed);
			// imageMove();
		}
	}

	function notImageMove()
	{
		if (isTransIn)
		{
			transBlack.y = transGradient.y + transGradient.height;
		}
		else
		{
			transBlack.y = transGradient.y - transBlack.height;
		}
	}

	// function imageMove()
	// {
	// 	if (isTransIn)
	// 	{
	// 		transBlack.y = CoolUtil.boundTo(transGradient.y + transBlack.height - imageOffset, -1000, 720);
	// 	}
	// 	else
	// 	{
	// 		transBlack.y = CoolUtil.boundTo(transGradient.y - transBlack.height - imageOffset, -1000, 0);
	// 	}
	// }

	override function destroy()
	{
		if (leTween != null)
		{
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}
