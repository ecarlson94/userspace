""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around / editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nostartofline      " Avoid moving cursor to BOL when moving
set scrolloff=5        " Keep 5 lines (top/bottom) for scope
set backspace=2        " makes backspace work normally
set showmatch          " Show matched paren when balanced
set matchtime=2        " for .2 seconds
set linebreak          " Don't wrap text in the middle of a word
set mouse=a            " Always enable mouse
if !has('nvim')
  set ttymouse=xterm2
endif

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
set smartcase           " Unless uppercase used in search expr.
set gdefault            " Default to /g global replace
set hlsearch            " Highlight searches and search results
set path+=**

" ctags
command! MakeTags !ctags -R .

" clear highlighted search using the space bar
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=MesloLGS_NF:h10

" Line Numbers
set number relativenumber " Show line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

"set textwidth=110      " Sets the max width text can be before vim inserts a linebreak
" Highlights text after going over the max text width
set nowrap  " Line wrapping off
set cursorline

colorscheme nord

set t_Co=256 " For 256 color mode support

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Messages, Info, & Status
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set vb t_vb=            " No bells. Period.
set novisualbell        " No blinking
set noerrorbells        " No noise
set cmdheight=2        " Cmd bar 2 rows high
set showcmd            " Show partial command in the last line of the screen
set report=0            " : commands always print changed line count
set shortmess+=a        " Use [+]/[RO]/[w] for modified/readonly/written
set laststatus=2        " Always show the status line
set ruler              " Display position in the file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs / indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set tabstop=2           " Use 2 spaces for <tab>
set shiftwidth=2        " Indent level is 2 spaces wide
set softtabstop=2       " <BS> over an autoindent deletes shiftwidth worth of spaces
set smarttab            " Insert blanks properly at beginning of a line
set autoindent          " Copy indent from current line when starting a new line
set expandtab           " Use spaces not tabs
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set list

" Some file type really do require explicit tabs
autocmd FileType make <buffer> set noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reading/Writing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noautowrite        " Never write a file unless requested to
set noautowriteall      " Seriously.
set modeline            " Let vim options be embedded in files;
set modelines=5        " when in first or last 5 lines
set ffs=unix,dos,mac    " Try and recognize line endings in that order
set nofsync

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000        " Remember a long command history
set wildmenu            " Menu completion in command mode on <Tab>
" First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.pyc.

" Linux / Mac
set wildignore+=*/.git/*

" Windows
set wildignore+=.git\*,Build\*,.sass-cache\*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Per-Filetype Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on             " File type detection on
filetype indent on      " Use filetype-specific indenting when available
filetype plugin on      " Load filetype plugins

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.spark set filetype=html
autocmd BufRead *.vue set filetype=html
autocmd BufRead *.vim* set filetype=vim
autocmd BufRead *.yaml set filetype=yaml
autocmd BufRead *.yml set filetype=yaml
autocmd BufRead *.tf set filetype=terraform
autocmd BufRead *.tfvars set filetype=terraform
autocmd BufRead *.css set filetype=css
autocmd BufRead *.less set filetype=css
autocmd BufRead *.sass set filetype=css
autocmd BufRead *.sh set filetype=bash
autocmd BufRead *.zsh set filetype=bash
autocmd BufRead *.rst set tw=80
autocmd FileType spark set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_disable_startup_warning = 1
set noswapfile

set nocompatible        " vim > vi mode.
syntax on

set splitbelow

" Set desired preview window height for viewing documentation.
set previewheight=5

" Terminal
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Ctrl P Ignore
"set wildmode=list:longest,full
"set wildignore+=*.o,*.obj,.git,*.pyc.
"set wildignore+=*/.git/*

" Windows General
set wildignore+=.git\*,.sass-cache\\*,*.orig,*.cache,*.nupkg,*.exe
