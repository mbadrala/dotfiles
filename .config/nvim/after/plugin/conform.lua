require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
    },
    formatters = {
        prettier = {
            prepend_args = {
                "--print-width", "80",
                "--tab-width", "2",
                "--trailing-comma", "none",
                "--bracket-spacing",
            },
        },
        prettier_html = {
            command = "prettier",
            prepend_args = {
                "--print-width", "80",
                "--tab-width", "4",
                "--trailing-comma", "none",
                "--bracket-spacing",
            },
        },
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Format file with Conform" })
