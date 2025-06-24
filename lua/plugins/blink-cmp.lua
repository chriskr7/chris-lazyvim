return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    -- Copilot support
    "giuxtaposition/blink-cmp-copilot",
    -- Snippet support
    "rafamadriz/friendly-snippets",
    -- LuaSnip
    "L3MON4D3/LuaSnip",
  },
  opts = {
    -- Key mapping
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback"
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback"
      },
    },

    -- Icon setting
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
      kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
        Copilot = "",
      },
    },

    -- Source setting
    sources = {
      default = { "copilot", "lsp", "buffer", "path", "snippets"},
      providers = {
        -- Copilot setting
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
        -- LazyDev setting (LazyVim)
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
          fallbacks = { "lsp" },  -- if lazydev is not available, fallback to lsp
        },
        -- Path is built-in
        path = {
          name = "Path",
          score_offset = 3,
        },
      },
    },

    -- Snippet setting
    snippets = {
      preset = "luasnip",
    },

    -- Completion setting
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        -- Menu display setting
        draw = {
          -- Source name display
          columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
      -- ghost_text setting
      ghost_text = {
        enabled = false,
      },
    },
  },

  -- LuaSnip setting
  config = function(_, opts)
    -- Remove compat and kind fields
    if opts.sources then
      opts.sources.compat = nil
      for _, provider in pairs(opts.sources.providers or {}) do
        if provider.kind then
          provider.kind = nil
        end
      end
    end
    -- blink.cmp setting
    require("blink.cmp").setup(opts)
    -- LuaSnip VSCode snippet load
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
