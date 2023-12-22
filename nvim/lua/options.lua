-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.tabstop=4
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.colorcolumn = "80"

-- https://github.com/NvChad/NvChad/issues/1526#issuecomment-1234637754
if vim.fn.has('win32') == 1 then
    vim.opt.shell = 'pwsh.exe -nol'
    vim.opt.shellcmdflag = '-nop -c'
    vim.opt.shellquote = '"'
    vim.opt.shellxquote = ''
    vim.opt.shellpipe = '| Out-File -Encoding UTF8 %s'
    vim.opt.shellredir = '| Out-File -Encoding UTF8 %s'
end
