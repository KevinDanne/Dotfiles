-- Helper function to ensure packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')

-- Load/Install plugins
return packer.startup(function(use)
    -- Plugin manager
    use { 'wbthomason/packer.nvim' }

    -- Syntax Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Theme
    use 'EdenEast/nightfox.nvim'

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- LSP integration
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    }

    -- LSP Pictograms
    use 'onsails/lspkind-nvim'

    -- Auto completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-buffer',
        }
    }

    -- Snippets
    use {
        'hrsh7th/vim-vsnip',
        requires = { 'rafamadriz/friendly-snippets' }
    }

    -- Debugger
    use {
        "rcarriga/nvim-dap-ui", 
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
        }
    }

    -- Surround
    use 'tpope/vim-surround'

    -- Commenter
    use 'tpope/vim-commentary'

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
      packer.sync()
    end
end)
