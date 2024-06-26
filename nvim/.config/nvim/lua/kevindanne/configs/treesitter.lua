-- Setup
require 'nvim-treesitter.configs'.setup {
    ensure_installed  = {
      'vim',
      'vimdoc',
      'bash',
      'comment',
      'html',
      'css',
      'scss',
      'javascript',
      'typescript',
      'tsx',
      'json',
      'yaml',
      'toml',
      'markdown',
      'cmake',
      'make',
      'lua',
      'c',
      'cpp',
      'c_sharp',
      'rust',
      'go',
      'gomod',
    },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
