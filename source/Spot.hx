import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;

using flixel.util.FlxSpriteUtil;

class Spot extends FlxSpriteGroup
{
  public var side:SpotSide;
  public var content:SpotContent; // initially null
  public var tween: FlxTween;
  private var graphic:FlxSprite;
  private var label:FlxText;

  public function new(side:SpotSide, ?label:String){
    this.side = side;
    this.content = SpotContent.NONE;
    this.graphic = new FlxSprite();
    super();

    var pot_back = new FlxSprite().loadGraphic("assets/images/pot-back.png");
    pot_back.scale.set(0.5,0.5);
    add(pot_back);

    this.graphic.loadGraphic( "assets/images/blank.png" ).scale.set(0.5, 0.5);
    add(this.graphic);

    var pot_front = new FlxSprite();
    pot_front.loadGraphic( "assets/images/pot-front.png" ).scale.set(0.5, 0.5);
    add(pot_front);

    if(label != null){
      this.label = new FlxText(108, 400, 80, label, 18);
      this.label.setFormat(null, 18, 0x000000);
      add(this.label);
    }
  }

  override public function update():Void
  {

    switch (this.content) {
      case SpotContent.TURKEY: this.graphic.loadGraphic("assets/images/turkey.png");
      case SpotContent.SQUASH: this.graphic.loadGraphic("assets/images/squash.png");
      case SpotContent.PUMPKIN: this.graphic.loadGraphic("assets/images/pumpkin.png");
      case SpotContent.CORN: this.graphic.loadGraphic("assets/images/corn.png");
      default: this.graphic.loadGraphic("assets/images/blank.png");
    }
    super.update();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

}
