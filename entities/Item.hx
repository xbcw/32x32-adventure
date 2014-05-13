package entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Item extends Entity
{
	public function new(handX:Int, handY:Int, hand:String)
	{
		trace("Item.new");
		super(handX, handY);
		
		type = "item";
		setHitbox(1, 1);
		this.layer = GlobalVariables.DEFAULT_LAYER;
		
		this.hand = hand;
		this.handX = handX;
		this.handY = handY;
		
		drawItem();
		for (i in 0...itemPart.length)
		{
			itemPartOriginalX[i] = itemPart[i].x;
			itemPartOriginalY[i] = itemPart[i].y;
		}
	}
	
	public function drawItem()
	{
		trace("Item.drawItem");
		itemPart[0] = Image.createRect(1, 1, itemColorPart[0]);
		itemColorPart[0] = 0xFFFFFF;
		addGraphic(itemPart[1]);
		itemPart[0].x = handX;
		itemPart[0].y = handY;
	}
	
	public function animateItemStanding()
	{
		moveX = moveY = 0;
		
		for (i in 0...itemPart.length)
		{
			itemPart[i].x = itemPartOriginalX[i];
			itemPart[i].y = itemPartOriginalY[i];
		}
	}
	
	public function animateItemMoving()
	{		
		if (hand == "right")
		{
			moveX = -1;
			moveY = 0;
		}
		else if (hand == "left")
		{
			moveX = 1;
			moveY = 0;
		}
		for (i in 0...itemPart.length)
		{
			//itemPart[i].x = itemPartOriginalX[i] + moveX;
			//itemPart[i].y = itemPartOriginalY[i] + moveY;
			itemPart[i].x += moveX;
			itemPart[i].y += moveY;
		}
	}
	
	public function resetAnimation()
	{
		moveX = moveY = 0;
		
		for (i in 0...itemPart.length)
		{
			itemPart[i].x = itemPartOriginalX[i];
			itemPart[i].y = itemPartOriginalY[i];
		}
	}
	
	public function itemMove(moveX:Int, moveY:Int, hand:String)
	{
		this.hand = hand;
		for (i in 0...itemPart.length)
		{
			itemPart[i].x = moveX;
			itemPart[i].y = moveY;
			itemPartOriginalX[i] = itemPart[i].x;
			itemPartOriginalY[i] = itemPart[i].y;
		}
	}
	
	public function animateItemActivate1()
	{
		activated = true;
	}
	
	public function animateItemActivate2()
	{
		activated = true;
	}
	
	public function animateItemActivate3()
	{
		activated = true;
	}
	
	public function animateItemDead()
	{
		for (i in 0...itemPart.length)
		{
			if (itemPart[i].y < GlobalVariables.PLAYER.height-1)
			{
				itemPart[i].y += 1;
			}
		}
	}
	
	override public function update()
	{
		super.update();
	}
	
	public var hand:String = "right";
	
	private var itemPart : Array<Image> = new Array();
	private var itemColorPart : Array<Int> = new Array();
	private var itemPartOriginalX : Array<Float> = new Array();
	private var itemPartOriginalY : Array<Float> = new Array();
	private var handX:Int;
	private var handY:Int;
	private var moveX:Int = 0;
	private var moveY:Int = 0;
	private var activated:Bool = false;
}