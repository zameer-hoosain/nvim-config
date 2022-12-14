local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    }) -- add surround text objects
    use("gpanders/editorconfig.nvim") -- support editorconfig
    use("wellle/targets.vim") -- support targeting distant objects
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }) -- css colours
    use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
    use("lewis6991/impatient.nvim") -- Speedup plugin loads
    use("folke/which-key.nvim")

    use("folke/tokyonight.nvim")

    -- cmp plugins
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("williamboman/mason.nvim") -- lsp installer
    use("williamboman/mason-lspconfig.nvim") -- mason lsp config bridge
    use("neovim/nvim-lspconfig") -- enable LSP
    use("jose-elias-alvarez/null-ls.nvim") -- ls and formatter

    -- Fuzzy finder
    use("nvim-telescope/telescope.nvim")
    use("BurntSushi/ripgrep")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Tree
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")

    -- Status line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Indent lines
    use("lukas-reineke/indent-blankline.nvim")

    --Debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("Pocco81/dap-buddy.nvim")
    -- python
    use("mfussenegger/nvim-dap-python")
    -- java
    use("mfussenegger/nvim-jdtls")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
