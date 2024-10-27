{ lib, config, ... }:

{
    programs.git = {
        enable = true;
        userEmail = "it@kevindanne.com";
        userName = "Kevin Danne";
    };
}
