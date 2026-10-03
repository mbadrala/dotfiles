return {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- Use the latest 'main' branch
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = { 
            "c", "lua", "vim", "vimdoc", "query", 
            "c_sharp", "go", "typescript", "astro", "wgsl" 
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    }
}
