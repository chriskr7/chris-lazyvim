return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      go = { "gofmt" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      vue = { "prettier" },
      tsx = { "prettier" },
      ts = { "prettier" },
      jsx = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = { "--single-quote", "--print-width", "100" },
      },
    },
  },
}
