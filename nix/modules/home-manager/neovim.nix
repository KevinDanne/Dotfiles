{ config, lib, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        plugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
            nightfox-nvim
            telescope-nvim
            nvim-lspconfig
            lspkind-nvim
            nvim-cmp
            cmp-nvim-lsp
            cmp-nvim-lsp-signature-help
            cmp-vsnip
            cmp-buffer
            vim-vsnip
            nvim-dap-ui
            nvim-dap
            nvim-nio
            vim-surround
            vim-commentary
        ];
        extraPackages = with pkgs; [
            rust-analyzer
        ];
        extraLuaConfig = ''
            local nvim_config_directory = os.getenv("HOME") .. "/.dotfiles/nvim/lua"
            package.path = package.path .. ";" .. nvim_config_directory .. "/?.lua"

            require "kevindanne.init"
        '';
    };
}
