return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { {"nvim-lua/plenary.nvim"} },
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>hm", function() harpoon:list():append() end)
    vim.keymap.set("n", "<leader>hp", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    --[[ -- as of now not needed with my workflow
      vim.keymap.set("n", "<C-S-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-S-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-S-3>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-S-4>", function() harpoon:list():select(4) end) ]]

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)
  end

}
