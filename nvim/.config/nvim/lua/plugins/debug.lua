return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio'
    },
    config = function ()
        local dap = require('dap')
        local dapui = require('dapui')

        dapui.setup(
          {
            controls = {
              element = "repl",
              enabled = true,
              icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = ""
              }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
              border = "single",
              mappings = {
                close = { "q", "<Esc>" }
              }
            },
            force_buffers = true,
            icons = {
              collapsed = "",
              current_frame = "",
              expanded = ""
            },
            layouts = { {
                elements = { {
                    id = "scopes",
                    size = 0.25
                  }, {
                    id = "breakpoints",
                    size = 0.25
                  }, {
                    id = "stacks",
                    size = 0.25
                  }, {
                    id = "watches",
                    size = 0.25
                  } },
                position = "left",
                size = 40
              }, {
                elements = {
                  {
                    id = "repl",
                    size = 1
                    -- size = 0.5
                  },
                  -- {
                  --   id = "console",
                  --   size = 0.5
                  -- }
                },
                position = "bottom",
                size = 10
              } },
            mappings = {
              edit = "e",
              expand = { "<CR>", "<2-LeftMouse>" },
              open = "o",
              remove = "d",
              repl = "r",
              toggle = "t"
            },
            render = {
              indent = 1,
              max_value_lines = 100
            }
          }
        )

        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          -- Map keys for debugger actions using vim.keymap.set
          vim.keymap.set('n', '<F2>', function() require'dap'.step_into() end, { noremap = true, silent = true })
          vim.keymap.set('n', '<F3>', function() require'dap'.step_over() end, { noremap = true, silent = true })
          vim.keymap.set('n', '<F5>', function() require'dap'.continue() end, { noremap = true, silent = true })
          vim.keymap.set('n', '<F12>', function() require'dap'.terminate() end, { noremap = true, silent = true })
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
           -- Delete the key mappings
          vim.keymap.del('n', '<F2>')
          vim.keymap.del('n', '<F3>')
          vim.keymap.del('n', '<F5>')
          vim.keymap.del('n', '<F12>')
          dapui.close()
        end

        dap.adapters.gdb = {
          type = "executable",
          command = "gdb",
          args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }

        dap.configurations.c = {
          {
            name = "Launch Manual with arguments",
            type = "gdb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            args = function()
              return vim.split(vim.fn.input('Enter arguments for the program: ', '', 'file'), " ")
            end,
            stopAtBeginningOfMainSubprogram = true,
          },
        }

        dap.configurations.cpp = {
          {
            name = "Launch Manual with arguments",
            type = "gdb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
    args = function()
              return vim.split(vim.fn.input('Enter arguments for the program: ', '', 'file'), " ")
            end,
            stopAtBeginningOfMainSubprogram = true,
          },
        }

        -- Path to local config
        local local_config_path = vim.fn.getcwd() .. "/.nvim/dap_config.lua"
        -- Check if the file exists before attempting to load
        if vim.fn.filereadable(local_config_path) == 1 then
          local ok, result = pcall(dofile, local_config_path)
          if ok and type(result) == "table" then
            for _, config in ipairs(result) do
              table.insert(dap.configurations.c, config)
              table.insert(dap.configurations.cpp, config)
            end
          else
            vim.notify("[DAP] Failed to load or parse .nvim/dap_config.lua", vim.log.levels.WARN)
          end
        else
          vim.notify("[DAP] No project-local DAP config found in .nvim", vim.log.levels.DEBUG)
        end

        vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<Leader>dc', dap.continue, {})
    end,
}
