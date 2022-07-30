local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier,
        formatting.black.with({ extra_args = { "--target-version=py36" } }),
        formatting.stylua,
        diagnostics.pylint.with({prefer_local="venv/bin"}),
        diagnostics.mypy.with({prefer_local="venv/bin"}),
        diagnostics.eslint,
    }
})
