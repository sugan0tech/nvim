return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "windwp/nvim-ts-autotag" },
  },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "java",
        "rust",
        "ron",
        "toml",
        "go",
        "elixir",
        "ruby",
        "python",
        "typescript",
        "html",
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "yaml",
        "typescript",
        "regex",
        "bash",
        "xml",
        "svelte"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true, },
      autotag = { enable = true, }
    })
  end,
}
