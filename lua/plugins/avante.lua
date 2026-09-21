-- ~/.config/nvim/lua/plugins/avante.lua

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make BUILD_FROM_SOURCE=false",
  opts = {
    provider = "gemini",
    providers = {
      gemini = {
        model = "gemini-3.8-flash",
      },
    },
    auto_suggestions_provider = "gemini",
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
  },
}
