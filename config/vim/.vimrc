"
" ~/.vimrc - part of dotfiles maintained by Mateusz Loskot <mateusz@loskot.net>
"
" Credits go to:
"   Vincent Driessen - http://nvie.com/posts/how-i-boosted-my-vim/
"   Steve Losh - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"   Haridas N - http://haridas.in/vim-as-your-ide.html
"   Jeffrey Way - http://net.tutsplus.com/sessions/vim-essential-plugins/

" Preamble {{{
"  Windows Compatible {{{
"   On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
"   across (heterogeneous) systems easier.
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$HOME/vimfiles,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" On my Arch, Powerline is on by default, but on Debian it is not.
set runtimepath+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
" }}}

filetype off
"execute pathogen#infect()
"execute pathogen#helptags()
syntax on
filetype plugin indent on
set nocompatible
set nomodeline
set shell=/bin/bash
" }}}

" Basic behaviour and user interface experience
" {{{
set title
set visualbell
set noerrorbells
set ttyfast
set relativenumber "number " always show line numbers
set showmode
set showcmd " show (partial) command in status line.
set ruler " show the cursor position all the time
set laststatus=2
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildmenu " command-line completion enhanced mode
set wildmode=list:longest
set lazyredraw
set mouse=a
set t_Co=256
colorscheme desert
if has('gui_running')
    set vb t_vb="<ESC>|30f" " Turn off beep
    set guioptions-=T " Hide toolbar
    set guioptions+=m " Show menubar
    if has('win32') || has('win64')
        set guifont=Terminus:h12 ""DejaVu Sans Mono"
    else
        set guifont=Terminus
    endif
endif
" }}}

" File and buffer handling
" {{{
set encoding=utf-8
set nobackup
set noswapfile
set autowrite " automatically save before commands like :next and :make
set hidden
au FocusLost * :wa " emulate TextMate's save on losing focus feature
" }}}

" Mappings
" {{{
let mapleader = ","
set backspace=indent,eol,start
" quick escaping insert mode
inoremap jj <ESC>
"inoremap <ESC> <nop> " hard-core jj-mode
"   Moving
"   {{{
" DO NOT DO THIS! Go back to Vim roots!
" " use jkl; instead of hjkl as ergonomic alternative over historic
" noremap ; l
" noremap l k
" noremap k j
" noremap j h
" disable default arrow keys to practice hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" disable F1 help key to make aiming ESC easier
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"   }}}
"   Splits
"   {{{
" close split
nnoremap <leader>q <C-w>q
" open new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" open new horizontal split and switch to it
nnoremap <leader>s <C-w>s<C-w>l
" move around splits
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
nnoremap <C-j>  <C-w>h
nnoremap <C-k>  <C-w>j
nnoremap <C-l>    <C-w>k
nnoremap <C-;> <C-w>l
"   }}}
"   Utilities
"   {{{
" open file under cursor in vsplit
nnoremap <F8> :vertical wincmd f<CR>
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" re-hardwrap paragraphs of text
nnoremap <leader>rw gqip
" ,ft mapped to a fold tag function:
nnoremap <leader>ft Vatzf
" bring Ack ready to search - https://github.com/mileszs/ack.vim
nnoremap <leader>a :Ack
"   }}}
" }}}

" Searching and replacing
" {{{
" turn off Vim default regex characters and make searches use normal regexes
nnoremap / /\v
vnoremap / /\v
" deal with case-sensitive search intelligently
set ignorecase
set smartcase
" apply global substitutions automatically on lines
"set gdefault
" highlight search results
set incsearch
set hlsearch
set showmatch " show matching brackets.
set matchtime=3 " tenths of a second delay for 'showmatch' to kick in
set scrolloff=10 " move to display at least 5 lines of context
set synmaxcol=800 " don't highlight lines longer than n characters
" make it easy to clear out a search highlights by typing ,<space> or ,/
"nnoremap <leader><space> :nohlsearch<CR>
nmap <silent> ,/ :nohlsearch<CR>
" make tab key match bracket pairs, easier than %
nnoremap <tab> %
vnoremap <tab> %
" }}}

" Editing
" {{{
set cursorline
" handle long lines
set nowrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85
" folding
set foldmethod=indent " syntex
set foldlevel=99
" indentation
set cindent
" tab key
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" show invisible characters with the same characters that TextMate uses
"set list " disabled by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" }}}

" Plugins {{{
"   NERDTree {{{
map <F11> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
let g:NERDTreeChDirMode=2
"   }}}
"   FuzzyFinder {{{
nmap <leader>f  :FufFileWithCurrentBufferDir<CR>
nmap <leader>fb :FufBuffer<CR>
nmap <leader>ft :FufTaggedFile<CR>
"   }}}
"   TabBar {{{
let g:Tb_MapCTabSwitchBufs = 1
let g:Tb_MaxSize = 0
"let g:Tb_MoreThanOne=1
let g:Tb_ModSelTarget = 1
" Avoid invisible filename for some colorscheme like Molokai
hi Tb_VisibleNormal guibg=darkblue ctermbg=darkblue
"   }}}
"   MiniBuffer {{{
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapCTabSwitchWindows = 1
"   }}}
"   TagBar {{{
nmap <F12> :TagbarToggle<CR>
"   }}}
"   Rainbow Paranthesis {{{
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"   }}}
"   clang_complete {{{
let g:clang_library_path="/usr/lib"
let g:clang_use_library=1
"   }}}
" }}}
