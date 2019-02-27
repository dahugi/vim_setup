set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
"Git wrapper plugins
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'tpope/vim-fugitive'

"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"Search with Ctrl-P
Plugin 'kien/ctrlp.vim'
" Foding plugin
Plugin 'tmhedberg/SimpylFold'
"Nerdtree plugin
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
"
""Information line bottom of vim
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
""Syntax plugin
Plugin 'scrooloose/syntastic'

" vim-flake8 is a Vim plugin that runs the currently open file through Flake8,
" a static syntax and style checker for Python source code.
Plugin 'nvie/vim-flake8'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
"Faster HTML code writing
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
"
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-pathogen'
"
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
"
"
""Auto completion
Bundle 'Valloric/YouCompleteMe'

"" Doxygen plugin https://github.com/vim-scripts/DoxygenToolkit.vim
Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_licenseTag="Copyright (c) 2015 IRSweep. All rights reserved."

"Folding enhancement plugin
let g:SimpylFold_docstring_preview=1

" " All of your Plugins must be added before the following line
call vundle#end()            " required

"Use Space-g to go to definition under cursor
let g:ycm_autoclose_preview_window_after_completion=1

let mapleader = "-"
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>c :! docker run -i -v /home/andreas/Programming/specificpp:/specificpp:ro  --rm -t  irspectrometer /specificpp/clean_build_and_run_unit_tests.sh %

filetype plugin indent on    " required
let g:clang_format#code_style='llvm'
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
let python_highlight_all=1
syntax on
filetype plugin indent on

let g:solarized_termcolors=256
colorscheme solarized
set background=light

nmap <F8> :TagbarToggle<CR>
map <C-F> :ClangFormat<CR>  


set number
set showcmd  

set wildmenu  

" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" Folding {{{
"=== folding ===
set foldmethod=syntax   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=0    " start with fold level of 1
" }}}


au BufNewFile,BufRead *.py
            \  set tabstop=4
"            \    set softtabstop=4
             \    set shiftwidth=4
             \    set textwidth=79
             \    set expandtab
             \    set autoindent
             \    set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"Highlight bad whitespace for pytho
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

