package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxRandom;

class PlatformGroup extends FlxTypedGroup<Platform>
{
  public function new(X:Float=0, Y:Float=0)
  {
    super();
    this.maxSize = 20;

    var platform = new Platform();
    this.add(platform);

    addNextPlatform(true);
  }

  override public function update():Void
  {
    if (getLastPlatform().x < 700)
    {
      addNextPlatform();
    }
    super.update();
  }

  private function getLastPlatform():Platform
  {
    return this.members[this.length-1];
  }

  private function makeOrRecyclePlatform():Platform
  {
    var platform = this.getFirstAvailable(Platform, true);
    if (platform != null)
    {
      this.remove(platform, true);
      platform.exists = true;
    }
    else
    {
      platform = new Platform();
    }

    return platform;
  }

  public function addNextPlatform(useDefaults:Bool = false):Void
  {
    var lastPlatform = getLastPlatform();
    var nextPlatform = makeOrRecyclePlatform();

    nextPlatform.y = Platform.DEFAULT_Y;
    nextPlatform.x = lastPlatform.x + 128 - 1; // 1px gap sometimes

    if (!useDefaults)
    {
      if (FlxRandom.float() < 0.25)
      {
        nextPlatform.y -= 64;
      }

      if (FlxRandom.float() < 0.1)
      {
        nextPlatform.x += 128;
      }
    }

    this.add(nextPlatform);
  }
}
