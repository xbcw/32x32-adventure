package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

class Enemy extends Entity
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		this.layer = GlobalVariables.DEFAULT_LAYER;
        type = "enemy";

		drawEnemy();
		setHitbox(sizeX, sizeY);
		layer = GlobalVariables.DEFAULT_LAYER;
		
		health = maxHealth;
		mana = maxMana;
		
		enemyName = new String("unknown enemy");
		article = new String("an");
		basicAttackName = new String("hits");
		
		velocityX = velocityY = 0;
		velocityX = velocityY = 0;
	}
	
	private function drawEnemy()
	{
		body = Image.createRect(sizeX, sizeY, 0xFFFFFF);
		addGraphic(body);
	}
	
	override public function update()
	{
		// did player collide with player?
		var e:Entity = collide("player", x, y);
		if (e != null && collisionCounter <= 0 && GlobalVariables.PLAYER.playerDead == false)
		{
			var d:Int = GlobalVariables.PLAYER.handleDamage(Std.random(meleeDamage)+1);
			trace(article + " " + enemyName + " " + basicAttackName + " the player for " + d + " damage!");
			collisionCounter = 30;
		}
		collisionCounter--;
		super.update();
	}
	
	
	public var sizeX:Int = 1;
	public var sizeY:Int = 1;
	public var health:Int = 1;
	public var mana:Int = 1;
	public var maxHealth:Int = 1;
	public var maxMana:Int = 1;
	public var meleeDamage:Int = 3;
	
	public var enemyName:String;
	public var article:String;
	public var basicAttackName:String;
	
	public var velocityX:Float;
	public var velocityY:Float;
	
	private var body:Image;
	
	private var collisionCounter:Int = 0;
}