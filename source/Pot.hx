import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;

using flixel.util.FlxSpriteUtil;

class Pot extends FlxSprite
{
  public function new(){
    super();

    // this.makeGraphic(50, 20, FlxColor.TRANSPARENT, true);
    this.loadGraphic( "assets/images/pot-front.png" ).scale.set(0.5, 0.5);
    this.drawEllipse(100, 370, 100, 30, 0xFF889922, null, { color: 0xFF889922, alpha: 1 });

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
