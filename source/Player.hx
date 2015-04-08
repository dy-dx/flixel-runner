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

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    initX = X;
    initY = Y;

    makeGraphic(16, 16, FlxColor.BLUE);
    solid = true;
    collisonXDrag = false;

    acceleration.y = GRAVITY;
  }

  override public function update():Void
  {
    movement();
    if (alive)
    {
      if (shouldBeDead())
      {
        kill();
      }
      else
      {
        Reg.score += 1;
      }
    }
    if (outOfBounds())
    {
      this.reset(initX, initY);
    }
    super.update();
  }

  override public function kill():Void
  {
    this.alive = false;
  }

  override public function reset(X:Float, Y:Float):Void
  {
    super.reset(X, Y);
    this.velocity.y = 0;
    this.velocity.x = 0;
  }

  private function shouldBeDead():Bool
  {
    return outOfBounds() || isTouching(flixel.FlxObject.RIGHT);
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

  private function outOfBounds():Bool
  {
    return this.y > 500 || this.y < -50;
  }
}
