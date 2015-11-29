package;

import flash.display.BlendMode;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.util.FlxRandom;

class Ghost extends FlxSprite
{
	public function new(x:Int = 0, y:Int = 0)
	{
		super(x, y, "images/ghost.png");
		init(x, y);
	}
	
	public function init(x:Int, y:Int):Void
	{
		super.reset(x, y);
		
		alpha = 0;
		velocity.x = FlxRandom.floatRanged(-20, 20);
		velocity.y = FlxRandom.floatRanged(-32, -24);
		
		FlxTween.tween(this, { alpha: 1 }, FlxRandom.floatRanged(0.2, 1), { complete: fadedIn });
	}
	
	private function fadedIn(f:FlxTween):Void
	{
		FlxTween.tween(this, { alpha: 0 }, FlxRandom.floatRanged(0.2, 1), { complete: fadedOut });
	}
	
	private function fadedOut(f:FlxTween):Void
	{
		kill();
	}
}