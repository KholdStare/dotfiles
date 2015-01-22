if has('vim_starting')
    set nocompatible

    " Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:neobundle_default_git_protocol="git"

" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" By the power of Shougo!
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
"NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'wincent/Command-T', {
      \ 'build' : {
      \     'unix' : 'ruby ruby/command-t/extconf.rb && mv Makefile ruby/command-t && make -C ruby/command-t',
      \     'mac' : 'ruby ruby/command-t/extconf.rb && mv Makefile ruby/command-t && make -C ruby/command-t',
      \    },
      \ }

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'yurifury/hexHighlight'
NeoBundle 'laurentgoudet/vim-howdoi'
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'godlygeek/tabular'

" Colorscheme
NeoBundle 'xoria256.vim'

" For automatically marking scripts as executable
NeoBundle 'Shebang'
" Provides :BD to close a buffer without closing the window
NeoBundle 'bufkill.vim'

NeoBundle 'NERD_tree-Project'
NeoBundle 'a.vim'
NeoBundle 'opencl.vim'

" haskell
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'Twinside/vim-haskellConceal'

" idris
NeoBundle 'idris-hackers/idris-vim'

" rust
NeoBundle 'wting/rust.vim'

call neobundle#end()

filetype plugin indent on     " required! 

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
