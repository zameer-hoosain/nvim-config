vim.opt.clipboard = "unnamed"                   -- allow neovim to access the sysem clipboard
vim.opt.cmdheight = 2                           -- use two lines for command line
vim.opt.completeopt = { "menuone", "noselect" } -- show a menu for a single match and force user to select
vim.opt.number = true                           -- show numbers
vim.opt.relativenumber = true                   -- show relative numbers
vim.opt.scrolloff = 8                           -- vertical scroll space
vim.opt.sidescrolloff = 8                       -- horizontal scroll space
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- insert 4 spaces for 1 tab
vim.opt.softtabstop = 4                         -- treat tabs correctly when editing
vim.opt.swapfile = false                        -- disable swapfiles
vim.opt.tabstop = 4                             -- tab width
vim.opt.showmatch = true                        -- show matching brackets if on screen
vim.opt.wrap = false                            -- disable wrapping
vim.opt.undofile = true                         -- enable undo files for persistent undo
vim.opt.backup = false                          -- no backup files
vim.opt.ignorecase = true                       -- ignore cases when searching
vim.opt.smartcase = true                        -- searches become case sensitive if an Upper case character is used.
vim.opt.incsearch = true                        -- show search matches live
vim.opt.pumheight = 10                          -- pop-up menu height
vim.opt.mouse = ""                              -- allow mouse in no modes
vim.opt.textwidth = 100                         -- 100 char 'limit'
vim.opt.autoindent = true                       -- enable auto indents
vim.opt.smartindent = true                      -- enable smart indents
vim.opt.splitbelow = true                       -- split below
vim.opt.splitright = true                       -- split right
vim.opt.signcolumn = "yes"                      -- always show the sign column
vim.opt.termguicolors = true                    -- set terminal gui colors
vim.opt.guifont = ""


vim.cmd [[set formatoptions-=t]]                -- remove tabs from pasted content
vim.g.python_highlight_all = 1

