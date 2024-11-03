{ lib, config, ... }:

{
    # Nvidia hardware settings
    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
    };
    hardware.nvidia-container-toolkit.enable = true;

    # Enable nvidia drivers for xserver
    services.xserver.videoDrivers = [ "nvidia" ];
}
