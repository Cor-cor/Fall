package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;

class Bit extends FlxSprite
{
	private var _initialPoint:FlxPoint;
	private var _weight:Int = 0;
	private var _absVel:FlxPoint;
	
	/**
	 * This is a generic sprite class extended by Branch, Leaf, and Wisp, since they share so many functions in common.
	 * Always 1px by 1px.
	 * 
	 * @param	x
	 * @param	y
	 * @param	weight
	 * @param	color
	 */
	public function new(x:Int, y:Int, weight:Int, color:Int)
	{
		super(x, y);
		makeGraphic(1, 1, color);
		_weight = weight;
		_absVel = new FlxPoint();
		reset(x, y);
	}
	
	/**
	 * Resets this bit, and updates the initial point. Used for recycling.
	 * 
	 * @param	x
	 * @param	y
	 */
	override public function reset(x:Float, y:Float)
	{
		super.reset(x, y);
		_initialPoint = new FlxPoint(x, y);
	}
	
	/**
	 * Overridden.
	 * Attempts to move this bit. Branches can move a little, leaves can move and fall, and wisps move a lot.
	 * 
	 * @param	force
	 */
	public function push(force:Float)
	{
		
	}
	
	/**
	 * How much this bit "weighs".
	 */
	public var weight(get, null):Int;
	
	private function get_weight():Int
	{
		return _weight;
	}
	
	/**
	 * The absolute value of this bit's velocity.
	 */
	public var absVelocity(get, null):FlxPoint;
	
	private function get_absVelocity():FlxPoint
	{
		_absVel.x = (velocity.x < 0) ? velocity.x * -1 : velocity.x;
		_absVel.y = (velocity.y < 0) ? velocity.y * -1 : velocity.y;
		
		return _absVel;
	}
	
	/**
	 * The direction of this bit, -1 if left, 1 if right.
	 */
	public var direction(get, null):Int;
	
	private function get_direction():Int
	{
		return (velocity.x < 0) ? -1 : 1;
	}
}