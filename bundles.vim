call plug#begin()

" fuzzy search
Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" {{{
"augroup fzf_group
"    autocmd FileType fzf nnoremap <buffer> <C-h> <C-h>
"    autocmd FileType fzf nnoremap <buffer> <C-j> <C-j>
"    autocmd FileType fzf nnoremap <buffer> <C-k> <C-k>
"    autocmd FileType fzf nnoremap <buffer> <C-l> <C-l>
"augroup END
" }}}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
if has('nvim')
    Plug 'neomake/neomake'
else
    Plug 'scrooloose/syntastic'
endif
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'yurifury/hexHighlight', { 'for': 'css' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'

" Colorscheme
Plug 'vim-scripts/xoria256.vim'

" Provides :BD to close a buffer without closing the window
Plug 'vim-scripts/bufkill.vim'

Plug 'vim-scripts/NERD_tree-Project'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/opencl.vim'

" haskell
if has('nvim')
    Plug 'neovimhaskell/haskell-vim'
endif
Plug 'parsonsmatt/intero-neovim'
"Plug 'Twinside/vim-haskellConceal'

" idris
Plug 'idris-hackers/idris-vim'

" nim
Plug 'zah/nim.vim'

" rust
Plug 'wting/rust.vim'

" python
Plug 'tshirtman/vim-cython'

" z3
Plug 'raichoo/smt-vim'

call plug#end()
