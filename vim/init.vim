" https://postd.cc/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" https://qiita.com/xeno1991/items/8d1c8f38595337bab7c8
let g:tex_conceal='' " texのconcealを無効化（#^ω^）

" これを指定することによって、起動起動スピードが早くなった.
" https://yu8mada.com/2018/08/03/how-to-install-neovim-on-macos-using-homebrew-and-set-it-up-to-make-it-able-to-be-used/
let g:python_host_prog  = expand('/usr/local/bin/python2')
let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:ruby_host_prog = expand('/usr/local/opt/ruby/bin/ruby')

lua require('plugins')
lua require('plugin_configs')
source ~/sai/my-work-env/vim/common-config.vim

" https://github.com/mhinz/neovim-remote
" このように設定することで、lazygitがneovimで「e」キーで対象ファイルを開けた。
let $VISUAL = 'nvr'
" 「e」で対象ファイル開けなかった。そもそも引数があると、だめぽい。
" let $VISUAL = 'nvr -cc split --remote-wait'
