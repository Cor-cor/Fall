package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxRandom;

class Branch extends Bit
{
	/**
	 * A "branch" is a 1px by 1px part of a tree.
	 * 
	 * @param	x		The x position for this "branch".
	 * @param	x		The y position for this "branch".
	 * @param	weight	The weight of this "branch". Assigned in the PlayState; trunk branches are much heavier.
	 */
	public function new(x:Int, y:Int, weight:Int)
	{
		super(x, y, weight, FlxColor.BLACK);
		solid = true;
		moves = true;
		immovable = false;
	}
	
	override public function push(force:Float):Void
	{
		if (force > _weight && FlxRandom.chanceRoll(10))
		{
			x = (_initialPoint.x + 2) * velocity.x;
		}
		else
		{
			x = _initialPoint.x;
			y = _initialPoint.y;
		}
	}
}