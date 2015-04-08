package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var _hud:HUD;
  private var _platformGroup:PlatformGroup;
  private var _player:Player;
  private var _dustEmitter:DustEmitter;

  /**
   * Function that is called up when to state is created to set it up.
   */
  override public function create():Void
  {
    FlxG.mouse.visible = false;

    _dustEmitter = new DustEmitter();

    _player = new Player(80, 200);
    _player.dustEmitter = _dustEmitter;
    add(_player);

    add(_dustEmitter);

    _platformGroup = new PlatformGroup();
    add(_platformGroup);

    _hud = new HUD();
    add(_hud);

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
    FlxG.collide(_player, _platformGroup);
  }

}
