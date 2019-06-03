" vim: foldmethod=marker foldlevel=0
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
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,h,hpp,cc,hh,go,hs,rb,conf,txt,yaml,cmake}"
  \ -g "!{.git,node_modules,vendor,build-*}/*" '

command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

if has('nvim')
  function! s:fzf_cd_helper(path)
    if isdirectory(a:path)
      call fzf#run({
          \ 'dir': a:path,
          \ 'source': 'ls -ap --color=always | grep --color=always -v ''^.$''',
          \ 'sink*': {lines -> s:fzf_cd_helper(lines[0])},
          \ 'down': '30%',
          \ 'options':
          \ ['--ansi', '--reverse', '--preview', '
              \ __cd_nxt="$(echo {})";
              \ __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
              \ echo $__cd_path; echo;
              \ if [[ -d ${__cd_path} ]]; then ls -p --color=always "${__cd_path}"; else head "${__cd_path}"; fi\'
          \ ]
          \ })
    else
      execute "edit " . a:path
    endif
  endfunction

  command! -bang FzfCd call s:fzf_cd_helper('.')

  nnoremap <silent><Leader>fe :FzfCd<CR>
endif

nnoremap <silent><Leader>ff :ProjectFiles<CR>
nnoremap <silent><Leader>bb :Buffers<CR>
" }}}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" {{{
augroup fugitive_group
  " Use .. to navigate up a tree when browsing fugitive history
  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

  " Automatically close hidden fugitive files. less buffer clutter
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
" }}}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
" {{{
let g:airline_theme = 'bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
" }}}
Plug 'yurifury/hexHighlight', { 'for': 'css' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'godlygeek/tabular'

" Colorscheme
Plug 'vim-scripts/xoria256.vim'

" Provides :BD to close a buffer without closing the window
Plug 'vim-scripts/bufkill.vim'

Plug 'vim-scripts/NERD_tree-Project'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/opencl.vim'

" c++
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" {{{
function! s:ConfigureCoc()
  call coc#config('coc.preferences', {
      \ "languageserver": {
      \   "ccls": {
      \     "command": "ccls",
      \     "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
      \     "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
      \     "initializationOptions": {
      \       "cache": {
      \          "directory": ".ccls-cache"
      \       }
      \     }
      \   }
      \ }
      \})
endfunction
autocmd! User coc.nvim call s:ConfigureCoc

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent><Leader>gd <Plug>(coc-definition)
nmap <silent><Leader>gi <Plug>(coc-implemetation)
nmap <silent><Leader>gr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

" haskell
if has('nvim')
  Plug 'neovimhaskell/haskell-vim'
  Plug 'parsonsmatt/intero-neovim'
endif

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
