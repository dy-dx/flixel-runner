package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var _player:Player;
  private var platforms:FlxTypedGroup<Platform>;

  /**
   * Function that is called up when to state is created to set it up.
   */
  override public function create():Void
  {
    FlxG.mouse.visible = false;

    _player = new Player(80, 200);
    add(_player);

    platforms = new FlxTypedGroup();
    platforms.maxSize = 20;

    var platform = new Platform(80, 216);
    var platform2 = new Platform(80+128, 216);
    platforms.add(platform);
    platforms.add(platform2);

    add(platforms);

    super.create();
  }

  /**
   * Function that is called when this state is destroyed - you might want to
   * consider setting all objects this state uses to null to help garbage collection.
   */
  override public function destroy():Void
  {
    super.destroy();
  }

  /**
   * Function that is called once every frame.
   */
  override public function update():Void
  {
    super.update();
    addPlatform();
    FlxG.collide(_player, platforms);
  }

  function addPlatform():Void
  {
    var lowerH = 216;
    var upperH = 216 - 64;

    var lastPlatform:Platform = platforms.members[platforms.length-1];
    if (lastPlatform.x > 700)
    {
      return;
    }

    var platform:Platform = platforms.getFirstAvailable(Platform, true);
    if (platform != null)
    {
      platforms.remove(platform, true);
      platform.exists = true;
    }
    else
    {
      platform = new Platform();
    }

    platform.y = lowerH;
    platform.x = lastPlatform.x + 128;

    if (FlxRandom.float() < 0.25)
    {
      platform.y = upperH;
    }

    if (FlxRandom.float() < 0.1)
    {
      platform.x += 128;
    }

    platforms.add(platform);
  }
}
