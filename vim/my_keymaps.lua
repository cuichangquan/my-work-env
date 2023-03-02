-- TODO
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
-- " TODO
-- keymap("n", "<Leader>j", "'"", { noremap = true })
keymap("n", "<Leader>F", "*N", { noremap = true })
keymap("n", "<Leader>[", "'[", { noremap = true })
keymap("n", "<Leader>]", "']", { noremap = true })
keymap("n", ",,", "A,<ESC", { noremap = true })

vim.cmd([[
  " -- map系 --
  " <Del> key: ノーマルモードで数値 (count) を入力しているときは、数字の最後の桁を削除します。
  map CTRL-V <BS>   CTRL-V <Del>

  nnoremap <Leader>j, '"

  " これも生産性を生む
  " gn gN: select text highlighted by search

  nnoremap <Leader>g :tabnew<CR>:Lazygit<CR>
  nnoremap <Leader>h :call Open_existed_vifm_buffer()<CR>
  nnoremap <Leader>d :call Toggle_current_directory()<CR>

  " Plugin 't9md/vim-quickhl'
  "---------------------------------------------------
  " nmap <Leader>m <Plug>(quickhl-manual-this)
  " xmap <Leader>m <Plug>(quickhl-manual-this)
  " nmap <Leader>M <Plug>(quickhl-manual-reset)
  " xmap <Leader>M <Plug>(quickhl-manual-reset)
  "---------------------------------------------------

  " https://github.com/MattesGroeger/vim-bookmarks
  " Add/remove bookmark at current line	        mm :BookmarkToggle
  " Show all bookmarks (toggle)	                ma :BookmarkShowAll
  " Clear bookmarks in current buffer only	    mc :BookmarkClear
  " Clear bookmarks in all buffers	            mx :BookmarkClearAll

  " 縦分割版gf
  " https://yuheikagaya.hatenablog.jp/entry/2012/12/03/202556
  nnoremap gs :vertical wincmd f<CR>

  " Make Terminal default mode insert
  " https://github.com/neovim/neovim/issues/8816
  autocmd TermOpen term://* startinsert
  nnoremap <Leader><Leader>s :vs<CR><C-w>l:vert term<CR>
  tnoremap <Esc><Esc><Esc> <C-\><C-n>:q!<CR>
  command! Lazygit tabnew term://lazygit

  autocmd TermClose term://.//*:lazygit* bprevious | bwipeout!

  " http://cohama.hateblo.jp/entry/20130108/1357664352
  vnoremap P "0p

  " https://neovim.io/doc/user/nvim_terminal_emulator.html#terminal-emulator
  tnoremap <Esc><Esc> <C-\><C-n>
  " " <A-h>
  " tnoremap ˙ <C-\><C-N><C-w>h
  " " <A-j>
  " tnoremap ∆ <C-\><C-N><C-w>j
  " " <A-k>
  " tnoremap ˚ <C-\><C-N><C-w>k
  " " <A-l>
  " tnoremap ¬ <C-\><C-N><C-w>l

  nnoremap <C-k> 10<UP>
  nnoremap <C-j> 10<DOWN>
  nnoremap <C-h> 15<LEFT>
  nnoremap <C-l> 15<RIGHT>

  vnoremap <C-k> 10<UP>
  vnoremap <C-j> 10<DOWN>
  vnoremap <C-h> 15<LEFT>
  vnoremap <C-l> 15<RIGHT>

  " From: https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
  nnoremap s <Nop>
  nnoremap sj <C-w>j
  nnoremap sk <C-w>k
  nnoremap sl <C-w>l
  nnoremap sh <C-w>h

  " window移動
  nnoremap sJ <C-w>J
  nnoremap sK <C-w>K
  nnoremap sL <C-w>L
  nnoremap sH <C-w>H
  " window回転
  nnoremap sr <C-w>r

  nnoremap sn :<C-u>bn<CR>
  nnoremap sp :<C-u>bp<CR>
  " buffer close
  nnoremap sq :<C-u>bd<CR>
  " nnoremap <CR> G
  " nnoremap <BS> gg

  noremap gV `[v`]
  vnoremap <silent> y y`]
  vnoremap <silent> p p`]
  nnoremap <silent> p p`]

  nnoremap ss :<C-u>split<CR>
  nnoremap sv :<C-u>vsplit<CR>
  nnoremap st :<C-u>tabnew<CR>

  nnoremap <C-s> :call Open_existed_vifm_buffer()<CR>
  nnoremap <C-p> :<C-u>FZF<CR>
  nnoremap <C-p> :<C-u>FZF<CR>

  " https://qiita.com/ymiyamae/items/cea5103c65184f55d62e
  "挿入モードのときに hl でカーソルを移動する
  inoremap <C-h> <Left>
  inoremap <C-l> <Right>

  " コマンド履歴Windowはうるさいから、:qに置き換える
  " map q: :q
  " こうすることでマイクロを終了したい時にqの待ち時間が嫌だ

  " copy current file name to clipboard
  " http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
  " just filename
  nnoremap cn :let @+ = expand("%:t")<CR>
  " 相対パス
  nnoremap cp :let @+=expand("%")<CR>
  " full path
  nnoremap cz :let @+ = expand("%:p")<CR>
  " 拡張無しのファイル名
  nnoremap cf :let @+ = fnamemodify(expand("%:p"), ":t:r:r")<CR>
]])
