local key_mapper = require 'kevindanne.utils'.key_mapper

local g = vim.g
local opt = vim.opt

-- Generals
g.mapleader = ' '
opt.errorbells = false
opt.guicursor = ''
opt.mouse = ''

-- Theming
opt.termguicolors = true
opt.syntax = 'on'

-- Buffers
opt.autoread = true
opt.hidden = true
opt.encoding = 'UTF-8'

-- Windows
opt.splitright = true
opt.splitbelow = true
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.scrolloff = 8
opt.colorcolumn = '80'
opt.signcolumn = 'yes'
opt.laststatus = 2

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Wildmenu
opt.wildmenu = true
opt.wildmode = 'longest:full,full'

-- Splits
key_mapper('n', '<C-h>', ':vertical resize -4<CR>')
key_mapper('n', '<C-l>', ':vertical resize +4<CR>')
key_mapper('n', '<C-j>', ':resize -4<CR>')
key_mapper('n', '<C-k>', ':resize +4<CR>')

-- Quickfix list
key_mapper('n', '<leader>co', ':copen<CR>')
key_mapper('n', '<leader>cc', ':cclose<CR>')
key_mapper('n', '<leader>]', ':cnext<CR>')
key_mapper('n', '<leader>[', ':cprev<CR>')
