return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")
    local util = require("lspconfig.util")

    if not configs.pyrefly then
      configs.pyrefly = {
        default_config = {
          cmd = { "/Users/chrishan/.local/share/nvim/mason/bin/pyrefly", "lsp" }, -- 필요시 경로 수정
          filetypes = { "python" },
          root_dir = util.root_pattern(".git", "pyproject.toml", "setup.py"),
          settings = {},
        },
      }
    end

    lspconfig.pyrefly.setup({})
  end,
}
