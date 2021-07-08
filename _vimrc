" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

syntax on

set encoding=utf-8

set guifont=Consolas:h12

set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase

"set noswapfile
"set nobackup
"set undofile

" Tab = 2 spaces for the current file types
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

set incsearch
set backspace=indent,eol,start

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4001 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Highligh 80th columns
"set colorcolumn=80
"highlight ColorColumn guibg=#bababa

" Color scheme
colorscheme themefury

" Disable italic comments
highlight Comment cterm=none gui=none

" Disable annoying beeping
set noerrorbells
set vb t_vb=
set belloff=all
if has("gui_running")
    autocmd GUIEnter * set vb t_vb=
endif

" Panes navigations remap
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Auto-open NERDTree
autocmd VimEnter * NERDTree

" Auto-open maximized (only on Windows)
" This will work for english version of Windows
"autocmd GUIEnter * simalt ~x
" This will work for other language version of Windows
autocmd GUIEnter * simalt ~n

" Save with CTRL+S
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" Launch build.bat script with CTRL+B
:nmap <c-b> :!build<CR>
:imap <c-b> <Esc>:!build<CR>a

" Launch debug.bat script with CTRL+D
:nmap <c-d> :silent !debug<CR>
:imap <c-d> <Esc>:silent !debug<CR>a

" Launch run.bat script with F5
:nmap <F5> :silent !run<CR>
:imap <F5> <Esc>:silent !run<CR>a

" This is for fixing syntax when vim loses track in long files
autocmd BufEnter * :syntax sync fromstart

" To avoid highlighting string, constants, etc... inside comment
:unlet c_comment_strings
