"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T

    " Remove all gui scrollbars! $%^& em!
    set guioptions+=LlRrb
    set guioptions-=LlRrb

    set gfn=Inconsolata\ 12
    if !exists("g:vimrcloaded")
        winpos 0 0
        winsize 130 100
        let g:vimrcloaded = 1
    endif
endif
