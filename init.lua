-- ~/.config/nvim/init.lua

-- 1. Load general settings first
require("config.options")

-- 2. Load global mappings
--require("config.keymaps")

-- 3. Load autocommands
--require("config.autocmds")

-- 4. Load your plugin manager (e.g., lazy.nvim)
require("config.lazy")
