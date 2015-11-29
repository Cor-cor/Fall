package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxRandom;

class Jack extends FlxSprite
{
	public function new(x:Int, y:Int)
	{
		super(x, y, "images/jack.png");
		init(x, y);
	}
	
	public function init(x:Int, y:Int)
	{
		super.reset(x, y);
		
		acceleration.y = 80;
		
		velocity.x = FlxRandom.intRanged(20, 60);
		
		if (this.x >= 0)
		{
			velocity.x *= -1;
		}
	}
	
	override public function update():Void
	{
		if (y > FlxG.height)
		{
			kill();
		}
		
		super.update();
	}
}