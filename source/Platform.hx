package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Platform extends FlxSprite
{
  var SCROLL_SPEED:Int = 5;

  public static var DEFAULT_X:Int = 80;
  public static var DEFAULT_Y:Int = 216;

  public function new(?x:Int, ?y:Int)
  {
    if (x == null) { x = 0; }
    if (y == null) { y = DEFAULT_Y; }
    super(x, y);
    makeGraphic(128, 16, FlxColor.WHITE);
    solid = true;
    immovable = true;
  }

  override public function update():Void
  {
    x -= this.SCROLL_SPEED;
    if (x < 0 - 128)
    {
      this.exists = false;
    }
    super.update();
  }

}
