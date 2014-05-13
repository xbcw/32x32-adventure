import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.HXP;
import entities.UI;
import flash.geom.Point;
import com.haxepunk.tmx.TmxEntity;
import entities.Enemy;
import entities.Player;


class MainScene extends Scene
{
	 public function new()
	 {
		super();
		
		HXP.world.camera.x = 0;
		HXP.world.camera.y = -GlobalVariables.SCREEN_SIZE_Y / 2;
		
		createMap();
		
		add(GlobalVariables.PLAYER);
		add(GlobalVariables.PLAYER.ui);
		
		GlobalVariables.PLAYER.addToInventory(new entities.items.wieldable.Sword(GlobalVariables.PLAYER.rightHandX, GlobalVariables.PLAYER.rightHandY, "right"));
		GlobalVariables.PLAYER.addToInventory(new entities.items.wieldable.Shield(GlobalVariables.PLAYER.leftHandX, GlobalVariables.PLAYER.leftHandY, "left"));
		
		enemy01 = new Enemy(45, 16);
/*		var enemy : Array<Enemy> = new Array();
		for (i in 0...10)
		{
			enemy[i] = new Enemy(Std.random(32), Std.random(32));
			var e:Entity = enemy[i].collide("terrain", enemy[i].x, enemy[i].y);
			while (e != null)
			{
				enemy[i] = new Enemy(Std.random(64), Std.random(32));
				e = enemy[i].collide("terrain", enemy[i].x, enemy[i].y);
				trace("Spawned inside terrain, respawning");
			}
			add(enemy[i]);
		}*/
		add(enemy01);
	 }
	 
	private function createMap()
	{
		// load parallax
		var b:Backdrop = new Backdrop("graphics/caveparallax.png", true, true);
		b.x = GlobalVariables.SCREEN_POS_X;
		b.y = GlobalVariables.SCREEN_POS_Y;
		b.scrollX = 0.1;
		b.scrollY = 0.1;
		var e:Entity = new Entity();
		e.graphic = b;
		e.layer = GlobalVariables.BACKGROUND_LAYER;
		add(e);
		
		// create the map
		var e = new TmxEntity("maps/testCave.tmx");
		e.x = GlobalVariables.SCREEN_POS_X;
		e.y = GlobalVariables.SCREEN_POS_Y;
		e.layer = GlobalVariables.DEFAULT_LAYER;
		// load layers named bottom, main, top with the appropriate tileset
		e.loadGraphic("graphics/visibonepallet.png", ["collidible", "non-collidible"]);

		// loads a grid layer named collision and sets the entity type to terrain
		e.loadMask("collidible", "terrain");

		add(e);
	}
	 
	 override public function update()
	 {		
		super.update();
	 }
	 
	 public var enemy01:Enemy;
 }