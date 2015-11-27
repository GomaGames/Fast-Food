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
  private var pot:FlxSprite;
  private var label:FlxText;

  public function new(side:SpotSide, ?label:String){
    this.side = side;
    this.content = SpotContent.NONE;
    this.pot = new FlxSprite();
    super();

    this.pot.loadGraphic( "assets/images/blank.png" ).scale.set(0.5, 0.5);
    add(this.pot);

    if(label != null){
      this.label = new FlxText(108, 400, 80, label, 18);
      this.label.setFormat(null, 18, 0x000000);
      add(this.label);
    }
  }

  override public function update():Void
  {

    switch (this.content) {
      case SpotContent.TURKEY: this.pot.loadGraphic("assets/images/turkey.png");
      case SpotContent.SQUASH: this.pot.loadGraphic("assets/images/squash.png");
      case SpotContent.PUMPKIN: this.pot.loadGraphic("assets/images/pumpkin.png");
      case SpotContent.CORN: this.pot.loadGraphic("assets/images/corn.png");
      default: this.pot.loadGraphic("assets/images/blank.png");
    }
    super.update();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

}
