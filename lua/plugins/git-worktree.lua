return {
  -- Git Worktree integration
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("git-worktree").setup({
        -- Auto update on branch change
        update_on_change = true,
        -- Run command on branch change
        update_on_change_command = "e .",
        -- Confirm deletion of worktree
        confirm_telescope_deletions = true,
        -- Auto push
        autopush = false,
      })

      -- Telescope integration
      require("telescope").load_extension("git_worktree")

      -- Key mapping
      vim.keymap.set("n", "<leader>gw", function()
        require("telescope").extensions.git_worktree.git_worktrees()
      end, { desc = "Git Worktrees list" })

      vim.keymap.set("n", "<leader>gc", function()
        require("telescope").extensions.git_worktree.create_git_worktree()
      end, { desc = "Git Worktree create" })

      -- Event when switching worktree
      local Worktree = require("git-worktree")
      Worktree.on_tree_change(function(op, metadata)
        if op == Worktree.Operations.Switch then
          vim.notify("Worktree switch: " .. metadata.path)
        elseif op == Worktree.Operations.Create then
          vim.notify("Worktree create: " .. metadata.path)
        end
      end)
    end,
  },
}
