package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.util.FlxColor;

class Coin extends FlxSprite
{

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    makeGraphic(8, 8, FlxColor.YELLOW);

    velocity.x = Platform.SCROLL_VELOCITY;
  }

  override public function update():Void
  {
    super.update();
  }


}
