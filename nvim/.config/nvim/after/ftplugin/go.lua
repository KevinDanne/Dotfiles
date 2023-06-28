local key_mapper = require 'kevindanne.utils'.key_mapper

-- Keybinds
key_mapper('n', '<Leader>b', ':BoBuild<CR>')
key_mapper('n', '<Leader>r', ':GoRun<CR>')
key_mapper('n', '<Leader>l', ':GoLint<CR>')
key_mapper('n', '<Leader>t', ':GoTest<CR>')
