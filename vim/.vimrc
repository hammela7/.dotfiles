" Colors {{{
syntax enable           " enable syntax processing
colorscheme badwolf
"set termguicolors
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
" Modelines let any file you open change vim settings, and have a real RCE
" history (CVE-2019-12735); Debian ships nomodeline by default for that reason.
" This file's own fold config moves to the autocmd at the bottom instead.
set nomodeline
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline        " highlight current line
"set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:\ 
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
execute pathogen#infect()

" Replaces the trailing `vim:foldmethod=marker` modeline this file used to
" carry: same {{{ }}} folding, without needing modelines enabled globally.
augroup vimrc_folding
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END
