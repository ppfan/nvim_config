-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        -- Go
        "gopls",
        -- C / C++
        "clangd",
        -- Bash
        "bashls",
      },
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Common keymaps set whenever any LSP connects to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("n", "gr", vim.lsp.buf.references, "Find References")
          map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format Document")

          -- Diagnostic navigation
          map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
          map("n", "<leader>d", vim.diagnostic.open_float, "Show Line Diagnostic")
        end,
      })

      -- Diagnostic UI styling
      vim.diagnostic.config({
        float = { border = "rounded" },
        virtual_text = true,
        signs = true,
        underline = true,
      })

      -- 1. Python (Pyright)
      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      })

      -- 2. Go (gopls)
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            completeUnimported = true,
            usePlaceholders = true,
          },
        },
      })

      -- 3. C / C++ (clangd)
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
      })

      -- 4. Bash (bash-language-server)
      vim.lsp.config("bashls", {
        filetypes = { "sh", "bash" },
      })

      -- Activate all servers natively in Neovim 0.12
      vim.lsp.enable({ "pyright", "ruff", "gopls", "clangd", "bashls" })
    end,
  },
}
