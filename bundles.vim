call plug#begin()

if has('nvim')
  Plug 'ctrlpvim/ctrlp.vim'
else
  Plug 'wincent/Command-T', { 'do': 'ruby ruby/command-t/extconf.rb && mv Makefile ruby/command-t && make -C ruby/command-t' }
endif

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'yurifury/hexHighlight', { 'for': 'css' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'

" Colorscheme
Plug 'xoria256.vim'

" Provides :BD to close a buffer without closing the window
Plug 'bufkill.vim'

Plug 'NERD_tree-Project'
Plug 'a.vim'
Plug 'opencl.vim'

" haskell
"Plug 'eagletmt/neco-ghc'
"Plug 'eagletmt/ghcmod-vim'
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
