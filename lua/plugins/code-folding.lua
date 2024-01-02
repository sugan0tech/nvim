return { -- UFO
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "VimEnter", -- needed for folds to load in time and comments closed
  keys = {
    { "zm", function() require("ufo").closeAllFolds() end, desc = " 󱃄 Close All Folds" },
    { "zk", function() require("ufo").goPreviousClosedFold() end, desc = " 󱃄 Goto Prev Fold" },
    { "zj", function() require("ufo").goNextClosedFold() end, desc = " 󱃄 Goto Next Fold" },
    {
      "zr",
      function() require("ufo").openFoldsExceptKinds { "comment", "imports" } end,
      desc = " 󱃄 Open All Folds",
    },
    {
      "zg",
      function() require("ufo").openAllFolds() { "comment", "imports" } end,
      desc = " 󱃄 Open All Folds",
    },
    {
      "z1",
      function() require("ufo").closeFoldsWith(1) end,
      desc = " 󱃄 Close L1 Folds",
    },
    {
      "z2",
      function() require("ufo").closeFoldsWith(2) end,
      desc = " 󱃄 Close L2 Folds",
    },
    {
      "z3",
      function() require("ufo").closeFoldsWith(3) end,
      desc = " 󱃄 Close L3 Folds",
    },
    {
      "z4",
      function() require("ufo").closeFoldsWith(4) end,
      desc = " 󱃄 Close L4 Folds",
    },
  },
  init = function()
    -- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
    -- auto-closing them after leaving insert mode, however ufo does not seem to
    -- have equivalents for zr and zm because there is no saved fold level.
    -- Consequently, the vim-internal fold levels need to be disabled by setting
    -- them to 99
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  opts = {
    provider_selector = function(_, ft, _)
      -- INFO some filetypes only allow indent, some only LSP, some only
      -- treesitter. However, ufo only accepts two kinds as priority,
      -- therefore making this function necessary :/
      local lspWithOutFolding = { "markdown", "sh", "css", "html", "python" }
      if vim.tbl_contains(lspWithOutFolding, ft) then return { "treesitter", "indent" } end
      return { "lsp", "indent" }
    end,
    -- when opening the buffer, close these fold kinds
    -- use `:UfoInspect` to get available fold kinds from the LSP
    close_fold_kinds = { "imports", "comment" },
    open_fold_hl_timeout = 800,
    fold_virt_text_handler = foldTextFormatter,
  },
}