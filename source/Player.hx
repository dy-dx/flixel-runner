package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
  public var speed:Float = 8;

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    makeGraphic(16, 16, FlxColor.BLUE);
    drag.x = drag.y = 1600;
  }

  override public function update():Void
  {
    movement();
    super.update();
  }

  private function movement():Void
  {
    var _up:Bool = false;
    var _down:Bool = false;
    var _left:Bool = false;
    var _right:Bool = false;

    _up    = FlxG.keys.anyPressed(["UP", "W"]);
    _down  = FlxG.keys.anyPressed(["DOWN", "S"]);
    _left  = FlxG.keys.anyPressed(["LEFT", "A"]);
    _right = FlxG.keys.anyPressed(["RIGHT", "D"]);

    // todo: cancel out if 2 opposing keys are pressed at the same time

    // todo: prevent diagonal motion from moving player 2x as fast

    var vX:Float = 0;
    var vY:Float = 0;
    if (_up)
    {
      this.y += -speed;
    }
    else if (_down)
    {
      this.y += speed;
    }

    if (_left)
    {
      this.x += -speed;
    }
    else if (_right)
    {
      this.x += speed;
    }
  }
}
