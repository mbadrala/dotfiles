return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("roslyn").setup({
            config = {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    print("🚀 Roslyn Attached to " .. vim.fn.bufname(bufnr))
                end,
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_compiler_diagnostics_scope = "openDocuments",
                    },
                },
            },
        })
    end,
}
