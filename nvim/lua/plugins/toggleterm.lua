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
        require('toggleterm').setup()
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
  lazygit:toggle()
end
        vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end
}


-- NOTE: https://github.com/LazyVim/LazyVim/discussions/193
