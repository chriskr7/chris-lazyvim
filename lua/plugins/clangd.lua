-- mason-lspconfig automatic_enable이 clangd를 enable하지 못하는 문제 우회
-- + copilot(UTF-16)과의 position encoding mismatch 해결: clangd를 UTF-16으로 강제
-- (.gc → c filetype 매핑은 lua/config/options.lua 참조)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp", "cuda", "sc", "pc", "sqc" },
  once = true,
  callback = function()
    vim.schedule(function()
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--offset-encoding=utf-16" },
      })
      vim.lsp.enable("clangd")
    end)
  end,
})

return {}
