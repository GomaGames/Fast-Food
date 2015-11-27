import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;

using flixel.util.FlxSpriteUtil;

class Spot extends FlxSprite
{
  public var side:SpotSide;
  public var content:SpotContent; // initially null
  public var tween: FlxTween;

  public function new(side:SpotSide){
    this.side = side;
    this.content = SpotContent.NONE;
    super();

    this.loadGraphic( "assets/images/blank.png" ).scale.set(0.5, 0.5);

  }

  override public function update():Void
  {

    switch (this.content) {
      case SpotContent.TURKEY: this.loadGraphic("assets/images/turkey.png");
      case SpotContent.SQUASH: this.loadGraphic("assets/images/squash.png");
      case SpotContent.PUMPKIN: this.loadGraphic("assets/images/pumpkin.png");
      case SpotContent.CORN: this.loadGraphic("assets/images/corn.png");
      default: this.loadGraphic("assets/images/blank.png");
    }
    super.update();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

}
