import haxe.EnumTools;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.util.FlxRandom;

using Lambda;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private static inline var INITIAL_DELAY = 3.0; // 3 seconds at start of match
  private static inline var GOOD_NEXT_DELAY = 0.5; // in seconds
  private static inline var BAD_NEXT_DELAY = 1.75; // in seconds
  private static var LEFT_KEYS = ["A","S","D","F"];
  private static var RIGHT_KEYS = ["J","K","L",";"];

  private var num_players:Int;
  private var left_spots:Array<Spot>;
  private var right_spots:Array<Spot>;
  private var left_current:Spot;
  private var right_current:Spot;
  private var left_score:FlxText;
  private var right_score:FlxText;

  private var _player_1_score:Int;
  private var player_1_score(get,set):Int;
  private inline function get_player_1_score():Int{
    return this._player_1_score;
  }
  private inline function set_player_1_score(score:Int):Int{
    this._player_1_score = score;
    left_score.text = Std.string(this._player_1_score);
    return this._player_1_score;
  }

  private var _player_2_score:Int;
  private var player_2_score(get,set):Int;
  private inline function get_player_2_score():Int{
    return this._player_2_score;
  }
  private inline function set_player_2_score(score:Int):Int{
    this._player_2_score = score;
    left_score.text = Std.string(this._player_2_score);
    return this._player_2_score;
  }

  public function new(num_players){
    this.num_players = num_players;
    this.left_spots = new Array<Spot>();
    this.right_spots = new Array<Spot>();
    this._player_1_score = this._player_2_score = 0;

    super();
  }

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
    add(new FlxText(400, 300, 800, "Play State", 26));
    add(new FlxText(400, 350, 800, '${this.num_players} Players', 26));

    this.left_score = new FlxText(270, 300, 200, "0", 26);
    this.left_score.setFormat(null, 20, 0x000000);
    add(this.left_score);
    if(this.num_players == 2){
      this.right_score = new FlxText(800, 300, 200, "0", 26);
      this.right_score.setFormat(null, 20, 0x000000);
      add(this.right_score);
    }

    // setup four spots on left
    for(i in 0...4){
      var new_spot = new Spot(SpotSide.LEFT, LEFT_KEYS[i]);
      new_spot.x = ( 100*i ) + 30;
      new_spot.y = 220;
      this.left_spots.push(new_spot);
      add(new_spot);
    }
    // setup four spots on right
    for(i in 0...4){
      var new_spot = new Spot(SpotSide.RIGHT, RIGHT_KEYS[i]);
      new_spot.x = ( 100*i ) + 450;
      new_spot.y = 220;
      this.right_spots.push(new_spot);
      add(new_spot);
    }

    // setup the left and right current spots

    left_current = new Spot(SpotSide.LEFT);
    left_current.x = 10;
    left_current.y = -110;
    add(left_current);

    right_current = new Spot(SpotSide.RIGHT);
    right_current.x = 800;
    right_current.y = -110;
    add(right_current);

    new FlxTimer(INITIAL_DELAY, tick, 1);

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

  /*
    a set must be random, with at least one != NONE
    a current must be a random one of the set it belongs to
  */
  private inline function tick(timer:FlxTimer):Void
  {
    var contents = EnumTools.getConstructors(SpotContent);

    // empty spots first
    for(spot in left_spots.concat(right_spots)){
      spot.content = SpotContent.NONE;
    }

    // randomize all spots, until there's at least one content
    while(
        !left_spots.fold(function(spot, has_content){
          return has_content || spot.content != SpotContent.NONE;
        }, false)
    ){
      for(spot in left_spots){
        spot.content = EnumTools.createByIndex(SpotContent, FlxRandom.intRanged(0, contents.length-1));
      }
    }
    ////////////////////////////// ^^ Left ^^  vv Right vv
    while(
        !right_spots.fold(function(spot, has_content){
          return has_content || spot.content != SpotContent.NONE;
        }, false)
    ){
      for(spot in right_spots){
        spot.content = EnumTools.createByIndex(SpotContent, FlxRandom.intRanged(0, contents.length-1));
      }
    }

    // randomize current spots
    var left_not_empty_contents = left_spots.filter(function(spot){
      return spot.content != SpotContent.NONE;
    });
    left_current.content = left_not_empty_contents[ FlxRandom.intRanged(0, left_not_empty_contents.length-1) ].content;

    var right_not_empty_contents = right_spots.filter(function(spot){
      return spot.content != SpotContent.NONE;
    });
    right_current.content = right_not_empty_contents[ FlxRandom.intRanged(0, right_not_empty_contents.length-1) ].content;


    for(spot in left_spots.concat(right_spots)){
      spot.pop_up();
    }

  }

  private inline function whack( spot:Spot ):Void
  {
    /*
      evaluate points depending on num_players game type
      - then bring up the next set
        - if last was right, go fast
        - if last was wrong, bring up next set slowly
    */
    var next_delay:Float = 0.0; // in seconds

    if(spot.side == SpotSide.LEFT){
      if(spot.content == left_current.content){
        // good
        next_delay = GOOD_NEXT_DELAY;
        playerScore(1, 1);
      }else{
        // bad
        next_delay = BAD_NEXT_DELAY;
        playerScore(1, -5);
      }
    }else if(spot.side == SpotSide.RIGHT){
      if(spot.content == right_current.content){
        // good
        next_delay = GOOD_NEXT_DELAY;
        playerScore(2, 1);
      }else{
        // bad
        next_delay = BAD_NEXT_DELAY;
        playerScore(2, -5);
      }
    }

    new FlxTimer(next_delay, tick, 1);
  }

  // if only one player, player_num is always 1
  private inline function playerScore(player_num:Int, points:Int){
    if(this.num_players == 1) player_num = 1;
    if(player_num == 1){
      player_1_score += points;
    }else{
      player_2_score += points;
    }
  }
}
