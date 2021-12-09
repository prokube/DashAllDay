package;

import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxSubState;

class SecretSongNoticeSubstate extends FlxSubState
{
    var specialsOverlay:FlxSprite;
    var specialsText:FlxText;

    public function new()
    {
        trace('opened the substate-ish?');
        super();
    }
    override function create()
    {
        trace('its open??? i woke???');
        checkSpecials();
		specialsOverlay = new FlxSprite(0, 0).makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK);
		specialsText = new FlxText(0, FlxG.height * 0.69, FlxG.width, ("SECRET CHARACTER(S) UNLOCKED!\n\n" + specialsUnlocked + "\n\nHave fun!"));
		specialsText.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

		specialsText.screenCenter(X);

		specialsOverlay.alpha = 0;
        specialsText.alpha = 0;

		add(specialsOverlay);
		add(specialsText);

		FlxTween.tween(specialsOverlay, {alpha: 0.7}, 0.2, {
			ease: FlxEase.quadOut		
		});

		FlxTween.tween(specialsText, {alpha: 1}, 0.2, {
			ease: FlxEase.quadOut		
		});

        MainMenuState.instance.acceptsInput = false;
		super.create();

        trace('LETS GOOOOO IT GOT MADED');
	}
	var specialsUnlocked:String = "";

	function checkSpecials()
	{
		SpecialCheck.checkSpecials();

		if (ClientPrefs.secretChars[0])
			specialsUnlocked += "Cally Cobble\n";
		if (ClientPrefs.secretChars[1])
			specialsUnlocked += "Mura / Woops\n";
		if (ClientPrefs.secretChars[2])
			specialsUnlocked += "Merg\n";
		if (ClientPrefs.secretChars[3])
			specialsUnlocked += "???\n";
	}

    override function update(elapsed:Float)
    {
        if (FlxG.keys.anyJustPressed([ENTER, ESCAPE, BACKSPACE, SPACE]))
        {
            trace('closed');
            MainMenuState.instance.acceptsInput = true;
            FlxTween.tween(specialsText, {alpha: 0}, 1, {ease: FlxEase.expoInOut});
		    FlxTween.tween(specialsOverlay, {alpha: 0}, 1.1, {
			    ease: FlxEase.expoInOut,
			    onComplete: function(flx:FlxTween)
			    {
			    	close();
			    }
		    });
            
        }
        super.update(elapsed);
    }
}