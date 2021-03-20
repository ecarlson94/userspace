""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python tweaks (from Sontek - http://github.com/sontek/dotfiles)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 80 column rst format
autocmd BufRead *.rst set tw=80

" treat html files as django templates
autocmd BufRead *.html set filetype=htmldjango

set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

if has("python")
python << EOF
import os
import sys
import vim
# lets us use 'gf' to go to files imported
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# lets us execute the highlighted portion of the script
def EvaluateCurrentRange():
  eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOF
endif
