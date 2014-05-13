import com.haxepunk.Engine;
import com.haxepunk.HXP;
import flash.display.StageScaleMode;
import flash.events.Event;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.scene = new MainScene();
	}
	
	override public function resize()
	{
		HXP.screen.scaleX = HXP.screen.scaleY = GlobalVariables.SCREEN_SCALE;
		HXP.resize(HXP.stage.stageWidth, HXP.stage.stageHeight);
	}
	
	public static function main() { new Main(); }

}