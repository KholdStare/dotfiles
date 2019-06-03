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
" Plugin preferences
"-----------------------------------------------------------------------------
" Colorscheme
colorscheme xoria256

" ultisnips snippet location
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

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

" extra custom vim settings for current dir
if filereadable(".custom.vim")
    so .custom.vim
endif


