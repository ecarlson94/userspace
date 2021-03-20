""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible               " Be iMproved
endif

" Install Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Required:
call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TMUX Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'christoomey/vim-tmux-navigator'
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Arduino
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ecarlson94/vim-arduino-cli'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoSave
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF (Fuzzy Finder Search): requires ripgrep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <C-p><C-a> :RG<cr>
map <c-p> :Files<CR>
nnoremap <leader>o :Files<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-grepper
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-grepper'
let g:grepper={}
let g:grepper.tools=["rg"]

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Replace word under cursor text in all files
nnoremap <leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <left><left><left><left><left><left><left><left><left><left><left>
" Replace currently selected text in all files
vnoremap <leader>R
  \ "hy:Grepper -noprompt -query '<C-r>h'<CR>
  \ :cfdo %s/<C-r>h// \| update
  \ <left><left><left><left><left><left><left><left><left><left><left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'
" [count]<leader>cc |NERDCommenterComment|
"     Comment out the current line or text selected in visual mode.
" [count]<leader>cn |NERDCommenterNested|
"     Same as cc but forces nesting.
" [count]<leader>c<space> |NERDCommenterToggle|
"     Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>cm |NERDCommenterMinimal|
"     Comments the given lines using only one set of multipart delimiters.
" [count]<leader>ci |NERDCommenterInvert|
"     Toggles the comment state of the selected line(s) individually.
" [count]<leader>cs |NERDCommenterSexy|
"     Comments out the selected lines with a pretty block formatted layout.
" [count]<leader>cy |NERDCommenterYank|
"     Same as cc except that the commented line(s) are yanked first.
" <leader>c$ |NERDCommenterToEOL|
"     Comments the current line from the cursor to the end of line.
" <leader>cA |NERDCommenterAppend|
"     Adds comment delimiters to the end of line and goes into insert mode between them.
" <leader>ca |NERDCommenterAltDelims|
"     Switches to the alternative set of delimiters.
" [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
"     Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
" [count]<leader>cu |NERDCommenterUncomment|
"     Uncomments the selected line(s).
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultNesting = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let Tlist_GainFocus_On_ToggleOpen=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
map <C-n> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" netrw File Explorer
let g:netrw_banner=0       " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1         " open splits to the right
let g:netrw_liststyle=3    " tree view
let g:netrw_listhide=netrw_gitignore#Hide()
let g:netrw_listhide.=',(^\|\s\s\)\zs\.\S\+'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exec 'NERDTree' | endif " open NERDTree if nothing is specified
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif " open NERDTree if directory is specified
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif " don't open new buffers in NERDTree window

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'arcticicestudio/nord-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line (airline)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 let g:airline_powerline_fonts = 1
 let g:airline_theme = 'nord'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete Engine / Intellisense
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'prabirshrestha/asyncomplete.vim'
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1
" auto close preview window when completion done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

if has('nvim')
  set completeopt=menuone,noinsert,noselect,preview
  Plug 'ncm2/float-preview.nvim'
  let g:float_preview#docked = 0
else
  set completeopt=menuone,noinsert,noselect,popuphidden
  set completepopup=highlight:Pmenu,border:off
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir='~/.vim/snippets'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol (LSP)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" let g:lsp_diagnostics_enabled=0
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_settings = {
\  'omnisharp-lsp': {
\    'disabled': 1,
\   }
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terraform
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'hashivim/vim-terraform'
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C#
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'OmniSharp/omnisharp-vim'
let g:OmniSharp_server_use_mono=1
let g:OmniSharp_server_stdio=1
let g:OmniSharp_highlight_types=3

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_selector_ui = ''       " Use vim - command line, quickfix etc.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mzlogin/vim-markdown-toc'
let g:vmt_fence_hidden_markdown_style='GFM'
let g:vmt_list_item_char='-'
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
nnoremap <leader>tc :GenTocGFM<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'janko/vim-test'
let g:test#preserve_screen=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dense-analysis/ale'
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:airline#extensions#ale#enabled = 1
" linters
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
" fixers
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}

Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'powerline/fonts', { 'do' : './install.sh' }
Plug 'ryanoasis/vim-devicons'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '<committer>, <committer-time> • <summary> - <commit-short>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'wesQ3/vim-windowswap'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'

" closetag
Plug 'alvan/vim-closetag', { 'for': [ 'html', 'xml', 'javascript' ] }
let g:closetag_filenames = "*.html, *.js, *.xml"

set encoding=utf8

" Required:
call plug#end()
