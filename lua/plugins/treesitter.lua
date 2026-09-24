return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- Automatically install parsers for all your active languages
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
      "python",
      "go",
      "gomod",
      "gosum",
      "c",
      "cpp",
      "bash",
    },
    -- Automatically install missing parsers when opening a buffer
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
