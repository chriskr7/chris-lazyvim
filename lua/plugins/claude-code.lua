return {
  -- claudecode.nvim - Claude Code Integration (coder/claudecode.nvim)
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim", -- Required for terminal functionality
    },
    config = true,
    opts = {
      -- Terminal command path (local installation)
      terminal_cmd = "/Users/chrishan/.claude/local/claude",

      -- Terminal provider: "snacks", "native", "external", or "none"
      -- "none" = WebSocket server only, run Claude manually in external terminal
      terminal = {
        provider = "none",
      },

      -- Behavior settings
      auto_close = true,
      focus_after_send = true,
      git_repo_cwd = true,

      -- Log level
      log_level = "info",
    },
    keys = {
      -- Toggle & Focus
      { "<C-,>", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      -- Session management
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Model" },
      -- Context management
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      { "<leader>aS", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add File (Tree)" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add Current Buffer" },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Diff" },
      -- Status
      { "<leader>ai", "<cmd>ClaudeCodeStatus<cr>", desc = "Claude Status" },
    },
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
