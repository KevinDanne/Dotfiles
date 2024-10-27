{ config, lib, ... }:

{
    programs.kitty = {
        enable = true;
        font = {
            name = "Hack Nerd Font";
            size = 13;
        };
        #themeFile = "Carbonfox"; Carbonfox is currently unavailable
        themeFile = "Nightfox";
    };
}
