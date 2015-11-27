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

    // this.makeGraphic(50, 20, FlxColor.TRANSPARENT, true);
    this.loadGraphic( "assets/images/pot-back.png" ).scale.set(0.5, 0.5);
    // this.drawEllipse(100, 370, 100, 30, 0xFF889922, null, { color: 0xFF889922, alpha: 1 });
    // var pot = new FlxSprite().loadGraphic("assets/images/pot-front.png");
    // pot.x = 300;
    // pot.y = 300;
    // this.tween = FlxTween.tween(this, { x: this.x , y: this.y -10 }, 2);

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
