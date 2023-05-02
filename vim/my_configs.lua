vim.cmd([[
  colorscheme elflord
  syntax on
  filetype on            " ファイル形式の検出を有効化
  filetype indent on    " Enable filetype-specific indenting
  filetype plugin on    " Enable filetype-specific plugins
]])

-- TODO:  auocmd
vim.cmd([[
  " https://stackoverflow.com/questions/49165624/netrw-modifying-directories-always-complains
  autocmd FileType netrw setlocal bufhidden=delete

  "保存時に行末の空白を自動で削除(2016-10-21)
  autocmd BufWritePre * :%s/\s\+$//ge

  " https://qiita.com/1000k/items/6d4953d2dd52fdd86556
  " ANSI color codes を除去する
  command! DeleteAnsi %s/\[[0-9;]*m//g

  " ? or / 検索したキーワード数をカウントする。
  " http://advweb.seesaa.net/article/13053855.html   # 「|」で区切って、複数のコマンドを連続一度実行
  " http://d.hatena.ne.jp/hide04/20111223/1324621495 # vimコマンド出力をクリップボードへコピー
  command! Count :redir @*> | :%s//&/gn | :redir END

  " 最後に保存してから、どのくらい編集したのかの差分を表示
  " gitが感知できないバファの変更を表示してくれる
  " https://nanasi.jp/articles/howto/diff/diff-original-file.html
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

  "Delete all Git conflict markers
  "https://vi.stackexchange.com/questions/10534/is-there-a-way-to-take-both-when-using-vim-as-merge-tool
  function! RemoveConflictMarkers() range
    " echom a:firstline.'-'.a:lastline
    silent execute a:firstline.','.a:lastline . ' g/^<\{7}\|^|\{7}\|^=\{7}\|^>\{7}/d'
  endfunction
  "-range=% default is whole file
  command! -range=% GremoveConflictMarkers <line1>,<line2>call RemoveConflictMarkers()

  source ~/sai/my-work-env/vim/jira_prject.vim
  source ~/sai/my-work-env/vim/ccq.vim
  source ~/sai/work-config/work-config.vim

  " TODO:なんか効いていない。
  " https://postd.cc/how-to-boost-your-vim-productivity/
  " vp doesn't replace paste buffer
  " function! RestoreRegister()
  "   let @" = s:restore_reg
  "   return ''
  " endfunction
  " function! s:Repl()
  "   let s:restore_reg = @"
  "   return "p@=RestoreRegister()\<cr>"
  " endfunction
  " vmap <silent> <expr> p <sid>Repl()

  " https://qiita.com/wadako111/items/755e753677dd72d8036d
  " The prefix key.
  nnoremap [Tag]   <Nop>
  nmap t [Tag]
  " Tab jump
  for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
  endfor
  " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

  map <silent> [Tag]c :tablast <bar> tabnew<CR>
  " tc 新しいタブを一番右に作る
  map <silent> [Tag]x :tabclose<CR>
  " tx タブを閉じる
  map <silent> [Tag]n :tabnext<CR>
  " tn 次のタブ
  map <silent> [Tag]p :tabprevious<CR>
  " tp 前のタブ

  function! Open_existed_vifm_buffer() abort
    " if bufname('vifm') != ""
    "   execute("buffer vifm:")
    "   execute("normal i")
    " else
      execute("Vifm")
    " endif
  endfun

  function! Toggle_current_directory() abort
    let pwd = getcwd()
    let root = FindRootDirectory()
    let current_file_directory = expand('%:p:h')

    if current_file_directory == pwd
      execute("cd " . root )
      execute("pwd")
    else
      execute("cd " . current_file_directory)
      execute("pwd")
    endif
  endfun

  command! ToggleCurrentDirectory call Toggle_current_directory()
  nnoremap <C-]> g<C-]>

]])

-- " https://superuser.com/questions/214696/how-can-i-discard-my-undo-history-in-vim
-- " A function to clear the undo history
-- function! <SID>ForgetUndo(isBang)
--     let old_undolevels = &undolevels
--     set undolevels=-1
--     if a:isBang ==# ''
--       edit!
--     else
--       exe "normal a \<BS>\<Esc>"
--     endif
--     let &undolevels = old_undolevels
--     unlet old_undolevels
-- endfunction
-- command! -bang -nargs=0 UndoClear call <SID>ForgetUndo('<bang>')
-- command! -bang -nargs=0 ClearUndo call <SID>ForgetUndo('<bang>')

vim.cmd([[
" https://github.com/mhinz/neovim-remote
" このように設定することで、lazygitがneovimで「e」キーで対象ファイルを開けた。
let $VISUAL = 'nvr'
" 「e」で対象ファイル開けなかった。そもそも引数があると、だめぽい。
" let $VISUAL = 'nvr -cc split --remote-wait'
]])
