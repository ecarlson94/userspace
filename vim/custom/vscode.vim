""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around / editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nostartofline      " Avoid moving cursor to BOL when moving
set scrolloff=5        " Keep 5 lines (top/bottom) for scope
set backspace=2        " makes backspace work normally

set clipboard=unnamed " copy to the system clipboard
" yank to clipboard
if has("unnamedplus") " X11 support
  set clipboard+=unnamedplus
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search / Replace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " Show best match while typing a search
set ignorecase          " Case insensitive search
set smartcase           " Unless uppercase used in search expr
set gdefault            " Default to /g global replace
set hlsearch            " Highlight searches and search results
