local key_mapper = require 'kevindanne.utils'.key_mapper

-- togglerust hightlight groups
vim.api.nvim_set_hl(0, 'ToggleRustErr', { fg = 'red' })
vim.api.nvim_set_hl(0, 'ToggleRustWarn', { fg = 'orange' })

-- Keybinds
key_mapper('n', '<Leader>b', ':Compile<CR>')
key_mapper('n', '<Leader>r', ':Cargo run<CR>')
key_mapper('n', '<Leader>rt', ':RustTest<CR>')
key_mapper('n', '<Leader>tt', ':DebugTest<CR>')
