package utilities;

import com.haxepunk.utils.Key;
import com.haxepunk.utils.Input;

class InputHandler
{
	public function new()
	{
		/// Initialize movement
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("right", [Key.RIGHT, Key.D]);
		Input.define("left", [Key.LEFT, Key.A]);
		Input.define("reset", [Key.R]);
		Input.define("item1Activate", [Key.Q, Key.Z, Key.DIGIT_1]);
	}
	
	public function update()
	{
		if (Input.check("up"))
		{
			inputUp = true;
		}
		else
		{
			inputUp = false;
		}
		
		if (Input.check("down"))
		{
			inputDown = true;
		}
		else
		{
			inputDown = false;
		}
		
		if (Input.check("left"))
		{
			inputLeft = true;
		}
		else
		{
			inputLeft = false;
		}
		
		if (Input.check("right"))
		{
			inputRight = true;
		}
		else
		{
			inputRight = false;
		}
		
		if (Input.check("reset"))
		{
	
			inputR = true;
		}
		else
		{
			inputR = false;
		}
		
		if (Input.check("item1Activate"))
		{
	
			inputItem1Activate = true;
		}
		else
		{
			inputItem1Activate = false;
		}
	}
	
	public var inputUp:Bool = false;
	public var inputDown:Bool = false;
	public var inputLeft:Bool = false;
	public var inputRight:Bool = false;
	public var inputR:Bool = false;
	public var inputItem1Activate:Bool = false;
}