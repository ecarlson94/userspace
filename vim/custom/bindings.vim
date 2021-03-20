""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windowing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" and lets make these all work in insert mode too ( <C-O> makes next cmd happen as if in command mode )
imap <C-W> <C-O><C-W>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close window
map <expr> <leader>qq (exists('g:vscode')) ? ":call VSCodeNotify('workbench.action.closeActiveEditor')<CR>" : ":q<CR>"
" Close all windows
map <expr> <leader>qa (exists('g:vscode')) ? ":call VSCodeNotify('workbench.action.closeAllEditors')<CR>" : ":qa<CR>"
" Save buffer
map <expr> <leader>ss (exists('g:vscode')) ? ":call VSCodeNotify('workbench.action.files.save')<CR>" : ":w<CR>"
" Save all buffers
map <expr> <leader>sa (exists('g:vscode')) ? ":call VSCodeNotify('workbench.action.files.saveAll')<CR>" : ":wa<CR>"
" Trim all trailing whitespace
nnoremap <leader>ta :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Trim trailing whitespace following ';'
nnoremap <leader>ts :let _s=@/<Bar>:%s/;\s\+$/;/e<Bar>:let @/=_s<Bar><CR>
" Replace currently selected text in current file
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Don't overwrite register when pasting in visual mode
vnoremap p pgvy

if !exists('g:vscode')
  " ,v brings up .vimrc (thanks, sontek)
  map <leader>v :sp ~/.vimrc<CR><C-W>

  " ,V reloads it (as long as you remember to save it first)
  map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

  " Window resizing made easy
  map <A-k> <C-w>+
  map <A-j> <C-w>-
  map <A-l> <C-w>>
  map <A-h> <C-w><
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim") && !exists('g:vscode')
  " Send escape to terminal
  tnoremap <expr> <C-e> (&filetype == "fzf") ? "<Nul>" : "<Esc>"
  " Exit terminal mode (enter normal mode)
  tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-n>"
  "Exit terminal
  tnoremap <expr> <C-q> (&filetype == "fzf") ? "<Nul>" : "<C-\><C-n>:q<CR>"

  " Windowing
  tnoremap <expr> <C-h> (&filetype == "fzf") ? "<C-h>" : "<c-\><c-n><c-w>h"
  tnoremap <expr> <C-j> (&filetype == "fzf") ? "<C-j>" : "<c-\><c-n><c-w>j"
  tnoremap <expr> <C-k> (&filetype == "fzf") ? "<C-k>" : "<c-\><c-n><c-w>k"
  tnoremap <expr> <C-l> (&filetype == "fzf") ? "<C-l>" : "<c-\><c-n><c-w>l"
endif

function NewTerminal()
  " Open terminal in new bottom window 1/4th the size of the current window
  return "botright ".(winheight(0)/3)."new | terminal"
endfunction
nnoremap <expr> <leader>t (exists('g:vscode')) ? ":call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>" : ":exec NewTerminal()<CR>i"

if !exists('g:vscode')
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Vim Tabs
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  map th :tabfirst<CR>
  map tk :tabnext<CR>
  map tj :tabprev<CR>
  map tl :tablast<CR>
  map tt :tabedit<Space>
  map tn :tabnext<Space>
  map tm :tabm<Space>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Misc
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if has('nvim')
   nmap <BS> <C-W>h
  else
   map <C-H> <C-W><C-H>
  endif

  " set working directory
  nnoremap <leader>. :lcd %:p:h<CR>

  " Remove trailing whitespace
  map <leader>e :%s/\s\+$//<CR>:let @/=''<CR>
endif
