vim.g.tokyonight_style = "storm"
vim.g.tokyonight_terminal_colors = false

vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
