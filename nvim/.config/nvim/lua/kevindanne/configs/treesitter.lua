-- Setup
require 'nvim-treesitter.configs'.setup {
    ensure_installed  = {
      'bash',
      'vim',
      'help',
      'comment',
      'html',
      'css',
      'scss',
      'javascript',
      'typescript',
      'tsx',
      'vue',
      'php',
      'json',
      'yaml',
      'toml',
      'markdown',
      'make',
      'lua',
      'c',
      'cpp',
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
