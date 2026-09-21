--- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader before lazy setup (recommended by lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"-- Inside your lazy initialization file (e.g., lua/config/lazy.lua)
require("lazy").setup({
  spec = {
    { import = "plugins" },
    -- Automatically loads every file inside lua/plugins/
  },
  rocks = {
    enabled = false, -- Disables hererocks/luarocks checks since none of your plugins use it
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})
