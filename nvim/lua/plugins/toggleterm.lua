function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)
  --vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  --vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  --vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  --vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

function _G.toggleterm_lazygit()
  local Terminal = require('toggleterm.terminal').Terminal

  local lazygit  = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    float_opts = {
      border = "single",
      -- Enable full screen: https://github.com/akinsho/toggleterm.nvim/issues/505
      width = vim.o.columns,
      height = vim.o.lines,
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })

  lazygit:toggle()
end

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = "tab",
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    close_on_exit = true,
  },
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-\>]], 
    })

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua toggleterm_lazygit()<CR>", { noremap = true, silent = true })
  end
}

-- NOTE: https://github.com/LazyVim/LazyVim/discussions/193
