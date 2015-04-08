package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.FlxRandom;

class DustEmitter extends FlxEmitter
{
  private var _particle:FlxParticle;

  public function new(X:Float=0, Y:Float=0, Size:Int=100)
  {
    super(X, Y, Size);

    setXSpeed(Platform.SCROLL_VELOCITY - 10, Platform.SCROLL_VELOCITY + 10);
    setYSpeed(-20, -120);

    width = 16;

    gravity = 800;



    for (i in 0...(Math.floor(Size/2)))
    {
      _particle = new FlxParticle();
      _particle.makeGraphic(2, 2, FlxColor.WHITE);
      // Make sure the particle doesn't show up at (0, 0)
      _particle.visible = false;
      this.add(_particle);
      _particle = new FlxParticle();
      _particle.makeGraphic(1, 1, FlxColor.WHITE);
      _particle.visible = false;
      this.add(_particle);
    }

  }

}
