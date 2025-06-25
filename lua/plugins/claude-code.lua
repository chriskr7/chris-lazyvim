return {
  -- claude-code.nvim - Claude Code Integration
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Git operations
    },
    config = function()
      require("claude-code").setup({
        -- Terminal Window Settings
        window = {
          split_ratio = 0.4, -- Screen ratio (width: height, height: width)
          position = "botright", -- Window position: "botright", "topleft", "vertical"
          enter_insert = true, -- Enter insert mode when opening Claude Code
          hide_numbers = true, -- Hide line numbers in terminal window
          hide_signcolumn = true, -- Hide sign column in terminal window
        },

        -- File Refresh Settings
        refresh = {
          enable = true, -- Enable file change detection
          updatetime = 100, -- Claude Code updatetime (milliseconds)
          timer_interval = 1000, -- File change check interval (milliseconds)
          show_notifications = true, -- Show notifications when file reloads
        },

        -- Git Project Settings
        git = {
          use_git_root = true, -- Set CWD to Git root when opening Claude Code in a Git project
        },

        -- Command Settings
        command = "/Users/chrishan/.claude/local/claude",

        -- Keymap Settings
        keymaps = {
          toggle = {
            normal = "<C-,>", -- Toggle Claude Code in normal mode
            terminal = "<C-,>", -- Toggle Claude Code in terminal mode
          },
          window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true, -- Enable scrolling keymaps (<C-f/b>)
        },
      })

      -- Session Management Commands
      vim.api.nvim_create_user_command("ClaudeNew", function()
        vim.cmd("ClaudeCode")
      end, { desc = "New Claude Code Session" })

      vim.api.nvim_create_user_command("ClaudeContinue", function()
        vim.fn.system("claude --continue")
        vim.cmd("ClaudeCode")
      end, { desc = "Continue Previous Claude Code Session" })

      vim.api.nvim_create_user_command("ClaudeDebug", function()
        local claude = require("claude-code")
        claude.update_config({ command = "claude --debug" })
        vim.cmd("ClaudeCode")
      end, { desc = "Claude Code Debug Mode" })

      -- Keymap Settings
      vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
      vim.keymap.set("n", "<leader>acn", ":ClaudeNew<CR>", { desc = "New Claude Session" })
      vim.keymap.set("n", "<leader>acc", ":ClaudeContinue<CR>", { desc = "Continue Previous Claude Session" })
      vim.keymap.set("n", "<leader>acd", ":ClaudeDebug<CR>", { desc = "Claude Debug Mode" })

      -- File Change Notification
      vim.api.nvim_create_autocmd("FileChangedShellPost", {
        pattern = "*",
        callback = function(args)
          local filename = vim.fn.fnamemodify(args.file, ":t")
          vim.notify(
            string.format("Claude Code has modified %s file", filename),
            vim.log.levels.INFO,
            { title = "Claude Code", timeout = 2000 }
          )
        end,
      })

      -- Highlight changed buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.modified then
            vim.api.nvim_buf_add_highlight(0, -1, "DiffChange", 0, 0, -1)
          end
        end,
      })
    end,
  },

  -- which-key integration
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>a", group = "AI/Claude" },
      })
    end,
  },
}
