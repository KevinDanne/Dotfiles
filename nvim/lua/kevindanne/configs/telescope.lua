local builtin = require('telescope.builtin')

-- Keybinds
local key_mapper = require 'kevindanne.utils'.key_mapper

key_mapper('n', '<C-p>', builtin.find_files)
key_mapper('n', '<leader>fg', builtin.live_grep)
key_mapper('n', '<leader>fb', builtin.buffers)
key_mapper('n', '<leader>fh', builtin.help_tags)
