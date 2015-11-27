import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Spot extends FlxSprite
{
  public var side:SpotSide;

  public function new(side:SpotSide){
    this.side = side;
    super();

    this.makeGraphic(50, 20, FlxColor.TRANSPARENT, true);
    this.drawEllipse(0, 0, 50, 20, 0xFF889922, null, { color: 0xFF889922, alpha: 1 });
  }

  override public function update():Void
  {
    super.update();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

}
