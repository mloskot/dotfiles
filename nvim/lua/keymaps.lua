vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- ThePrimeagean https://youtu.be/w7i4amO_zaE?t=1536
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- TODO: Collect more options from https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua

