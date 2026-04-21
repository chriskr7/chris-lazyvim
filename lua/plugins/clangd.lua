-- mason-lspconfig automatic_enable이 clangd를 enable하지 못하는 문제 우회
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp", "cuda", "sc", "pc", "sqc" },
  once = true,
  callback = function()
    vim.schedule(function()
      vim.lsp.enable("clangd")
    end)
  end,
})

return {}
