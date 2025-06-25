-- Default options
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyrefly"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"


local opt = vim.opt

-- Line number
opt.relativenumber = true
opt.number = true

-- Tab and indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false

-- Backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split
opt.splitright = true
opt.splitbelow = true

-- Smooth scroll
opt.smoothscroll = true -- Neovim 0.10+ smooth scroll
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = "expr"
opt.foldlevel = 99

-- Rust analyzer configuration
vim.g.rustaceanvim = {
  server = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = { "unresolved-proc-macro" },
        },
      },
    },
  },
}

