vim.keymap.set('n', 'Q', "@qj")          -- applying macro and enter new line
vim.keymap.set('x', 'Q', ':norm @q<CR>') -- applying macro to multiple lines
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>p', '"+p')
