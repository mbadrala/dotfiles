local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
    },
    severity_sort = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

require('mason').setup({})

local function get_venv_python()
    print("Getting the env")
    local cwd = vim.fn.getcwd()
    local venv_path = vim.fn.finddir('.venv', cwd .. ';')
    if venv_path ~= '' then
        print(venv_path)
        return vim.fn.fnamemodify(venv_path, ':p') .. 'bin/python'
    end
    venv_path = vim.fn.finddir('venv', cwd .. ';')
    if venv_path ~= '' then
        print(venv_path)
        return vim.fn.fnamemodify(venv_path, ':p') .. 'bin/python'
    end
    return vim.fn.exepath('python')
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "clangd",
        "ts_ls",
        "ruff",
        "pyright",
        "omnisharp",
    },
    handlers = {
        lsp_zero.default_setup,
        rust_analyzer = function() end,
        omnisharp = function()
            lspconfig.omnisharp.setup({
                handlers = {
                    ["textDocument/definition"] = require('omnisharp_extended').handler,
                },
                cmd = { "omnisharp", '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
                root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln", "Assets"),
                enable_editorconfig_support = true,
                enable_ms_build_load_projects_on_demand = false,
                enable_roslyn_analyzers = true,
                analyze_open_documents_only = true,
                organize_imports_on_format = true,
                enable_import_completion = false,
                sdk_include_prereleases = true,
            })
        end,
        pyright = function()
            lspconfig.pyright.setup({
                settings = {
                    pyright = {
                        disableOrganizeImports = true,
                    },
                    python = {
                        pythonPath = get_venv_python(),
                        analysis = {
                            ignore = { '*' },
                        },
                    },
                }
            })
        end,
        gopls = function()
            lspconfig.gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            })
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }, -- Recognize 'vim' as a global variable
                        }
                    }
                }
            })
        end
    },
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = 'LSP: Disable hover capability from Ruff',
})


-- Conform

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
    },
    formatters = {
        prettier = {
            prepend_args = {
                "--print-width", "80",
                "--tab-width", "2",
                "--single-quote",
                "--trailing-comma", "all",
                "--bracket-spacing",
            },
        },
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Format file with Conform" })
