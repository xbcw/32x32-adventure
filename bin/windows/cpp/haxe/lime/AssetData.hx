package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("gfx/debug/console_debug.png", "gfx/debug/console_debug.png");
			type.set ("gfx/debug/console_debug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_hidden.png", "gfx/debug/console_hidden.png");
			type.set ("gfx/debug/console_hidden.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_logo.png", "gfx/debug/console_logo.png");
			type.set ("gfx/debug/console_logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_output.png", "gfx/debug/console_output.png");
			type.set ("gfx/debug/console_output.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_pause.png", "gfx/debug/console_pause.png");
			type.set ("gfx/debug/console_pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_play.png", "gfx/debug/console_play.png");
			type.set ("gfx/debug/console_play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_step.png", "gfx/debug/console_step.png");
			type.set ("gfx/debug/console_step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug/console_visible.png", "gfx/debug/console_visible.png");
			type.set ("gfx/debug/console_visible.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/preloader/haxepunk.png", "gfx/preloader/haxepunk.png");
			type.set ("gfx/preloader/haxepunk.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("font/04B_03__.ttf", "font/04B_03__.ttf");
			type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("graphics/player.png", "graphics/player.png");
			type.set ("graphics/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("font/04B_03__.ttf", "font/04B_03__.ttf");
			type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
