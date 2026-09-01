local markview_filetypes = { "markdown", "markdown.mdx", "quarto", "rmd", "typst", "asciidoc" }

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      preview = {
        filetypes = markview_filetypes,
        icon_provider = "devicons",
      },
    },
    keys = {
      {
        "<leader>um",
        "<cmd>Markview toggle<cr>",
        ft = markview_filetypes,
        desc = "Toggle Markview",
      },
      {
        "<leader>uM",
        "<cmd>Markview splitToggle<cr>",
        ft = markview_filetypes,
        desc = "Toggle Markview Split",
      },
    },
  },
}
