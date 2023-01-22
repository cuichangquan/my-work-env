vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'skanehira/gh.vim'
  use 'mattesgroeger/vim-bookmarks'
  use 'mattn/webapi-vim'
  use 'tpope/vim-surround'
  use 'vim-scripts/yanktmp.vim'
  use 'tpope/vim-abolish' -- # 検索用の素晴らしいプラグイン :S/検索キーワード :%S/xxx/yyy 置換
  use 'thinca/vim-visualstar'
  use 'tmhedberg/matchit'
  use 'tpope/vim-unimpaired'
  use 'vim-ruby/vim-ruby'
  use 'kana/vim-textobj-user'
  use 'rhysd/vim-textobj-ruby'
  use 'tpope/vim-rbenv'
  use 'tpope/vim-bundler'
  use 'tpope/vim-fugitive'
  use 'Shougo/neoyank.vim'
  use {'Shougo/denite.nvim', requires = {'Shougo/neomru.vim'}}
  use {'vim-airline/vim-airline', requires = {'vim-airline-themes'}}
  use 'airblade/vim-rooter'
  use 'rbtnn/vimconsole.vim'
  use 'majutsushi/tagbar'
  use 'bfredl/nvim-miniyank'
  use 'PsychoLlama/z.vim'
  use 'vifm/vifm.vim'
  -- use 'github/copilot.vim'
    -- 直接インストールした
    -- 効かない時は、Cloneし直すと効いたりする。
    -- git clone https://github.com/github/copilot.vim.git   ~/.config/nvim/pack/github/start/copilot.vim

  -- Lazy loading:
  -- Load on specific commands

  -- Gbrowse to open Bitbucket URL
  use {'tommcdo/vim-fubitive', opt = true, cmd = {'Gbrowse'}}

  -- Gbrowse to open Github URL
  use {'tpope/vim-rhubarb', opt = true, cmd = {'Gbrowse'}}

end)
