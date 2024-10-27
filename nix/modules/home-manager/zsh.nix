{ config, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ "git" ];
        };
    };
}