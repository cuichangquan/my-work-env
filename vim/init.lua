local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- https://densan-labs.net/_downloads/lua.pdf
require('plugins')
require('plugin_configs')
require('my_configs')

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})

vim.cmd([[
" https://github.com/mhinz/neovim-remote
" このように設定することで、lazygitがneovimで「e」キーで対象ファイルを開けた。
let $VISUAL = 'nvr'
" 「e」で対象ファイル開けなかった。そもそも引数があると、だめぽい。
" let $VISUAL = 'nvr -cc split --remote-wait'
]])
