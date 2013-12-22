
"-----------------------------------------------------------------------------
" Vundle (Plugins)
"-----------------------------------------------------------------------------
source ~/dotfiles/bundles.vim

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
source ~/dotfiles/vimrc-base.vim

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
map <F6> :ToggleNERDTree<CR>
map <F7> :TlistToggle<CR>

" Switch between complementary filetypes
" mnemonic: Go Switch
nnoremap gs :A<CR>

"-----------------------------------------------------------------------------
" Plugin preferences
"-----------------------------------------------------------------------------
" Colorscheme
colorscheme xoria256

" ultisnips snippet location
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

" Command-T settings
let g:CommandTMaxFiles=30000

" Use unicode symbols for powerline
let g:Powerline_symbols="unicode"

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
if has("autocmd")
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
endif
set completeopt=longest,menuone

"-----------------------------------------------------------------------------
" Neocomplete
"-----------------------------------------------------------------------------
source ~/dotfiles/.neco-rc.vim

"-----------------------------------------------------------------------------
" Unite
"-----------------------------------------------------------------------------
source ~/dotfiles/unite-rc.vim

"-----------------------------------------------------------------------------
" Syntastic
"-----------------------------------------------------------------------------

" C++
let g:syntastic_cpp_compiler_options = ' -Wall -Werror -std=c++0x'
let g:syntastic_cpp_compiler = 'g++-4.7'
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt4/Qt', '/usr/include/qt4', '/usr/include/qt4/QtGui', '/usr/include/qt4/QtCore' ]

" Haskell
let g:syntastic_haskell_ghc_mod_args = '-g -fno-warn-unused-binds'
let g:syntastic_haskell_hlint_args = '--ignore="Redundant bracket"'


