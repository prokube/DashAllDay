package;

import sys.FileSystem;
import lime.utils.Assets;
using StringTools;
class SpecialCheck
{
    public static final SPECIAL_CHARS:Array<String> =
    [
        "cally",
        "woops",
        "merg",
        "zephyrus"
    ];

    public static function checkSpecials()
    {
        var newSpecials:Array<Bool> = [false, false, false, false];
        for (charName in SPECIAL_CHARS)
        {
            if (FileSystem.exists("assets/special/" + charName.toLowerCase() + ".chr"))
            {
                trace('FUNNY SECRET FOUND, CONGRATS LMAO ' + charName);
                handleSpecial(charName);
                newSpecials[inx] = true;
            }
        }
    }

    public static var inx:Int=0;

    public static function handleSpecial(char:String)
    {
        var inx:Int=0;
        trace(char+' found');
        switch (char)
        {
            case "cally":
                ClientPrefs.secretChars[0] = true;
            case "woops":
                ClientPrefs.secretChars[1] = true;
                inx=1;
            case "merg":
                ClientPrefs.secretChars[2] = true;
                inx=2;
            case "zsh":
                ClientPrefs.secretChars[3] = true;
                inx=3;
        }
    }
}