highlight clear
if exists("syntax_on")
    syntax reset
endif

set background=dark
let g:colors_name = "themefury"

hi Normal       guifg=#c7c7c7 guibg=#303030 ctermfg=7 ctermbg=0
hi NonText		guifg=#c7c7c7 ctermfg=7
hi comment      guifg=#49a628 ctermfg=2
hi constant		guifg=#c7c7c7 ctermfg=7
hi identifier	guifg=#c7c7c7 ctermfg=7
hi statement	guifg=#c7c7c7 ctermfg=7
hi preproc		guifg=#c7c7c7 ctermfg=7
hi type			guifg=#c7c7c7 ctermfg=7
hi special		guifg=#c7c7c7 ctermfg=7
hi Underlined	guifg=#c7c7c7 ctermfg=7
hi label		guifg=#c7c7c7 ctermfg=7
hi operator		guifg=#c7c7c7 ctermfg=7

hi ErrorMsg		guifg=#c7c7c7 ctermfg=7
hi WarningMsg	guifg=#c7c7c7 ctermfg=7
hi ModeMsg		guifg=#c7c7c7 ctermfg=7
hi MoreMsg		guifg=#c7c7c7 ctermfg=7
hi Error		guifg=#c7c7c7 ctermfg=7

hi Cursor		guifg=#e6e6e6 guibg=#04c704 ctermfg=7 ctermbg=3
hi Search		guifg=#e6e6e6 guibg=#d97c02 ctermfg=7 ctermbg=12
hi IncSearch	guifg=#e6e6e6 guibg=#d97c02 ctermfg=7 ctermbg=12
hi LineNr		guifg=#c7c7c7 ctermfg=7


" Highligh TODO, FIXME, CHANGED, BUG, OPTIMIZE
hi Todo			guifg=#c7c7c7 guibg=#820000 ctermfg=7 ctermbg=4
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(TODO|FIXME|CHANGED|BUG|OPTIMIZE)/
        \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

" Highligh DEBUG, NOTE, INFO, IDEA
augroup vimrc_todo
    au!
    au Syntax * syn match Debug /\v<(DEBUG|NOTE|INFO|IDEA)/
        \ containedin=.*Comment,vimCommentTitle
augroup END
hi Debug		guifg=#c7c7c7 guibg=#820000 ctermfg=7 ctermbg=2

" Highligh 80th columns
set colorcolumn=80
hi ColorColumn  guibg=#bababa guibg=#7a7a7a ctermfg=8 ctermbg=8

"hi title		    guifg=white	gui=bold	cterm=bold
"
"hi StatusLineNC	gui=NONE	guifg=black guibg=blue	ctermfg=black  ctermbg=blue
"hi StatusLine	    gui=bold	guifg=cyan	guibg=blue	ctermfg=cyan   ctermbg=blue
"hi VertSplit	    gui=none	guifg=blue	guibg=blue	ctermfg=blue	ctermbg=blue
"
"hi Visual		    term=reverse		ctermfg=black	ctermbg=darkCyan	guifg=black		guibg=darkCyan
"
"hi DiffChange	    guibg=darkGreen		guifg=black	ctermbg=darkGreen	ctermfg=black
"hi DiffText		guibg=olivedrab		guifg=black		ctermbg=lightGreen	ctermfg=black
"hi DiffAdd		    guibg=slateblue		guifg=black		ctermbg=blue		ctermfg=black
"hi DiffDelete      guibg=coral			guifg=black	ctermbg=cyan		ctermfg=black
"
"hi Folded		    guibg=orange		guifg=black		ctermbg=yellow		ctermfg=black
"hi FoldColumn	    guibg=gray30		guifg=black	ctermbg=gray		ctermfg=black
"hi cIf0			guifg=gray			ctermfg=gray

" Supertab menu color
hi Pmenu    cterm=underline gui=underline guifg=#bcbcbc guibg=#262626 ctermfg=7 ctermbg=8
hi PmenuSel cterm=underline gui=underline guifg=#bcbcbc guibg=#af5f5f ctermfg=7 ctermbg=12
