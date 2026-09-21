-- ~/.config/nvim/lua/plugins/ui-extras.lua
return {
  -- Shared Lua utility functions used by many plugins
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- UI component library (popups, inputs, menus)
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- File and folder icons across your editor
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {},
  },

  -- Polished floating inputs and select menus (replaces default vim.ui prompts)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Rich, in-editor Markdown preview & styling (headers, tables, callouts)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      file_types = { "markdown", "Avante" },
    },
  },
}
