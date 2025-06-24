return {
  -- Claude Squad Integration
  {
    "akinsho/toggleterm.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Claude Squad Helper Function
      local function cs_command(args)
        local Terminal = require("toggleterm.terminal").Terminal

        -- Calculate window size as integer
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)

        local cs = Terminal:new({
          cmd = "cs " .. (args or ""),
          direction = "float",
          float_opts = {
            border = "curved",
            width = width,    -- Use integer value
            height = height,  -- Use integer value
          },
          on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", [[<C-\><C-n>]], { noremap = true })
          end,
        })
        cs:toggle()
      end

      -- User Commands
      vim.api.nvim_create_user_command("CSStart", function()
        cs_command("")
      end, { desc = "Claude Squad Start" })

      vim.api.nvim_create_user_command("CSAuto", function()
        cs_command("-y")
      end, { desc = "Claude Squad Auto Mode" })

      vim.api.nvim_create_user_command("CSProgram", function(opts)
        cs_command("-p " .. opts.args)
      end, { nargs = 1, desc = "Start Claude Squad with a specific program" })

      -- Keymap
      vim.keymap.set("n", "<leader>css", ":CSStart<CR>", { desc = "Claude Squad Start" })
      vim.keymap.set("n", "<leader>csa", ":CSAuto<CR>", { desc = "Claude Squad Auto" })
      vim.keymap.set("n", "<leader>cso", ":CSProgram claude_opus<CR>", { desc = "CS Opus" })
      vim.keymap.set("n", "<leader>csn", ":CSProgram claude_sonnet<CR>", { desc = "CS Sonnet" })
    end,
  },

  -- Which-key Integration
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>cs", group = "Claude Squad" },
      })
      return opts
    end,
  },
}
