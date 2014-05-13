package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.HXP;
import flash.display.InterpolationMethod;
import utilities.InputHandler;
 
class Player extends Entity
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        type = "player";
		
        setHitbox(3, 4);
		layer = GlobalVariables.DEFAULT_LAYER;
		drawPlayer();
		
		ui = new UI(GlobalVariables.UI_X + GlobalVariables.SCREEN_POS_X, GlobalVariables.UI_Y + GlobalVariables.SCREEN_POS_Y);
		
		userInput = new InputHandler();
/*		// Initialize movement
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("right", [Key.RIGHT, Key.D]);
		Input.define("left", [Key.LEFT, Key.A]);*/
		
		playerHealth = playerMaxHealth;
		playerMana = playerMaxMana;
		ui.drawHealthBar(playerHealth/playerMaxHealth);
		
		rightHandX = RIGHTHANDSTANDINGX;
		leftHandX = LEFETHANDSTANDINGX;
		rightHandY = 1;
		leftHandY = 1;
		
		velocityX = velocityY = 0;
		velocityX = velocityY = 0;
    }
	
	public function addToInventory(item:Item)
	{
		inventory.push(item);
	}
	
	public function equip(item:Item)
	{
		equipped.push(item);
		addGraphic(item.graphic);
	}
	
	private function handleInput()
	{
		userInput.update();
		if (playerDead == false) 
		{
			if (userInput.inputRight)
			{
				velocityX = 1;
				equipped[0].itemMove(rightHandX, rightHandY, "right");
				equipped[1].itemMove(leftHandX, leftHandY, "left");
			}
			if (userInput.inputLeft)
			{
				velocityX = -1;
				equipped[0].itemMove(leftHandX, leftHandY, "left");
				equipped[1].itemMove(rightHandX, rightHandY, "right");
			}
			if (userInput.inputUp)
			{
				velocityY = -2;
			}
			if (userInput.inputDown)
			{
				velocityY = 1;
			}
		}
		else velocityX = velocityY = 0;
		
		if (userInput.inputR)
		{
			playerReincarnate();
		}
		
		if (userInput.inputItem1Activate)
		{
			if (itemActivateCounter <= 0 && itemActivate == false)
			{
				itemActivateCounter = 16;
				itemActivate = true;
			}
		}
		else
		{
			itemActivate = false;
		}
	}
	
	private function drawPlayer()
	{
 		//addGraphic(graphic);
		
		playerHelmet = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerHelmetColor);
		playerHelmet.x = GlobalVariables.PLAYER_SIZE * 1;
		playerHelmet.y = GlobalVariables.PLAYER_SIZE * 0;
		addGraphic(playerHelmet);
		
		playerArmorUpper = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerArmorUpperColor);
		playerArmorUpper.x = GlobalVariables.PLAYER_SIZE * 1;
		playerArmorUpper.y = GlobalVariables.PLAYER_SIZE * 1;
		addGraphic(playerArmorUpper);
		
		playerArmorLower = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerArmorLowerColor);
		playerArmorLower.x = GlobalVariables.PLAYER_SIZE * 1;
		playerArmorLower.y = GlobalVariables.PLAYER_SIZE * 2;
		addGraphic(playerArmorLower);
		
		playerLeftArm = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerLeftArmColor);
		playerLeftArm.x = GlobalVariables.PLAYER_SIZE * 0;
		playerLeftArm.y = GlobalVariables.PLAYER_SIZE * 1;
		addGraphic(playerLeftArm);

		playerRightArm = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerRightArmColor);
		playerRightArm.x = GlobalVariables.PLAYER_SIZE * 2;
		playerRightArm.y = GlobalVariables.PLAYER_SIZE * 1;
		addGraphic(playerRightArm);
		
		playerLeftLeg = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerLeftLegColor);
		playerLeftLeg.x = GlobalVariables.PLAYER_SIZE * 0;
		playerLeftLeg.y = GlobalVariables.PLAYER_SIZE * 3;
		addGraphic(playerLeftLeg);
		
		playerRightLeg = Image.createRect(GlobalVariables.PLAYER_SIZE, GlobalVariables.PLAYER_SIZE, playerRightLegColor);
		playerRightLeg.x = GlobalVariables.PLAYER_SIZE * 2;
		playerRightLeg.y = GlobalVariables.PLAYER_SIZE * 3;
		addGraphic(playerRightLeg);		
	}
	
	private function redrawPlayer()
	{
 		//addGraphic(graphic);
		
		playerHelmet.x = GlobalVariables.PLAYER_SIZE * 1;
		playerHelmet.y = GlobalVariables.PLAYER_SIZE * 0;
		
		playerArmorUpper.x = GlobalVariables.PLAYER_SIZE * 1;
		playerArmorUpper.y = GlobalVariables.PLAYER_SIZE * 1;
		
		playerArmorLower.x = GlobalVariables.PLAYER_SIZE * 1;
		playerArmorLower.y = GlobalVariables.PLAYER_SIZE * 2;
		
		playerLeftArm.x = GlobalVariables.PLAYER_SIZE * 0;
		playerLeftArm.y = GlobalVariables.PLAYER_SIZE * 1;
		
		playerRightArm.x = GlobalVariables.PLAYER_SIZE * 2;
		playerRightArm.y = GlobalVariables.PLAYER_SIZE * 1;
		
		playerLeftLeg.x = GlobalVariables.PLAYER_SIZE * 0;
		playerLeftLeg.y = GlobalVariables.PLAYER_SIZE * 3;
		
		playerRightLeg.x = GlobalVariables.PLAYER_SIZE * 2;
		playerRightLeg.y = GlobalVariables.PLAYER_SIZE * 3;	
	}
	
	private function playerAnimate()
	{
		if (playerDead == false) 
		{
			animateCounter++;
			// if right or left keys pushed, animate player
			if (animateCounter < 30)
			{
				if (userInput.inputRight || userInput.inputLeft)
				{
					animatePlayerMoving();
					equipped[0].animateItemMoving();
					equipped[1].animateItemMoving();
				}
				else
				{
					animatePlayerStanding();
					equipped[0].animateItemStanding();
					equipped[1].animateItemStanding();
				}
			}
			else if (animateCounter < 60 )
			{
				if (userInput.inputRight || userInput.inputLeft) 
				{
					//walk animation
					animatePlayerStanding();
					equipped[0].animateItemStanding();
					equipped[1].animateItemStanding();
				}
			}
			if (itemActivateCounter > 0)
			{	
				if (itemActivateCounter < 6)
				{
					equipped[0].animateItemStanding();
				}
				else if (itemActivateCounter < 9)
				{
					equipped[0].animateItemActivate3();	
				}
				else if (itemActivateCounter < 12)
				{ 
					equipped[0].animateItemActivate2();
				}
				else if (itemActivateCounter <= 15)
				{
					equipped[0].animateItemActivate1();					
				}
				itemActivateCounter--;
			}
		}
		else
		{
			if (animateCounter % 10 == 0)
			{
				animatePlayerDead();
				equipped[0].animateItemDead();
				equipped[1].animateItemDead();
				animateCounter = 0;
			}
		}
		animateCounter++;
		if (animateCounter >=60)
		{
			animateCounter = 0;
		}
	}

	
	private function move()
	{
		// jump if not jumping
		if ( playerJumpingCounter <= 0 && playerJumping == false && userInput.inputUp)
		{
			playerJumping = true;
			playerJumpingCounter = playerJumpHeight;
		}
		else if (playerJumpingCounter > 0 && playerJumping == true)
		{
			playerJumpingCounter--;
		}
		else if (playerJumpingCounter <= 0)
		{
			velocityY = 0;
		}
		
		// move if delay is 0
		if (currentMoveDelay <= 0) 
		{
			// Collision detection
			var e:Entity = collide("terrain", x + velocityX, y);
			// check if colliding and if player will stay in bounds with move
			if (e == null)
			{
				moveBy(velocityX, 0);
				HXP.world.camera.x += velocityX;
				ui.x += velocityX;
				currentMoveDelay = maxMoveDelay;
			}
			else
			{
				var e:Entity = collide("terrain", x, y + 1);
				if (e != null)
				{
					velocityY = -2;
				}
				
				//trace("Colliding with terrain on X");
				moveBy(0, 0);
			}
			
			var e:Entity = collide("terrain", x, y + velocityY + GlobalVariables.GRAVITY);
			if (e == null)
			//&& this.y + velocityY + GlobalVariables.GRAVITY >= GlobalVariables.SCREEN_POS_Y && this.y + velocityY + GlobalVariables.GRAVITY <= (GlobalVariables.SCREEN_SIZE_Y + GlobalVariables.SCREEN_POS_Y - this.height))
			{
				// no collision on Y, move player and camera
				moveBy(0, velocityY + GlobalVariables.GRAVITY);
				//HXP.world.camera.y += velocityY;
				currentMoveDelay = maxMoveDelay;
			}
			else
			{
				// collision on Y, don't move
				// trace("Colliding with terrain on Y");
				moveBy(0, 0);
				if (velocityY >= 0)
				{
					playerJumping = false;
					playerJumpingCounter = 0;
				}
			}
		}
		currentMoveDelay--;
		
		velocityX = velocityY = 0;
	}
	
	public function handleDamage(damage:Int, damageType:String = "notype"):Int
	{
		var modifiedDamage = damage;
		playerHealth -= modifiedDamage;
		ui.drawHealthBar(playerHealth / playerMaxHealth);
		if (playerHealth <= 0)
		{
			animatePlayerStanding();
			playerDead = true;
		}
		return modifiedDamage;
	}
	
	function playerReincarnate()
	{
		redrawPlayer();
		ui.drawHealthBar(1);
		playerHealth = playerMaxHealth;
		playerDead = false;
		deadAnimationLevel0 = 0;
		deadAnimationLevel1 = 1;
		deadAnimationLevel2 = 2;
		deadAnimationLevel3 = 3;
	}
	
	function animatePlayerStanding():Void 
	{
		playerLeftArm.x = GlobalVariables.PLAYER_SIZE * 0;
		playerRightArm.x = GlobalVariables.PLAYER_SIZE * 2;
		playerLeftLeg.x = GlobalVariables.PLAYER_SIZE * 0;
		playerRightLeg.x = GlobalVariables.PLAYER_SIZE * 2;
	}
	
	function animatePlayerMoving():Void 
	{
		playerLeftArm.x = GlobalVariables.PLAYER_SIZE * 1;
		playerRightArm.x = GlobalVariables.PLAYER_SIZE * 1;
		playerLeftLeg.x = GlobalVariables.PLAYER_SIZE * 1;
		playerRightLeg.x = GlobalVariables.PLAYER_SIZE * 1;
	}
	
	function animatePlayerDead():Void
	{
		playerHelmet.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel1;
		playerArmorUpper.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel1;		
		playerArmorLower.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel2;
		playerLeftArm.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel1;
		playerRightArm.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel1;
		playerLeftLeg.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel3;
		playerRightLeg.y = GlobalVariables.PLAYER_SIZE * deadAnimationLevel3;
		
		if (deadAnimationLevel0 < 3) deadAnimationLevel0++;
		if (deadAnimationLevel1 < 3) deadAnimationLevel1++;
		if (deadAnimationLevel2 < 3) deadAnimationLevel2++;
		if (deadAnimationLevel3 < 3) deadAnimationLevel3++;

	}
	
    public override function update()
    {
		super.update();
		handleInput();
		move();
		playerAnimate();
    }
	
	private static inline var maxMoveDelay:Int = 3;
	
	public var velocityX:Int;
	public var velocityY:Int;
	private var previousVelocityX:Int = 0;
	private var currentMoveDelay:Int = 0;
	private var playerJumpingCounter:Int = 0;
	private var playerJumping:Bool = false;
	private var userInput:InputHandler;
	private var animateCounter:Int = 0;
	
	private var deadAnimationLevel0 = 0;
	private var deadAnimationLevel1 = 1;
	private var deadAnimationLevel2 = 2;
	private var deadAnimationLevel3 = 3;
	
	private static var RIGHTHANDSTANDINGX:Int = 3;
	private static var LEFETHANDSTANDINGX:Int = -1;
	private static var RIGHTHANDMOVINGX:Int = 2;
	private static var LEFETHANDMOVINGX:Int = 0;
	
	private var itemActivate:Bool = false;
	private var itemActivateCounter:Int = 0;
	
	// public
	public var leftHandX:Int = 0;
	public var leftHandY:Int = 0;
	public var rightHandX:Int = 0;
	public var rightHandY:Int = 0;
	
	public var ui:UI;
	
	public var playerMaxHealth:Float = 10;
	public var playerMaxMana:Float = 10;
	public var playerHealth:Float;
	public var playerMana:Float;
	public var playerJumpHeight:Int = 13;
	
	public var playerHelmetColor:Int = 0x666666;
	public var playerArmorUpperColor:Int = 0x7f7f7f;
	public var playerArmorLowerColor:Int = 0x7f7f7f;
	public var playerRightArmColor:Int = 0x666666;
	public var playerLeftArmColor:Int = 0x666666;
	public var playerRightLegColor:Int = 0x666666;
	public var playerLeftLegColor:Int = 0x666666;
	
	public var playerDead:Bool = false;
	
	public var playerHelmet:Image;
	public var playerArmorUpper:Image;
	public var playerArmorLower:Image;
	public var playerRightArm:Image;
	public var playerLeftArm:Image;
	public var playerRightLeg:Image;
	public var playerLeftLeg:Image;
	
	public var equipped : Array<Item> = new Array();
	public var inventory: Array<Item> = new Array();
}