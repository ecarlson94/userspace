""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs / indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4           " Use 4 spaces for <tab>
set shiftwidth=4        " Indent level is 4 spaces wide
set softtabstop=4       " <BS> over an autoindent deletes shiftwidth worth of spaces

if !exists('g:vscode')
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Omnisharp
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

  " Finds members in the current buffer
  nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

  nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
  nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
  nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
  inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

  " Test commands
  nnoremap <buffer> <Leader>rt :OmniSharpRunTest<CR>
  nnoremap <buffer> <Leader>rft : OmniSharpRunTestsInFile<CR>

  " Navigate up and down by method/property/field
  nnoremap <buffer> <S-k> :OmniSharpNavigateUp<CR>
  nnoremap <buffer> <S-j> :OmniSharpNavigateDown<CR>

  " Find all code errors/warnings for the current solution and populate the quickfix window
  nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

  " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
  nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
  " Run code actions with text selected in visual mode to extract method
  xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

  " Rename with dialog
  nnoremap <Leader>rn :OmniSharpRename<CR>
  nnoremap <F2> :OmniSharpRename<CR>
  " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
  command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

  nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

  " Start the omnisharp server for the current solution
  nnoremap <Leader>so :OmniSharpStartServer<CR>
  nnoremap <Leader>sp :OmniSharpStopServer<CR>

  let g:OmniSharp_popup_position = 'peek'
  if has('nvim')
    let g:OmniSharp_popup_options = {
    \ 'winhl': 'Normal:NormalFloat'
    \}
  else
    let g:OmniSharp_popup_options = {
    \ 'highlight': 'Normal',
    \ 'padding': [0, 0, 0, 0],
    \ 'border': [1]
    \}
  endif
  let g:OmniSharp_popup_mappings = {
  \ 'sigNext': '<C-n>',
  \ 'sigPrev': '<C-p>',
  \ 'pageDown': ['<C-f>', '<PageDown>'],
  \ 'pageUp': ['<C-b>', '<PageUp>']
  \}

  let g:OmniSharp_highlight_groups = {
  \ 'ExcludedCode': 'NonText'
  \}

  " Enable snippet completion
  let g:OmniSharp_want_snippet=1

endif

