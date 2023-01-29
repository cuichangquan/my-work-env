vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[
" https://qiita.com/xeno1991/items/8d1c8f38595337bab7c8
let g:tex_conceal='' " texのconcealを無効化（#^ω^）

" https://github.com/mhinz/neovim-remote
" このように設定することで、lazygitがneovimで「e」キーで対象ファイルを開けた。
let $VISUAL = 'nvr'
" 「e」で対象ファイル開けなかった。そもそも引数があると、だめぽい。
" let $VISUAL = 'nvr -cc split --remote-wait'
]])

vim.cmd([[
"-- start ---'tpope/vim-fugitive'--------
command! GB Git blame

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd BufReadPost fugitive://* set bufhidden=delete

"Delete all Git conflict markers
"https://vi.stackexchange.com/questions/10534/is-there-a-way-to-take-both-when-using-vim-as-merge-tool
function! RemoveConflictMarkers() range
silent execute a:firstline.','.a:lastline . ' g/^<\{7}\|^|\{7}\|^=\{7}\|^>\{7}/d'
endfunction

"-range=% default is whole file
command! -range=% GremoveConflictMarkers <line1>,<line2>call RemoveConflictMarkers()

"-- end ---------------------------------


"-- start ---'Shougo/denite.nvim'--------
" Define mappings
function! s:denite_my_settings() abort
nnoremap <silent><buffer><expr> <CR>            denite#do_map('do_action')
nnoremap <silent><buffer><expr> <TAB>           denite#do_map('choose_action')
nnoremap <silent><buffer><expr> d               denite#do_map('do_action', 'delete')
nnoremap <silent><buffer><expr> p               denite#do_map('do_action', 'preview')
nnoremap <silent><buffer><expr><nowait> q       denite#do_map('quit')
nnoremap <silent><buffer><expr><nowait> <ESC>   denite#do_map('quit')
nnoremap <silent><buffer><expr> i               denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> <Space>         denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite call s:denite_my_settings()
noremap [Denite] <Nop>
nmap <C-u> [Denite]
nnoremap <silent> <Space><Space><Space> :<C-u>Denite file_mru       <CR>
nnoremap <silent> [Denite]<C-j>         :<C-u>DeniteCursorWord grep <CR>
nnoremap <silent> [Denite]<C-u>         :<C-u>Denite file/old       <CR>
nnoremap <silent> [Denite]<C-d>         :<C-u>Denite directory_mru  <CR>
nnoremap <silent> [Denite]<C-b>         :<C-u>Denite buffer         <CR>
nnoremap <silent> [Denite]<C-f>         :<C-u>Denite file/rec       <CR>
nnoremap <silent> [Denite]<C-g>         :<C-u>Denite grep           <CR>
nnoremap <silent> [Denite]<C-l>         :<C-u>Denite line           <CR>
nnoremap <silent> [Denite]<C-y>         :<C-u>Denite neoyank        <CR>
nnoremap <silent> [Denite]<C-r>         :<C-u>Denite -resume        <CR>

nnoremap <silent> <Leader>b :<C-u>Denite buffer<CR>

" agの使用
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['--case-sensitive', '--follow', '--nogroup', '--nocolor'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])

"http://replicity.hateblo.jp/entry/2017/06/03/140731
call denite#custom#option('default', 'prompt', '>')      " プロンプトの左端に表示される文字を指定
call denite#custom#option('default', 'direction', 'top') " deniteの起動位置をtopに変更

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('insert', '<Up>',   '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('normal', '<Up>',   '<denite:move_to_previous_line>', 'noremap')

call denite#custom#source('file/old', 'matchers', ['matcher_cpsm', 'matcher/project_files'])
call denite#custom#source('file/rec', 'matchers', ['matcher_cpsm', 'matcher/project_files'])

call denite#custom#source('rails_log', 'max_candidates', 3000)
"-- end ---------------------------------

"-- start ---'Shougo/neomru.vim'--------
let g:neomru#file_mru_limit = 100
"-- end ---------------------------------

"-- start ---'vim-airline/vim-airline'---
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
"-- end ---------------------------------

"-- start ---'airblade/vim-rooter'---
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
let g:rooter_change_directory_for_non_project_files = ''
"-- end ---------------------------------

"-- start ---'majutsushi/tagbar'---
" このプラグインはJumpToRoutesTxtでController#action名の取得に使用されている
nmap <F8> :TagbarToggle<CR>
"-- end ---------------------------------

"-- start ---'bfredl/nvim-miniyank'---
" neovimの矩形ビジュアルモードからyankした時、上手くpasteできないなら？
" https://qrunch.net/@rugamaga/entries/bbx3xxm7d5RHNcT3
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
"-- end ---------------------------------

"-- start ---'PsychoLlama/z.vim'---
let g:zcd#path = expand('~/sai/z/z.sh')
"-- end ---------------------------------

"-- start ---'vifm/vifm.vim'---
" https://github.com/vifm/vifm.vim/blob/master/doc/plugin/vifm-plugin.txt
" nnoremap <Leader>h :Vifm<CR>
"-- end ---------------------------------

"-- start ---'junegunn/fzf'---

set rtp+=/usr/local/opt/fzf

" set prefix
"let g:fzf_command_prefix = 'FZF'

" fzf layout
let g:fzf_layout = { 'window': '-tabnew' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"-- end ---------------------------------

"-- start ---'github/copilot.vim'---
" Tabは他のpluginによって使われていたためC-Jに変更した
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <C-a><C-s>   <Plug>(copilot-suggest)
imap <C-a><C-p>   <Plug>(copilot-previous)
imap <C-a><C-n>   <Plug>(copilot-next)
imap <C-a><C-j>   <Plug>(copilot-dismiss)
let g:copilot_no_tab_map = v:true
"-- end ---------------------------------

"-- start ---'vim-scripts/Align'---
" https://teratail.com/questions/68916
" <Space>w=を無効にすることで<Space>wを動作を早くしたい
" <Space>w=の使い方もわからないので、一旦無効にした
map <Nop>(<Plug>AM_w=) <Plug>AM_w=
"-- end ---------------------------------


"-- start ---'t9md/vim-quickhl'---
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"-- end ---------------------------------


"-- start ---'tyru/caw.vim'--------------
nmap <silent>gcc <Plug>(caw:hatpos:toggle)
vmap <silent>gcc <Plug>(caw:hatpos:toggle)
"-- end ---------------------------------


"-- start ---'kana/vim-altr'--------------
nmap <F3> <Plug>(altr-forward)
nmap <F2> <Plug>(altr-back)

" For ruby tdd
" call altr#define('%.rb', 'spec/%_spec.rb')
" For rails tdd
" call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
" call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
" call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
"-- end ---------------------------------

"-- start ---'cuichangquan/vim-rails'--------------
let g:rails_app_root = substitute(system('git rev-parse --show-toplevel'), '\n', '', 'g')
let g:routes_cache_file = g:rails_app_root . '/_routes.txt'
"-- end ---------------------------------


"-- start ---'tyru/open-browser.vim'-----
vmap gx <Plug>(openbrowser-smart-search)
"-- end ---------------------------------


"-- start ---'nathanaelkane/vim-indent-guides'--------------
let g:indent_guides_enable_on_vim_startup = 1

" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=2
set shiftwidth=2
"-- end ---------------------------------------------------


"-- start ---'terryma/vim-expand-region'--------------
" なくてはならない設定
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"-- end ---------------------------------


"-- start ---'simeji/winresizer'--------------
" If you want to start window resize mode by `Ctrl+T`
let g:winresizer_start_key = '<C-T>'
"-- end ---------------------------------
]])
