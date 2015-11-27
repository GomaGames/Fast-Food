import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

using Lambda;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var num_players:Int;
  private var left_spots:Array<Spot>;
  private var right_spots:Array<Spot>;
  private var left_current:Spot;
  private var right_current:Spot;

  public function new(num_players){
    this.num_players = num_players;
    this.left_spots = new Array<Spot>();
    this.right_spots = new Array<Spot>();

    super();
  }

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
    add(new FlxText(400, 300, 800, "Play State", 26));
    add(new FlxText(400, 350, 800, '${this.num_players} Players', 26));


    // setup four spots on left
    for(i in 0...4){
      var new_spot = new Spot(SpotSide.LEFT);
      new_spot.x = ( 70*i ) + 100;
      new_spot.y = 500;
      this.left_spots.push(new_spot);
      add(new_spot);
    }

    // setup four spots on right
    for(i in 0...4){
      var new_spot = new Spot(SpotSide.RIGHT);
      new_spot.x = ( 70*i ) + 500;
      new_spot.y = 500;
      this.right_spots.push(new_spot);
      add(new_spot);
    }

    // setup the left and right current spots
    left_current = new Spot(SpotSide.LEFT);
    left_current.x = 90;
    left_current.y = 90;
    add(left_current);

    right_current = new Spot(SpotSide.RIGHT);
    right_current.x = 890;
    right_current.y = 90;
    add(right_current);


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

    /*
      main game logic here

      pressing any of the keys will "whack"
        determine:
          - what was at that position
          - then evaluate result
          - then bring up the next set
            - if last was right, go fast
            - if last was wrong, bring up next set slowly

    */

    if (FlxG.keys.justPressed.A) { whack(left_spots[0]); }
    if (FlxG.keys.justPressed.S) { whack(left_spots[1]); }
    if (FlxG.keys.justPressed.D) { whack(left_spots[2]); }
    if (FlxG.keys.justPressed.F) { whack(left_spots[3]); }

    ////////////////////////////// ^^ Left ^^  vv Right vv

    if (FlxG.keys.justPressed.J) { whack(right_spots[0]); }
    if (FlxG.keys.justPressed.K) { whack(right_spots[1]); }
    if (FlxG.keys.justPressed.L) { whack(right_spots[2]); }
    if (FlxG.keys.justPressed.SEMICOLON) { whack(right_spots[3]); }

		super.update();
	}


  private inline function whack( spot:Spot ):Void
  {
    /*
      evaluate points depending on num_players game type
    */

  }
}
