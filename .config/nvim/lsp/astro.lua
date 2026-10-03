local is_windows = vim.fn.has("win32") == 1

local tsdk_path = ""
if is_windows then
    local appdata = os.getenv("APPDATA") or ""
    tsdk_path = appdata:gsub("\\", "/") .. "/npm/node_modules/typescript/lib"
else
    local node_path = vim.fn.exepath("node")
    if node_path ~= "" then
        tsdk_path = vim.fn.fnamemodify(node_path, ":h:h") .. "/lib/node_modules/typescript/lib"
    else
        tsdk_path = os.getenv("HOME") .. "/.nvm/versions/node/default/lib/node_modules/typescript/lib"
    end
end

return {
    cmd = { "astro-ls", "--stdio" },
    filetypes = { "astro" },
    root_markers = { "package.json", "tsconfig.json", ".git" },
    init_options = {
        typescript = {
            tsdk = tsdk_path,
        },
    },
}
