package entities;

import com.haxepunk.Graphic;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class UI extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        
		//graphic = Image.createRect(UI_WIDTH, UI_HEIGHT,UI_BACKGROUND_COLOR);
		
        setHitbox(UI_WIDTH, UI_HEIGHT);
		this.layer = UI_LAYER;
        type = "ui";
		
		uiBackground = Image.createRect(UI_WIDTH, UI_HEIGHT, UI_BACKGROUND_COLOR);
				
		addGraphic(uiBackground);
		
		uiBox1 = Image.createRect(uiBoxWidth, uiBoxWidth, uiBoxBackgroundColor);
		uiBox1.x = uiBackground.x + (uiBoxWidth * 0) + uiBoxBuffer;
		uiBox1.y = uiBackground.y + uiBoxBuffer;
		addGraphic(uiBox1);

		uiBox2 = Image.createRect(uiBoxWidth, uiBoxWidth, uiBoxBackgroundColor);
		uiBox2.x = uiBoxOffsetFromX + uiBackground.x + (uiBoxWidth * 1) + uiBoxBuffer * 2;
		uiBox2.y = uiBackground.y + uiBoxBuffer;
		addGraphic(uiBox2);
		
		uiBox3 = Image.createRect(uiBoxWidth, uiBoxWidth, uiBoxBackgroundColor);
		uiBox3.x = 2 * uiBoxOffsetFromX + uiBackground.x + (uiBoxWidth * 2) + uiBoxBuffer * 3;
		uiBox3.y = uiBackground.y + uiBoxBuffer;
		addGraphic(uiBox3);
		
		uiBox4 = Image.createRect(uiBoxWidth, uiBoxWidth, uiBoxBackgroundColor);
		uiBox4.x = 3 * uiBoxOffsetFromX + uiBackground.x + (uiBoxWidth * 3) + uiBoxBuffer * 4;
		uiBox4.y = uiBackground.y + uiBoxBuffer;
		addGraphic(uiBox4);
		
		// Create a 2x6 black box on the right of UI to host Health and Mana levels
		uiHealthManaBar = Image.createRect(2*uiHealthManaBarWidth, uiHealthManaBarHeight, uiBoxBackgroundColor);
		uiHealthManaBar.x = 4 * uiBoxOffsetFromX + uiBackground.x + (uiBoxWidth * 4) + uiBoxBuffer * 5;
		uiHealthManaBar.y = uiBackground.y + uiBoxBuffer;
		addGraphic(uiHealthManaBar);
		
		initHealthBar();
	}
	
	public function drawHealthBar(percentHealth:Float = 0)
	{
		for (i in 0...6)
		{
			// trace("percentHealth = " + percentHealth + " i/6 = " + i / 6);
			if (percentHealth > (i/6))
			{
				healthBar[i].color = 0xFF0000;
			}
			else
			{
				healthBar[i].color = 0x000000;
			}
		}
	}
	
	function initHealthBar(percentHealth:Float = 0)
	{
		for (i in 0...6)
		{
			// trace("percentHealth = " + percentHealth + " i/6 = " + i / 6);
			if (percentHealth > (i/6))
			{
				healthBar[i] = Image.createRect(1, 1, 0xFF0000);
				healthBar[i].x = (uiBoxWidth*4) + (uiBoxBuffer * 5);
				healthBar[i].y = uiBoxWidth - i;			
				addGraphic(healthBar[i]);
			}
			else
			{
				healthBar[i] = Image.createRect(1, 1, 0x000000);
				healthBar[i].x = (uiBoxWidth*4) + (uiBoxBuffer * 5);
				healthBar[i].y = uiBoxWidth - i;
				addGraphic(healthBar[i]);
			}
		}
	}
	
	// Public variables
	
	public static inline var UI_HEIGHT:Int = 8;
	public static inline var UI_WIDTH:Int = 32;
	public static inline var UI_BACKGROUND_COLOR:Int = 0x333333;
	public static inline var UI_LAYER:Int = 5;
	
	public var uiBackground:Image;
	public var uiBox1:Image;
	public var uiBox2:Image;
	public var uiBox3:Image;
	public var uiBox4:Image;
	public var uiHealthManaBar:Image;
	
	public var uiBoxWidth:Int = 6;
	public var uiHealthManaBarHeight:Int = 6;
	public var uiHealthManaBarWidth:Int = 1;
	// Private variables
	
	private var uiBoxBuffer:Int = 1;
	private var uiBoxBackgroundColor:Int = 0x000000;
	private var uiBoxOffsetFromX:Int = 0;
	
	private var healthBar : Array<Image> = new Array();
}