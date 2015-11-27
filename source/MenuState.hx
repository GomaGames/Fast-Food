package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
    bgColor = 0xffffffff;
    add(new FlxText(400, 300, 800, "Fast Food", 26));

    var one_player = new FlxButton(200, 400, "One Player", select_one_player);
    one_player.setGraphicSize(200);
    one_player.updateHitbox();
    add(one_player);

    var two_players = new FlxButton(600, 400, "Two Players", select_two_players);
    two_players.setGraphicSize(200);
    two_players.updateHitbox();
    add(two_players);

    one_player.labelOffsets =
    two_players.labelOffsets = [
      new FlxPoint(55,18),
      new FlxPoint(55,18),
      new FlxPoint(55,18)
    ];

		super.create();
	}

  private function select_one_player():Void
  {
    FlxG.switchState(new PlayState(1));
  }

  private function select_two_players():Void
  {
    FlxG.switchState(new PlayState(2));
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
