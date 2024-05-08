vim.g.mapleader = " "

--NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>', {silent = true})
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>', {silent = true})
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>', {silent = true})

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>', {silent = true})
vim.keymap.set('n', '\\', ':split<CR>', {silent = true})

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>', {silent = true})
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>', {silent = true})
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>', {silent = true})
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>', {silent = true})
vim.keymap.set('i', 'jj', '<Esc>', {silent = true})

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', {silent = true})
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>', {silent = true})

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {silent = true})
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', {silent = true})
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>', {silent = true})
