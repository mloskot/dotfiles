-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')

-- TODO: Add more options
--
--
-- NOTE: Missing oitions
--
-- FIXME: Replace vim.cmd with vim.o
--
-- XXX: ABC
