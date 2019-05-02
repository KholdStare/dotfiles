"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
source ~/dotfiles/vimrc-base.vim

"-----------------------------------------------------------------------------
" NeoBundle (Plugins)
"-----------------------------------------------------------------------------
source ~/dotfiles/bundles.vim

"-----------------------------------------------------------------------------
" Custom mappings for plugins
"-----------------------------------------------------------------------------

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" opens nerd tree in project root dir
map <silent> <F6> :ToggleNERDTree<CR>
map <silent> <F7> :TagbarToggle<CR>

" Get Stack Overflow code snippets
map <leader>so <Plug>Howdoi

" Switch between complementary filetypes
" mnemonic: Go Switch
nnoremap gs :A<CR>

"-----------------------------------------------------------------------------
" Haskell
"-----------------------------------------------------------------------------

augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

"-----------------------------------------------------------------------------
" Plugin preferences
"-----------------------------------------------------------------------------
" Colorscheme
colorscheme xoria256

" ultisnips snippet location
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

" Neomake
call neomake#configure#automake('w')
let g:neomake_haskell_enabled_makers = []

" Use unicode symbols for powerline
" let g:Powerline_symbols="unicode"

" Autocomplete menu options
set completeopt=longest,menuone

"-----------------------------------------------------------------------------
" Tagbar
"-----------------------------------------------------------------------------
source ~/dotfiles/tagbar-rc.vim

if has("autocmd")
    function! TurnOffTaxingFeaturesIfLargeFile()
        let numLines = line('$')

        if numLines > 3000
            setlocal foldmethod=manual
        endif

        if numLines > 6000
            let b:tagbar_ignore = 1
        endif
    endfunction

    " disable plugins/features that fail on large files
    autocmd BufNewFile,BufReadPost *.h call TurnOffTaxingFeaturesIfLargeFile()
endif

"-----------------------------------------------------------------------------
" Syntastic
"-----------------------------------------------------------------------------

" C++
let g:syntastic_cpp_compiler_options = '-Wall -Werror -std=c++17'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt4/Qt', '/usr/include/qt4', '/usr/include/qt4/QtGui', '/usr/include/qt4/QtCore' ]

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-Wall', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion'],
   \ }

" Haskell
let g:syntastic_haskell_ghc_mod_args = '-g -fno-warn-unused-binds -g -fwarn-incomplete-patterns'
let g:syntastic_haskell_hlint_args = '--ignore="Redundant bracket"'

" Python
let g:syntastic_python_checkers = ['python', 'flake8']

" extra custom vim settings for current dir
if filereadable(".custom.vim")
    so .custom.vim
endif


