# Dotfiles

## Getting Started
1. Clone the repository to ~/.dotfiles:

```bash
git clone https://github.com/KevinDanne/Dotfiles.git ~/.dotfiles
```

2. Rebuild your nixos system

    2.1 [nh cli](https://github.com/viperML/nh)
    ```bash
    nh os switch -H default ~/.dotfiles/nix
    ```
    
    2.2 nixos cli
    ```bash
    nixos-rebuild switch --flake ~/.dotfiles/nix#default
    ```
