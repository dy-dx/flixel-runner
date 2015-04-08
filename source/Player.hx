package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.touch.FlxTouch;

class Player extends FlxSprite
{
  var initX:Float;
  var initY:Float;

  var GRAVITY:Int = 800;
  var JUMP_SPEED:Int = -400;
  var DRAG:Int = 200;

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    initX = X;
    initY = Y;

    makeGraphic(16, 16, FlxColor.BLUE);
    solid = true;

    drag.x = drag.y = DRAG;
    acceleration.y = GRAVITY;
  }

  override public function update():Void
  {
    movement();
    checkDeath();
    super.update();
  }

  private function movement():Void
  {
    var _up:Bool = FlxG.keys.anyPressed(["UP", "W", "SPACE"]);

    var touched:FlxTouch = FlxG.touches.getFirst();

    _up = _up || (touched != null);

    if (_up && isTouching(flixel.FlxObject.FLOOR))
    {
      this.velocity.y = JUMP_SPEED;
    }

  }

  private function checkDeath():Void
  {
    if (this.y > 500)
    {
      this.x = initX;
      this.y = initY;
      this.velocity.y = 0;
    }
  }
}
