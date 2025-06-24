-- Autocmds are automatically loaded on the VeryLazy event
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Filetype-specific tab settings
local filetype_settings = {
  -- 4 spaces
  python = { tabstop = 4, shiftwidth = 4, expandtab = true },
  java = { tabstop = 4, shiftwidth = 4, expandtab = true },
  rust = { tabstop = 4, shiftwidth = 4, expandtab = true },
  c = { tabstop = 4, shiftwidth = 4, expandtab = true },
  cpp = { tabstop = 4, shiftwidth = 4, expandtab = true },

  -- 2 spaces
  javascript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  typescript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  javascriptreact = { tabstop = 2, shiftwidth = 2, expandtab = true },
  typescriptreact = { tabstop = 2, shiftwidth = 2, expandtab = true },
  html = { tabstop = 2, shiftwidth = 2, expandtab = true },
  css = { tabstop = 2, shiftwidth = 2, expandtab = true },
  scss = { tabstop = 2, shiftwidth = 2, expandtab = true },
  json = { tabstop = 2, shiftwidth = 2, expandtab = true },
  yaml = { tabstop = 2, shiftwidth = 2, expandtab = true },
  lua = { tabstop = 2, shiftwidth = 2, expandtab = true },
  vue = { tabstop = 2, shiftwidth = 2, expandtab = true },

  -- Tabs (Actual Tab Characters)
  go = { tabstop = 4, shiftwidth = 4, expandtab = false },
  make = { tabstop = 8, shiftwidth = 8, expandtab = false },

  -- Others
  markdown = { tabstop = 2, shiftwidth = 2, expandtab = true },
  sh = { tabstop = 2, shiftwidth = 2, expandtab = true },
}

-- Apply Settings
for filetype, settings in pairs(filetype_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("filetype_" .. filetype),
    pattern = filetype,
    callback = function()
      vim.opt_local.tabstop = settings.tabstop
      vim.opt_local.shiftwidth = settings.shiftwidth
      vim.opt_local.expandtab = settings.expandtab
    end,
  })
end
