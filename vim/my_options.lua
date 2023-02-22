-- Option系 --
vim.o.timeout = 'timeoutlen=500 ttimeoutlen=50' -- https://yukidarake.hateblo.jp/entry/2015/07/10/201356
vim.o.foldmethod = 'manual'                     -- https://qiita.com/izumin5210/items/7e0ad2f86d0686d8b376
vim.o.nocompatible = true                       -- We're running Vim, not Vi!
vim.o.number = true
vim.o.termencoding = 'utf-8'
vim.o.encoding = 'utf-8'                        -- 文字コードの設定
vim.o.fileencodings = 'utf-8'                   -- fileencodingsの設定ではencodingの値を一番最後に記述する
vim.o.fileformats = 'unix,dos,mac'
vim.o.hlsearch = true                           -- 検索文字をハイライト
vim.o.smartcase = true                          -- 大文字小文字無視, 大文字ではじめたら大文字小文字無視しない
vim.o.laststatus = '2'                          -- 常にステータスラインを表示
vim.o.tabstop = '2'                             -- ファイル内の <Tab> が対応する空白の数。
vim.o.shiftwidth = '2'                          -- 自動インデントの各段階に使われる空白の数。
vim.o.expandtab = true                          -- Insertモードで: <Tab>
vim.o.hidden = true                             -- 保存されていないファイルがあるときでも別のファイルを開くことが出来る
vim.o.wildmenu = true                           -- コマンドライン補完を拡張モードにする
vim.o.wildmode = 'list:longest,full'
vim.o.backspace = 'indent,eol,start'            -- BSで削除: indentは行頭の空白,eolは改行,startは挿入モード開始位置より手前の文字
vim.o.cursorline = true                         -- カーソル行の強調表示
vim.o.mouse = 'a'
vim.o.notagbsearch = true
vim.o.ignorecase = true
vim.o.ruler = true
vim.o.virtualedit = 'block'
vim.o.wrap = false                             -- 画面の端で行を折り返すのをやめる方法
vim.o.clipboard = 'unnamedplus'

-- vim.o.autoindent = true                      -- 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
-- vim.o.nows = true                            -- 文字列検索の際、ファイルの終端から先頭に戻らない
-- vim.o.relativenumber = false                 -- 行番号を相対表示にする、移動しやすくするため
-- insert mode で deleteを有効にする
-- https://sseze.hatenablog.com/entry/20120414/1334398422
-- カーソルを行頭，行末で止まらないようにする
-- vim.o.whichwrap = 'b,s,h,l,<,>,[,]'

-- https://qiita.com/xeno1991/items/8d1c8f38595337bab7c8
-- texのconcealを無効化（#^ω^）
vim.g.tex_conceal = ""


