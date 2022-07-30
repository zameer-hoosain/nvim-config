-- go back to previous position in file
vim.cmd [[
augroup _general_settings
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup end
]]
