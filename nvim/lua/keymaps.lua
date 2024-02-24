vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- mloskot
local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
------ Terminal: https://github.com/cpow/neovim-for-newbs/issues/1
-- use if rebelot/terminal.nvim is unused
vim.keymap.set("n", "<leader>tv", ':botright vnew <Bar> :terminal<cr>')
vim.keymap.set("n", "<leader>th", ':botright new <Bar> :terminal<cr>')

-- typecraft: https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn
----- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- ThePrimeagean https://youtu.be/w7i4amO_zaE?t=1536
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- TODO: Collect more options from https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua

