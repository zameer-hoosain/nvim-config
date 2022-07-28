local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten keymap function
local keymap = vim.api.nvim_set_keymap

-- Remap space to leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode
-- ALE jump next/previous
keymap("n", "<C-j>", ":ALENext", opts)
keymap("n", "<C-k>", ":ALEPrevious", opts)

-- Toggle tree
keymap("n", "<C-n>", ":NERDTreeToggle<CR>", opts)

-- Find files/Find in files
keymap("n", "<C-p>", ":FZF<CR>", opts)
keymap("n", "<C-g>", ":Ag<CR>", opts)

-- Navigate back/forth
keymap("n", "<C-h>", "g;", opts)
keymap("n", "<C-l>", "g,", opts)

-- Window navigation
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)
keymap("n", "<leader>w", ":W<CR>", opts)

-- Splits
keymap("n", "<leader>s", ":wincmd s<CR>", opts)
keymap("n", "<leader>v", ":wincmd v<CR>", opts)

-- Terminal
keymap("n", "<leader>t", ":term<CR>", opts)

-- Copy/Paste to system
keymap("n", "<F2>", "\"+y<Esc>", opts)
keymap("n", "<F4>", "\"+p<Esc>", opts)

-- Emmet expand
keymap("n", "<leader>e", "<C-Y>", opts)

-- Git blame
keymap("n", "<leader>b", ":Git blame<CR>", opts)

-- Code nav
-- keymap("n", "<leader>d", "<Plug>(coc-definition)", opts)
-- keymap("n", "<leader>n", "<Plug>(coc-references)", opts)
-- keymap("n", "gy", "<Plug>(coc-type-definition)", opts)
-- keymap("n", "gi", "<Plug>(coc-implementation)", opts)
keymap("n", "<leader>r", ":lua =vim.lsp.buf.rename()<CR>", opts)

-- Python format
keymap("n", "<F9>", ":Black --target_version=py36<CR>", opts)


-- Terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)


-- Visual mode
keymap("v", "//", "y/\\V<C-R>=escape(@\",'/\')<CR><CR>", opts)
