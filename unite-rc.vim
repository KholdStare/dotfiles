"-----------------------------------------------------------------------------
" Unite General Settings
"-----------------------------------------------------------------------------
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)

" Handle large directories
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate', 'max_candidates', 0)

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_cursor_line_highlight = 'TabLineSel'

"-----------------------------------------------------------------------------
" Key mappings for sources
"-----------------------------------------------------------------------------
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <Space> [unite]

" Ctrl-P, Command-T functionality
nnoremap <silent>[unite]<Space> :Unite -buffer-name=files file_rec/async<CR>
nmap <C-p> [unite]<Space>
nmap <Leader>t [unite]<Space>

nnoremap <silent>[unite]r :Unite -buffer-name=register register<CR>

nnoremap <silent>[unite]b :Unite -quick-match buffer<CR>

nnoremap <silent>[unite]f :Unite -buffer-name=mru_files buffer file_mru<CR>

nnoremap <silent>[unite]y :Unite -buffer-name=yank history/yank<CR>

nnoremap <silent>[unite]/ :Unite -buffer-name=grep grep:.<CR>

nnoremap <silent>[unite]h :Unite -buffer-name=help help<CR>

nnoremap <silent>[unite]o :Unite -buffer-name=outline -vertical outline<CR>

"-----------------------------------------------------------------------------
" Custom mappings in Unite buffer
" (stolen from terryma on github)
"-----------------------------------------------------------------------------
autocmd! FileType unite call s:unite_settings()
function! s:unite_settings()

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)<Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  imap <buffer> <Tab> <Plug>(unite_exit_insert)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  "imap <buffer> '     <Plug>(unite_quick_match_default_action)
  "nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  "if unite.buffer_name =~# '^outline'
    "imap <buffer> <C-\> <Plug>(unite_exit)
  "endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  "if unite.buffer_name =~# '^search_file'
    "imap <buffer> <C-_> <Plug>(unite_exit)
  "endif
endfunction
