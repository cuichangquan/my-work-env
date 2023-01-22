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
autocmd FileType denite call s:denite_my_settings()
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

"-- start ---'github/copilot.vim'---
" Tabは他のpluginによって使われていたためC-Jに変更した
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <C-a><C-s>   <Plug>(copilot-suggest)
imap <C-a><C-p>   <Plug>(copilot-previous)
imap <C-a><C-n>   <Plug>(copilot-next)
imap <C-a><C-j>   <Plug>(copilot-dismiss)
let g:copilot_no_tab_map = v:true
"-- end ---------------------------------
