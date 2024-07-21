return {
  "williamboman/mason.nvim",
  opts = { ensure_installed = { "prettier" } },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded"
      }
    })
  end
}
