# Dotfiles

## Getting Started

1. Start a new nix-shell with the git package

```bash
nix-shell -p git
```

2. Clone the repository to ~/.dotfiles:

```bash
git clone https://github.com/KevinDanne/Dotfiles.git ~/.dotfiles
```

3. Rebuild your nixos system

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles/nix#default
```

## How to update

1. Update your dotfiles

```bash
cd ~/.dotfiles && git pull
```

2. Rebuild your nixos system by using nh (recommended) or nixos-rebuild

    2.1 [nh cli](https://github.com/viperML/nh) (recommended)
    ```bash
    nh os switch -H default ~/.dotfiles/nix
    ```
    
    2.2 nixos cli
    ```bash
    sudo nixos-rebuild switch --flake ~/.dotfiles/nix#default
    ```

