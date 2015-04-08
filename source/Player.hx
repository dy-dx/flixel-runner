package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
  public var speed:Float = 4;

  var GRAVITY:Int = 800;
  var JUMP_SPEED:Int = -300;
  var DRAG:Int = 200;

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    makeGraphic(16, 16, FlxColor.BLUE);
    solid = true;

    drag.x = drag.y = DRAG;
    acceleration.y = GRAVITY;
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

    if (_up && isTouching(flixel.FlxObject.FLOOR))
    {
      this.velocity.y = JUMP_SPEED;
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
