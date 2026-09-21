return {
    {"folke/tokyonight.nvim", lazy = false, priority = 1000,},
    -- ~/.config/nvim/lua/plugins/colorscheme.lua
    { "shaunsingh/nord.nvim", name="nord", lazy = false },
    { "folke/tokyonight.nvim", name = "tokyo", lazy = false },
    { "catppuccin/nvim", name = "catppuccin", lazy = false },
    { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false },
    {"xiantang/darcula-dark.nvim", lazy = false, priority = 1000,
    config = function()
      -- Change to "darcula-dark" or "nord" whenever you want to switch
      vim.cmd.colorscheme("darcula-dark")
    end,
},
    }

