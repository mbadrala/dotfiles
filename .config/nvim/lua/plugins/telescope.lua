return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 
            'nvim-telescope/telescope-fzf-native.nvim', 
            build = vim.fn.has('win32') == 1 and 
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' or 
            'make' 
        },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                file_ignore_patterns = {
                    "%.meta",
                    "%.prefab",
                    "%.dll",
                    "%.mat"
                },
                path_display = { "truncate" },
                git_status = false
            },
            pickers = {
                git_files = {
                    case_mode = "ignore_case",
                    show_untracked = true,
                },
                find_files = {
                    hidden = true,
                }
            },
        }

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})

        vim.keymap.set('n', '<leader>pgs', builtin.git_status, {})
        vim.keymap.set('n', '<leader>pgc', builtin.git_commits, {})
    end,
}
