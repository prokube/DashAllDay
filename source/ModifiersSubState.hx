package;

import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUISlider;
import flixel.addons.ui.FlxUISubState;
import flixel.addons.ui.FlxUITabMenu;
import flixel.FlxG;

class ModifiersSubState extends MusicBeatSubstate
{
    var uiBox:FlxUITabMenu;

    var rate:Float = 1;

    override function create()
    {
        FlxG.mouse.visible = true;
        var tabs = [
			{name: "difficulty", label: 'Difficulty'},
			{name: "special", label: 'Special'}
		];
        uiBox = new FlxUITabMenu(null, tabs, true);
        
        uiBox.resize(1280 - 48, 720 - 72);
		uiBox.x = 24;
		uiBox.y = 24;
		uiBox.scrollFactor.set();

        add(uiBox);

        uiTabDifficulty();
        
        super.create();
    }

    function uiTabDifficulty()
    {
        var rateSlider:FlxUINumericStepper = new FlxUINumericStepper(16, 16, 0.05, 1.0, 0.5, 2.0, 2);
        rateSlider.value = rate;
        rateSlider.name = 'rate';

        var difficultyUI:FlxUI = new FlxUI(null, uiBox);
        difficultyUI.name = "Difficulty";

        difficultyUI.add(rateSlider);

        uiBox.addGroup(difficultyUI);
    }


    override function update(elapsed:Float)
    {
        if (controls.BACK) {
            FlxG.mouse.visible = false;
            for (member in members)
                remove(member);
            close();
        }
        super.update(elapsed);
    }
}