{ config, lib, pkgs, ... }:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.kdanne = {
        isNormalUser = true;
        description = "Kevin Danne";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };
    programs.zsh.enable = true; # TODO shell = pkgs.zsh not working without this line

    # Download and set font
    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

    # Define home-manager settings
    home-manager.users.kdanne = {
        # set version for setting defaults
        home.stateVersion = "24.05";

        # Include the nix modules for this host
        imports = [
            ../../modules/home-manager/kitty.nix
            ../../modules/home-manager/zsh.nix
            ../../modules/home-manager/git.nix
            ../../modules/home-manager/neovim.nix
        ];

        # install home packages
        home.packages = with pkgs; [
            gcc
            stow
            wget
            unzip
            nodejs
            ripgrep
            rustup
            nh
            btop
            brave
            spotify
        ];

        # Set gtk settings
        gtk = {
            enable = true;

            iconTheme = {
                name = "WhiteSur-dark";
                package = pkgs.whitesur-icon-theme;
            };

            cursorTheme = {
                name = "WhiteSur-cursors";
                package = pkgs.whitesur-cursors;
            };

            gtk3.extraConfig = {
                Settings = ''
                    gtk-application-prefer-dark-theme=1
                '';
            };

            gtk4.extraConfig = {
                Settings = ''
                    gtk-application-prefer-dark-theme=1
                '';
            };
        };

        # Enable and create xdg user dirs
        xdg.userDirs.enable = true;
        xdg.userDirs.createDirectories = true;
    };
}
