-- Setup
require('telescope').setup{
    defaults = {
        path_display = {"truncate"}
    }
}

-- Keybinds
local key_mapper = require 'kevindanne.utils'.key_mapper

key_mapper('n', '<C-p>', ':Telescope find_files<CR>')
key_mapper('n', '<leader>fg', ':Telescope live_grep<CR>')
key_mapper('n', '<leader>fb', ':Telescope buffers<CR>')
key_mapper('n', '<leader>fh', ':Telescope help_tags<CR>')
