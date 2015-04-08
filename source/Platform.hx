package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Platform extends FlxSprite
{

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    makeGraphic(128, 16, FlxColor.WHITE);
    solid = true;
    immovable = true;
  }

  override public function update():Void
  {
    super.update();
  }

}
