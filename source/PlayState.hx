package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var num_players:Int;

  public function new(num_players){
    this.num_players = num_players;
    super();
  }

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
    add(new FlxText(400, 300, 800, "Play State", 26));
    add(new FlxText(400, 350, 800, '${this.num_players} Players', 26));
		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}
}
