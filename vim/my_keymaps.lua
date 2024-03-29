local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <Leader>のmapについて、
keymap("n", "<Leader>w", ":w<CR>", { noremap = true })
keymap("n", "<Leader>q", ":q<CR>", { noremap = true })
keymap("n", "<Leader><Leader>q", ":qa!<CR>", { noremap = true })

-- 素早く動きたいので
keymap("n", "tt", "F", { noremap = true })
keymap("n", "aa", "^", { noremap = true })
keymap("n", "al", "$", { noremap = true })
-- -- jump to the middle of current line
keymap("n", "am", ":call cursor(0, virtcol('$')/2)<CR>", { noremap = true })
keymap("v", "aa", "^", { noremap = true })
keymap("v", "al", "$", { noremap = true })

-- " 貼り付けたばかりのテキストを再選択
-- " https://qastack.jp/vi/31/how-do-i-visually-select-the-block-of-text-i-just-pasted-in-vim
keymap("n", "gV", "`[v`]", { noremap = true })
keymap("n", "<Leader>f", "g*N", { noremap = true })

keymap("n", "<Leader>j", '\'"', { noremap = true })
keymap("n", "<Leader>F", "*N", { noremap = true })
keymap("n", "<Leader>[", "'[", { noremap = true })
keymap("n", "<Leader>]", "']", { noremap = true })
keymap("n", ",,", "A,<ESC", { noremap = true })

keymap("n", "<Leader>g", ":tabnew<CR>:Lazygit<CR>", { noremap = true })
keymap("n", "<Leader>h", ":call Open_existed_vifm_buffer()<CR>", { noremap = true })
keymap("n", "<Leader>d", ":call Toggle_current_directory()<CR>", { noremap = true })

-- " From: https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
keymap("n", "s", "<Nop>", { noremap = true })
keymap("n", "sj", "<C-w>j", { noremap = true })
keymap("n", "sk", "<C-w>k", { noremap = true })
keymap("n", "sl", "<C-w>l", { noremap = true })
keymap("n", "sh", "<C-w>h", { noremap = true })

-- " Plugin 't9md/vim-quickhl'
-- "---------------------------------------------------
-- " nmap <Leader>m <Plug>(quickhl-manual-this)
-- " xmap <Leader>m <Plug>(quickhl-manual-this)
-- " nmap <Leader>M <Plug>(quickhl-manual-reset)
-- " xmap <Leader>M <Plug>(quickhl-manual-reset)
-- "---------------------------------------------------

-- " https://github.com/MattesGroeger/vim-bookmarks
-- " Add/remove bookmark at current line	        mm :BookmarkToggle
-- " Show all bookmarks (toggle)	                ma :BookmarkShowAll
-- " Clear bookmarks in current buffer only	    mc :BookmarkClear
-- " Clear bookmarks in all buffers	            mx :BookmarkClearAll

-- " 縦分割版gf
-- " https://yuheikagaya.hatenablog.jp/entry/2012/12/03/202556
keymap("n", "gs", ":vertical wincmd f<CR>", { noremap = true })

keymap("n", "<C-k>", "10<UP>", { noremap = true })
keymap("n", "<C-j>", "10<DOWN>", { noremap = true })
keymap("n", "<C-h>", "15<LEFT>", { noremap = true })
keymap("n", "<C-l>", "15<RIGHT>", { noremap = true })

keymap("v", "<C-k>", "10<UP>", { noremap = true })
keymap("v", "<C-j>", "10<DOWN>", { noremap = true })
keymap("v", "<C-h>", "15<LEFT>", { noremap = true })
keymap("v", "<C-l>", "15<RIGHT>", { noremap = true })

-- " window移動
keymap("n", "sJ", "<C-w>J", { noremap = true })
keymap("n", "sK", "<C-w>K", { noremap = true })
keymap("n", "sL", "<C-w>L", { noremap = true })
keymap("n", "sH", "<C-w>H", { noremap = true })

-- " window回転
keymap("n", "sr", "<C-w>r", { noremap = true })
keymap("n", "sn", ":<C-u>bn<CR>", { noremap = true })
keymap("n", "sp", ":<C-u>bp<CR>", { noremap = true })
-- " buffer close
keymap("n", "sq", ":<C-u>bd<CR>", { noremap = true })

  -- " http://cohama.hateblo.jp/entry/20130108/1357664352
keymap("v", "P", '"0p', { noremap = true })

keymap("n", "ss", ":<C-u>split<CR>", { noremap = true })
keymap("n", "sv", ":<C-u>vsplit<CR>", { noremap = true })
keymap("n", "st", ":<C-u>tabnew<CR>", { noremap = true })

keymap("n", "gV", "`[v`]", { noremap = true })
keymap("v", "y", "y`]", { noremap = true, silent = true})
keymap("v", "p", "p`]", { noremap = true, silent = true})
keymap("n", "p", "p`]", { noremap = true, silent = true })

keymap("n", "<C-s>", ":call Open_existed_vifm_buffer()<CR>", { noremap = true })
keymap("n", "<C-p>", ":<C-u>FZF<CR>", { noremap = true })

-- " https://qiita.com/ymiyamae/items/cea5103c65184f55d62e
-- "挿入モードのときに hl でカーソルを移動する
keymap("i", "<C-h>", "<Left>", { noremap = true })
keymap("i", "<C-l>", "<Right>", { noremap = true })

-- " copy current file name to clipboard
-- " http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
keymap("n", "cn", ':let @+ = expand("%:t")<CR>', { noremap = true })                           -- " just filename
keymap("n", "cp", ':let @+=expand("%")<CR>', { noremap = true })                               -- " 相対パス
keymap("n", "cz", ':let @+ = expand("%:p")<CR>', { noremap = true })                           -- " full path
keymap("n", "cf", ':let @+ = fnamemodify(expand("%:p"), ":t:r:r")<CR>', { noremap = true })    -- " 拡張無しのファイル名

keymap("n", "<C-V><BS>", "<C-V><Del>", {silent = true})

vim.api.nvim_create_user_command( 'Lazygit', 'tabnew term://lazygit', {} )

-- " Make Terminal default mode insert
-- " https://github.com/neovim/neovim/issues/8816
vim.api.nvim_create_autocmd("TermOpen", { pattern = { "term://*" }, command = "startinsert", })
vim.api.nvim_create_autocmd("TermClose", { pattern = { "term://.//*:lazygit*" }, command = "bprevious | bwipeout!", })

keymap("t", "<Esc><Esc><Esc>", "<C-\\><C-n>:q!<CR>", { noremap = true })
keymap("n", "<Leader><Leader>s", ":vs<CR><C-w>l:vert term<CR>", { noremap = true })
