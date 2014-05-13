package entities.items.wieldable;

import entities.Item;
import com.haxepunk.graphics.Image;

class Sword extends Item
{
	override function new(handX:Int, handY:Int, hand:String)
	{
		trace("Sword.new");
		super(handX, handY, hand);		
		super.setHitbox(1, 3);
		super.type = "weapon";
	}
	
	override public function drawItem()
	{
		itemColorPart[0] = 0x614126;
		itemPart[0] = Image.createRect(1, 1, itemColorPart[0]);
		itemPart[0].x = handX;
		itemPart[0].y = handY;
		addGraphic(itemPart[0]);
		
		itemColorPart[1] = 0xEEEEEE;
		itemPart[1] = Image.createRect(1, 1, itemColorPart[1]);
		itemPart[1].x = handX;
		itemPart[1].y = handY - 1;
		addGraphic(itemPart[1]);
		
		itemColorPart[2] = 0xEEEEEE;
		itemPart[2] = Image.createRect(1, 1, itemColorPart[2]);
		itemPart[2].x = handX;
		itemPart[2].y = handY - 2;
		addGraphic(itemPart[2]);
		
		trace("Sword.drawItem");
	}
	
	override public function itemMove(moveX:Int, moveY:Int, hand:String)
	{
		this.hand = hand;
		
		itemPart[0].x = moveX;
		itemPart[0].y = moveY;
		itemPartOriginalX[0] = itemPart[0].x;
		itemPartOriginalY[0] = itemPart[0].y;
		
		itemPart[1].x = moveX;
		itemPart[1].y = moveY - 1;
		itemPartOriginalX[1] = itemPart[1].x;
		itemPartOriginalY[1] = itemPart[1].y;
		
		itemPart[2].x = moveX;
		itemPart[2].y = moveY - 2;
		itemPartOriginalX[2] = itemPart[2].x;
		itemPartOriginalY[2] = itemPart[2].y;
		
	}
	
	override public function animateItemActivate1()
	{
		if (hand == "right")
		{
			itemPart[1].x = itemPartOriginalX[1] + moveX + 1;
			itemPart[2].x = itemPartOriginalX[2] + moveX + 2;
		}
		else if (hand == "left")
		{
			itemPart[1].x = itemPartOriginalX[1] + moveX - 1.0;
			itemPart[2].x = itemPartOriginalX[2] + moveX - 2.0;
		}
		itemPart[1].y = itemPart[0].y - 1;
		itemPart[2].y = itemPart[0].y - 2;
	}
	
	override public function animateItemActivate2()
	{
		if (hand == "right")
		{
			itemPart[1].x = itemPartOriginalX[1] + moveX + 1;
			itemPart[2].x = itemPartOriginalX[2] + moveX + 2;
		}
		else if (hand == "left")
		{
			itemPart[1].x = itemPartOriginalX[1] + moveX - 1.0;
			itemPart[2].x = itemPartOriginalX[2] + moveX - 2.0;
		}
		itemPart[1].y = itemPart[2].y = itemPart[0].y;
	}
	
	override public function animateItemActivate3()
	{
		if (hand == "right")
		{
			itemPart[1].x = itemPartOriginalX[1] + moveX + 1;
			itemPart[2].x = itemPartOriginalX[2] + moveX + 2;
		}
		else if (hand == "left")
		{
			itemPart[1].x = itemPartOriginalX[1] + moveX - 1.0;
			itemPart[2].x = itemPartOriginalX[2] + moveX - 2.0;
		}
		itemPart[1].y = itemPart[2].y = itemPart[0].y + 1;
	}
}