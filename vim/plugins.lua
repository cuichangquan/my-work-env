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
  use 'simeji/winresizer'
  use {'Shougo/denite.nvim', requires = {'Shougo/neomru.vim'}}
  use {'vim-airline/vim-airline', requires = {'vim-airline/vim-airline-themes'}}
  use 'airblade/vim-rooter'
  use 'rbtnn/vimconsole.vim'
  use 'majutsushi/tagbar'
  use 'bfredl/nvim-miniyank'
  use 'PsychoLlama/z.vim'
  use 'vifm/vifm.vim'
  use {'Shougo/vimproc.vim', run = 'make'}
  use {'junegunn/fzf', run = './install'}
  use {'junegunn/fzf.vim', requires = 'junegunn/fzf'}  -- # BCommitsなどのコマンド
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  -- TODO: うまく動かない
  -- call dein#local('~/sai/local-plugins', { 'frozen' : 1 }, ['denite_sources'])
  use { '~/sai/local-plugins', module = 'denite_sources' }

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
  use {'vim-scripts/Align', event = 'InsertEnter'}
  -- 複数ワードハイライト
  use {'t9md/vim-quickhl', keys = {'<Plug>(quickhl-manual-this)'}}
  -- これもなくてならないPlugin: コメントアウト機能(gcc)
  use {'tyru/caw.vim', keys = {'<Plug>(caw:hatpos:toggle)'}}
  use {'kana/vim-altr', ft = {'ruby', 'eruby'}}
  -- from: 'tpope/vim-rails'
  use {'cuichangquan/vim-rails', ft = {'ruby', 'eruby'}}
  use {'tyru/open-browser.vim', keys = {'<Plug>(openbrowser-smart-search)'}}
  use {'cespare/vim-toml', ft = {'toml'}}
  use {'tpope/vim-repeat', event = 'InsertEnter'}
  use {'elzr/vim-json', event = 'InsertEnter'}
  use {'nvie/vim-flake8', ft = 'python'}
  use {'nathanaelkane/vim-indent-guides', event = 'InsertEnter'}
  use {'terryma/vim-expand-region', keys = {'<Plug>(expand_region_expand)'}}
  use {'tpope/vim-dispatch', cmd = {'Dispatch','Start','Focus'}}
  use {'vim-jp/vimdoc-ja', cmd = {'help', 'h'}}
  use {'thinca/vim-quickrun', event = 'InsertEnter'}
  use {'tpope/vim-endwise', ft = 'ruby'}
  use {'Shougo/context_filetype.vim', event = 'InsertEnter'}
  use {
    'nanonanomachine/vim-redash',
    requires = 'webapi-vim',
    cmd = { 'RedashDescribe', 'RedashExecute', 'RedashPost', 'RedashSetDataSource', 'RedashShowDataSources', 'RedashShowTables' }
  }

end)
