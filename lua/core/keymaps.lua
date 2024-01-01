vim.keymap.set('n', 'Q', "@qj")          -- applying macro and enter new line
vim.keymap.set('x', 'Q', ':norm @q<CR>') -- applying macro to multiple lines
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>p', '"+p')
vim.g.mapleader = " "

local map = function(modes, lhs, rhs, opts)
    local options = { silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    if type(modes) == "string" then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        vim.keymap.set(mode, lhs, rhs, options)
    end
end

map("n", "<leader>ff", function()
    require("core.telescopePickers").prettyFilesPicker({ picker = "find_files" })
end, { desc = "Fuzzy find files" })
-- map("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fr", function()
    require("core.telescopePickers").prettyFilesPicker({ picker = "oldfiles" })
end, { desc = "Fuzzy find recent files" })
-- map("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fs", function()
    require("core.telescopePickers").prettyGrepPicker({ picker = "live_grep" })
end, { desc = "Find string in cwd" })
-- map("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>fc", function()
    require("core.telescopePickers").prettyGrepPicker({ picker = "grep_string" })
end, { desc = "Find string under cursor in cwd" })
