-- plugins/autopairs.lua
return {
  -- mini.pairs disable
  { "echasnovski/mini.pairs", enabled = false },

  -- nvim-autopairs enable
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    },
  },
}
