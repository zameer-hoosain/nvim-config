local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
    return
end

local status_ok_ml, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_ml then
    return
end

mason.setup()

mason_lspconfig.setup({ automatic_installation = true })

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs (glyphs)
    signs = {
        active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- remove this and use telescope
    --instead
end

require("lspconfig")["sumneko_lua"].setup({
    on_attach = on_attach,
    flags = require("user.lsp.settings.sumneko_lua"),
})

require("lspconfig")["jsonls"].setup({
    on_attach = on_attach,
    flags = require("user.lsp.settings.jsonls"),
})

require("lspconfig")["pyright"].setup({
    on_attach = on_attach,
})

require("lspconfig")["sqlls"].setup({
    on_attach = on_attach,
    flags = require("user.lsp.settings.sqlls"),
})

require("lspconfig")["volar"].setup({
    on_attach = on_attach,
    flags = require("user.lsp.settings.volar"),
})

require("lspconfig")["jdtls"].setup({
    on_attach = on_attach,
})

require("lspconfig")["tsserver"].setup({
    on_attach = on_attach,
})
