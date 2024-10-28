local dap = require("dap")
local dapui = require("dapui")

-- Setup dapui
dapui.setup()

-- Open dapui automatically when a new debug session is created
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Improve dapui signs
vim.fn.sign_define('DapBreakpoint', { text='🟥', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='❔', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text='⛔', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapLogPoint', { text='🟦', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text ='▶️', texthl ='', linehl ='', numhl =''})

-- Keybinds
local key_mapper = require 'kevindanne.utils'.key_mapper

key_mapper('n', '<leader>db', dap.toggle_breakpoint)
key_mapper('n', '<leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
key_mapper('n', '<leader>dC', function() dap.set_breakpoint(vim.fn.input('Condition: ')) end)
key_mapper('n', '<leader>dB', dap.clear_breakpoints)

key_mapper('n', '<leader>dc', dap.continue)
key_mapper('n', '<leader>do', dap.step_over)
key_mapper('n', '<leader>di', dap.step_into)
key_mapper('n', '<leader>dO', dap.step_out)
key_mapper('n', '<leader>dq', dap.close)
key_mapper('n', '<leader>dQ', dap.terminate)
key_mapper('n', '<leader>dp', dap.pause)
key_mapper('n', '<leader>dr', dap.restart_frame)
key_mapper('n', '<leader>dR', dap.repl.toggle)
key_mapper('n', '<leader>ds', dap.run_to_cursor)
