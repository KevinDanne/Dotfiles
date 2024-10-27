local utils = {}

-- Key mapper util
utils.key_mapper = function(mode, key, result)
    vim.keymap.set(mode, key, result, {
        noremap = true,
        silent = true
    })
end

return utils
