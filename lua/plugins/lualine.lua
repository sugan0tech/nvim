return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        -- theme = 'iceberg_dark'
        theme = 'ayu_dark'
      }
    })
  end
}
