set nocompatible
filetype off                   " required!

let g:vundle_default_git_proto="git"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" By the power of Shougo!
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/unite-outline'
Bundle 'Shougo/unite-help'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
" dont want this to override defaults!
" Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'

Bundle 'coderifous/textobj-word-column.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-powerline'
Bundle 'yurifury/hexHighlight'
Bundle 'mattn/gist-vim'

" Colorscheme
Bundle 'xoria256.vim'

" For automatically marking scripts as executable
Bundle 'Shebang'
Bundle 'bufkill.vim'
Bundle 'vcscommand.vim'

Bundle 'NERD_tree-Project'
Bundle 'taglist.vim'
Bundle 'a.vim'
Bundle 'opencl.vim'

" haskell
Bundle 'eagletmt/neco-ghc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Twinside/vim-haskellConceal'


filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
