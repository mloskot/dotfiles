-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth=4
vim.opt.smartindent = true
vim.opt.softtabstop=4
vim.opt.swapfile = false
vim.opt.tabstop=4
vim.opt.termguicolors = true
vim.opt.wrap = true

-- https://github.com/NvChad/NvChad/issues/1526#issuecomment-1234637754
if vim.fn.has('win32') == 1 then
    vim.opt.shell = 'pwsh.exe -nol'
    vim.opt.shellcmdflag = '-nop -c'
    vim.opt.shellquote = '"'
    vim.opt.shellxquote = ''
    vim.opt.shellpipe = '| Out-File -Encoding UTF8 %s'
    vim.opt.shellredir = '| Out-File -Encoding UTF8 %s'
end
