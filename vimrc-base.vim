set nocompatible

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
" Necessary to show unicode glyphs
set encoding=utf-8

" Enable mouse support
set mouse=a

" Display line numbers
set number

" Enable syntax highlighting detection
syntax on

" Better command-line completion
set wildmenu
" shell style completion
" set wildmode=list:longest

" Ignore intermediates and source control in wildcard searches
set wildignore+=*.o,*.obj,*.d,.git,CVS,.svn,_darcs,*.hi,.tox

" Enable backup, persistent undo, and persistent views
set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif
set viewoptions=folds,options,cursor,unix,slash

" disable using alt modifier for accessing window menus
set winaltkeys=no

" smarter searching. ignores case if all letters same case
set ignorecase 
set smartcase
set incsearch

" remap leader
let mapleader = " "

" sets the title of the shell to the curretly opened file
set title

" most of the time wrapping is annoying
set nowrap

" if we do wrap, split on words rather than characters
set linebreak

" cursor position
set ruler

" Show partial commands in the last line of the screen
set showcmd

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Set the status line the way i like it (disabled now because of powerline)
" set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Toggle between 'paste' and 'nopaste' using F2
set pastetoggle=<F2>

" Highlight when searching
set hlsearch

" enable omnicompletion
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <leader>hc :nohl<CR><C-L>

" keep longer history
set history=1000

" enable extended % matching
runtime macros/matchit.vim

" Keep buffer open even if not visible
" prevents prompts to save file when opening new ones
set hidden

" Show matching bracket when cursor is on it
set showmatch

" Folding settings
set foldmethod=syntax
set foldnestmax=2
set foldlevelstart=99

" Handle mouse events better through ssh/tmux
if !has('nvim')
  set ttymouse=xterm2
endif

set runtimepath+=/usr/share/vim/vimfiles

"-----------------------------------------------------------------------------
" Tag preferences
"-----------------------------------------------------------------------------
" Add any global tags (for libraries)
let global_tags_dir='~/dotfiles/.global-tags'
let &tags = join(split(globpath(global_tags_dir, '**/tags'), '\n'), ',')
" default tags
set tags+=./tags;/

" Show list of possible tags if more than one,
" otherwise jump directly
nnoremap <C-]> g<C-]>

" Use Ctrl-space Ctrl-space to look up usage using cscope
nmap <C-@><C-@> :cs find s <C-R>=expand("<cword>")<CR><CR>

"-----------------------------------------------------------------------------
" Movement preferences
"-----------------------------------------------------------------------------
" Window movement command mapping
"nnoremap <C-k> <C-w>k
"nnoremap <C-j> <C-w>j
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"
"" Ctrl-{hjkl} for navigating out of terminal panes
"if has('nvim')
"  tnoremap <C-h> <C-\><C-n><C-w>h
"  tnoremap <C-j> <C-\><C-n><C-w>j
"  tnoremap <C-k> <C-\><C-n><C-w>k
"  tnoremap <C-l> <C-\><C-n><C-w>l
"endif

" Keep selection after indenting
vnoremap > >gv
vnoremap < <gv

" Movement default gj and gk
nnoremap j gj
nnoremap k gk

" slightly faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" scroll with the cursor if its within 3 lines of the edge
set scrolloff=3

" swap tilde and apostrophe, for better mark navigation
nnoremap ' `
nnoremap ` '

" Virtual Editing mode 
set virtualedit=block

"-----------------------------------------------------------------------------
" Indentation
"-----------------------------------------------------------------------------
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent plugin on

" Shortcut to rapidly toggle `set list` for looking at indentation
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"-----------------------------------------------------------------------------
" Line Endings
"-----------------------------------------------------------------------------
" Prefer dos line endings on cygwin in windows
if has('win32unix')
  set fileformats=dos,unix
endif

"-----------------------------------------------------------------------------
" Custom command mappings
"-----------------------------------------------------------------------------

" Find Uses
nmap <leader>fu yiw:vimgrep /"/ ./**/*.c
vmap <leader>fu y:vimgrep /"/ ./**/*.c

" Quick replace 
nmap <leader>r yiw:%s/"//g<Left><Left>
vmap <leader>r y:%s/"//g<Left><Left>

" Visually selected text also yanked into clipboard
if has("clipboard")
  vnoremap y ygv"+y
  vnoremap Y Ygv"+Y
endif

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


"-----------------------------------------------------------------------------
" Set up autocommands
"-----------------------------------------------------------------------------
if has("autocmd")
    " Source the vimrc file after saving it
    autocmd! bufwritepost .vimrc source $MYVIMRC
    " OpenCL filetype detection
    autocmd! BufRead,BufNewFile *.cl set filetype=opencl
    " SConstruct filetype detection
    autocmd! BufRead,BufNewFile SConstruct set filetype=python
endif

"-----------------------------------------------------------------------------
" Custom settings depending on local environment
"-----------------------------------------------------------------------------
" Use scons
if filereadable("SConstruct")
    set makeprg=scons
endif

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

" Store swap/backup files in fixed location, not current directory.
" Adapted from https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
function! InitializeDirectories()
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let parent = $HOME
    let common_dir = parent . '/.vim'

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
