package;

import entities.Player;

class GlobalVariables
{
	// Screen
	public static inline var SCREEN_SIZE_X = 32;
	public static inline var SCREEN_SIZE_Y = 32;
	public static inline var SCREEN_SCALE:Int = 16;
	public static inline var SCREEN_POS_X = 0;
	public static inline var SCREEN_POS_Y = 0;
	
	// UI
	public static inline var UI_X = 0;
	public static inline var UI_Y = 24;
	
	// Physics
	public static inline var GRAVITY:Float = 1;
	
	// Layers
	public static inline var DEFAULT_LAYER:Int = 10;
	public static inline var PLAYER_LAYER:Int = 8;
	public static inline var BACKGROUND_LAYER:Int = 99;
	
	// Player
	// pixels per part

	public static inline var PLAYER_SIZE = 1;
	public static var PLAYER = new Player(SCREEN_POS_X + SCREEN_SIZE_X/2, SCREEN_POS_Y + SCREEN_SIZE_Y/2);


}