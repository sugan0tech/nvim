return  {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production",
    config = function()
      vim.cmd([[
        let g:prettier#autoformat = 1
        let g:prettier#autoformat_require_pragma = 0
        let g:prettier#exec_cmd_async = 1
      ]])
    end,
  }
