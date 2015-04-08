package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.util.FlxColor;
import flixel.input.touch.FlxTouch;

class Player extends FlxSprite
{
  var initX:Float;
  var initY:Float;

  var lastVelocity:FlxPoint;

  var GRAVITY:Int = 800;
  var JUMP_SPEED:Int = -400;

  public var dustEmitter:DustEmitter;

  public function new(X:Float=0, Y:Float=0)
  {
    super(X, Y);
    initX = X;
    initY = Y;

    lastVelocity = new FlxPoint(0, 0);

    makeGraphic(16, 16, FlxColor.BLUE);
    solid = true;
    collisonXDrag = false;

    acceleration.y = GRAVITY;
  }

  override public function update():Void
  {
    animateCollision();
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
    velocity.set(0, 0);
    lastVelocity.copyFrom(velocity);
  }

  private function shouldBeDead():Bool
  {
    return outOfBounds() || isTouching(FlxObject.RIGHT);
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

    lastVelocity.copyFrom(velocity);
  }

  private function outOfBounds():Bool
  {
    return this.y > 500 || this.y < -50;
  }

  private function animateCollision():Void
  {
    var shakeY = Math.abs(lastVelocity.y - velocity.y)/30000;
    var shakeAmount = shakeY + Math.abs(lastVelocity.x - velocity.x)/30000;

    if (shakeAmount > 0.01 && justTouched(FlxObject.ANY))
    {
      FlxG.camera.shake(shakeAmount, 0.1);
    }

    if (justTouched(FlxObject.FLOOR) && dustEmitter != null)
    {
      dustEmitter.x = x+8;
      dustEmitter.y = y+15;
      // Emit particles proportionally to the y impact
      var numParticles = 8 + Math.floor(Math.min(30, shakeY*1000));

      var period = 0.08;
      var frequency = period / numParticles;

      dustEmitter.start(false, 1.5, frequency, numParticles);
    }
  }
}
