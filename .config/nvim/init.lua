if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_trail_size = 0.7
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_padding_right= 0
    vim.g.neovide_padding_bottom= 0
    vim.g.neovide_opacity = 1.0
    vim.g.neovide_normal_opacity = 1.0
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_no_idle = true
end

vim.g.mapleader = " "
vim.o.guifont = "Berkeley_Mono:h12"
vim.cmd.colorscheme("b01")

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.title = true
vim.o.titlestring = [[%{fnamemodify(getcwd(), ':t')} - nvim]]
vim.o.foldenable = true
vim.o.scrolloff = 6

require("config.lazy")

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader><leader>", ":noh<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

require("mason").setup()

vim.lsp.enable({ "ts_ls", "gopls", "astro" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }
		local telescope = require('telescope.builtin')

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

		vim.keymap.set('n', '<leader>gr', telescope.lsp_references, opts)
		vim.keymap.set('n', '<leader>gf', telescope.lsp_document_symbols, opts)
		vim.keymap.set('n', '<leader>gw', telescope.lsp_dynamic_workspace_symbols, opts)
	end,
})

