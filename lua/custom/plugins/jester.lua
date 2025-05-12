return {
  'David-Kunz/jester',
  dependencies = {
    {
      'mfussenegger/nvim-dap',
      config = function()
        local dap = require 'dap'
        dap.adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = { os.getenv 'HOME' .. '/.config/nvim/bin/js-debug/src/dapDebugServer.js', '${port}' },
          },
        }
        dap.configurations.javascript = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
        }
      end,
    },
  },
  config = function()
    local jester = require 'jester'
    jester.setup {
      dap = {
        type = 'pwa-node',
      },
    }
    vim.keymap.set('n', '<leader>jj', jester.debug, { desc = 'Run nearest [J]est unit test' })
    vim.keymap.set('n', '<leader>jf', jester.debug_file, { desc = 'Run [J]est tests in [F]ile' })
    vim.keymap.set('n', '<leader>jl', jester.debug_last, { desc = 'Run [J]est [L]ast test(s)' })
  end,
}
