" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Autoreload .vimrc config on change
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" basics
syntax enable
colorscheme monokai

set shiftwidth=4
set tabstop=4
set expandtab
filetype plugin on
filetype indent on

" python specific file settings:
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" splits:
" ctrl hjkl to move
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" hopefully handles colors enough
set term=screen-256color
if !has('gui_running')
    set t_Co=256
endif


"
" Plugins
" 

call plug#begin('~/.vim/plugged')

" vim specific
Plug 'ervandew/supertab'
Plug 'roxma/vim-paste-easy'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

" general editing
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'andrewradev/splitjoin.vim'
Plug 'kien/rainbow_parentheses.vim'

" filetype specific
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}

Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

Plug 'ekalinin/dockerfile.vim', { 'for': 'Dockerfile'}

Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx']}
Plug 'neoclide/vim-jsx-improve', {'for': ['js', 'jsx']}

call plug#end()

"
" Plugin Specific Settings
"

" for lightline, and hide --insert-- bar
set laststatus=2
set noshowmode

" for flake8, auto run on save
autocmd BufWritePost *.py call Flake8()

" For vim-markdown
let g:vim_markdown_folding_disabled = 1

" For indentline
let g:indentLine_color_term = 239

" For rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

