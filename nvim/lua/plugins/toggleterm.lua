return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    opts = {
        direction = "float", 
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        insert_mappings = true, 
        terminal_mappings = true,
        start_in_insert = true,
        close_on_exit = true,
    },
}

-- NOTE: https://github.com/LazyVim/LazyVim/discussions/193
