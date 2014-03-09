if has('vim_starting')
    set nocompatible

    " Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:neobundle_default_git_protocol="git"

" Required
call neobundle#rc(expand('~/.vim/bundle/'))

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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
" dont want this to override defaults!
" Bundle 'derekwyatt/vim-scala'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'

NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'yurifury/hexHighlight'
NeoBundle 'mattn/gist-vim'
NeoBundle 'laurentgoudet/vim-howdoi'
NeoBundle 'nelstrom/vim-markdown-folding'

" Colorscheme
NeoBundle 'xoria256.vim'

" For automatically marking scripts as executable
NeoBundle 'Shebang'
NeoBundle 'bufkill.vim'
NeoBundle 'vcscommand.vim'

NeoBundle 'NERD_tree-Project'
NeoBundle 'taglist.vim'
NeoBundle 'a.vim'
NeoBundle 'opencl.vim'

" haskell
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'Twinside/vim-haskellConceal'

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
