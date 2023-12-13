vim.g.mapleader = " "

-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
    {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd('colorscheme github_dark')
  end,
},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
local opts = {}
require("lazy").setup(plugins, opts)

-- Plugin: Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Basics
vim.opt.guicursor = "i:block"
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.termguicolors = true

-- Key mappings
vim.keymap.set("i", "jj", "<Esc>")

-- some
vim.keymap.set("n", "<M-b>", ":Ex<CR>")

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
