vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'skanehira/gh.vim'
  use 'mattesgroeger/vim-bookmarks'
  use 'vim-airline/vim-airline-themes'
  use 'mattn/webapi-vim'
  use 'tpope/vim-surround'
  use 'vim-scripts/yanktmp.vim'
  -- # 検索用の素晴らしいプラグイン :S/検索キーワード :%S/xxx/yyy 置換
  use 'tpope/vim-abolish'
  use 'thinca/vim-visualstar'
  use 'tmhedberg/matchit'
  use 'tpope/vim-unimpaired'
  use 'vim-ruby/vim-ruby'
  use 'kana/vim-textobj-user'
  use 'rhysd/vim-textobj-ruby'
  use 'tpope/vim-rbenv'
  use 'tpope/vim-bundler'

  -- Lazy loading:
  -- Load on specific commands

  -- Gbrowse to open Bitbucket URL
  use {'tommcdo/vim-fubitive', opt = true, cmd = {'Gbrowse'}}

  -- Gbrowse to open Github URL
  use {'tpope/vim-rhubarb', opt = true, cmd = {'Gbrowse'}}

end)
