return {
  -- Mason for LSP management
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- Mason LSP Configuration
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "ts_ls", "html", "jsonls", "kotlin_language_server",
          "gopls", "pyright", "svelte", "rust_analyzer", "cssls", "csharp_ls",
          "tailwindcss", "yamlls", "solargraph" -- Added Ruby LSP
        }
      })
    end
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Language Server Configurations
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.graphql.setup({})
      lspconfig.groovyls.setup({})
      lspconfig.html.setup({})
      lspconfig.jsonls.setup({})
      -- lspconfig.jdtls.setup({})
      lspconfig.kotlin_language_server.setup({})
      lspconfig.gopls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.svelte.setup({})
      lspconfig.rust_analyzer.setup({})
      -- lspconfig.eslint.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.yamlls.setup({})

      -- Ruby LSP: Solargraph
      lspconfig.solargraph.setup({
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        settings = {
          solargraph = {
            diagnostics = true,
            formatting = true,
            useBundler = false,  -- Change to true if using `bundle exec`
          },
        },
      })

      -- Keybindings for LSP
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
    end
  }
}

