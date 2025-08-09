return {
  {
    "ayu-theme/ayu-vim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()

      -- Optional settings for the Ayu theme
      vim.g.ayucolor = "dark" -- Options: 'dark', 'mirage', 'light'
      vim.g.ayu_mirage = true -- Use Mirage variant (if using ayu-mirage)
    end,
  },
}

