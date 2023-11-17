" # Happy Hacking
"
" Happy Hacking is a color scheme heavily inspired by Autumn
" (https://github.com/yorickpeterse/autumn.vim). The main differences between
" the two themes are various small tweaks to the colors, an easier to maintain
" codebase and a much wider range of supported languages. On top of that
" various inconsistencies that were present in Autumn have been resolved.
"
" As with any Vim color scheme the overall look and feel heavily depends on how
" accurate a syntax highlighter for a language is. For example, the Ruby syntax
" highlighter is fairly accurate and allows you to customize a lot whereas for
" example C has a more generic highlighting setup. At worst this will result in
" a bit more heavy use of red as it's one of the base colors of this theme.
"
" Author:  Yorick Peterse
" License: MIT
" Website: https://github.com/yorickpeterse/happy_hacking.vim
"

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
end

let g:colors_name = "contra"

" ============================================================================
" colour Function
" Function for creating a highlight group with a GUI/Terminal foreground and
" background. No font styling is applied.
function! s:colour(group, fg, bg, style)
  exe "hi " . a:group . " guifg=" . a:fg[0] . " guibg=" . a:bg[0]
    \ . " ctermfg=" . a:fg[1]
    \ . " ctermbg=" . a:bg[1]
    \ . " gui="     . a:style
    \ . " cterm="   . a:style
endfunction

" ============================================================================
" Palette. First item is true colour, second is term colour

let s:none     = ["NONE", "NONE"]
let s:white    = ["#DCD7BA", "230"]

let s:dark1    = ["#1D1C19", "16" ]
let s:dark2    = ["#181616", "235"]
let s:dark3    = ["#282727", "59" ]
let s:dark4    = ["#625e5a", "102"]

let s:yellow   = ["#b2b250", "221"]
let s:blue     = ["#6287b2", "103"]
let s:green    = ["#5fb257", "107"]
let s:purple   = ["#9d59b2", "179"]
let s:orange   = ["#b28547", "211"]
let s:pink     = ["#b26b81", "186"]
let s:red      = ["#b24245", "203"]

let s:bg = s:dark2
let s:fg = ["#a0a7b2", "10"]

" ============================================================================
" General Syntax Elements
" Definitions for generic syntax elements such as strings and numbers.

call s:colour("Pmenu",            s:fg,    s:dark1,  "NONE")
call s:colour("PmenuSel",         s:fg,    s:dark1,  "NONE")
call s:colour("CursorLine",       s:none,     s:dark3,  "NONE")
call s:colour("Normal",           s:fg,    s:bg,   "NONE")
call s:colour("Search",           s:purple,   s:none,   "bold")
hi! link IncSearch    Search

call s:colour("Title",            s:yellow,   s:none,   "italic")
call s:colour("Visual", s:none, s:dark3, "NONE")

call s:colour("LineNr",           s:dark3,    s:none,   "NONE")
call s:colour("CursorLineNR",     s:dark4,    s:none,   "NONE")
call s:colour("StatusLine",       s:white,    s:dark3,  "NONE")
call s:colour("StatusLineNC",     s:dark3,    s:dark3,  "NONE")
call s:colour("StatusLineMarker", s:yellow,   s:dark4,  "bold")
call s:colour("VertSplit",        s:dark3,    s:none,   "NONE")
call s:colour("ColorColumn",      s:none,     s:dark4,  "NONE")

call s:colour("Folded",           s:dark4,    s:none,   "NONE")
call s:colour("FoldColumn",       s:dark3,    s:dark1,  "NONE")  
call s:colour("ErrorMsg",         s:red,      s:none,   "bold")
call s:colour("WarningMsg",       s:orange,   s:none,   "bold")
call s:colour("Question",         s:white,    s:none,   "NONE")

call s:colour("SpecialKey",       s:dark3,    s:none,  "NONE")  
call s:colour("Directory",        s:yellow,     s:none,   "NONE")

call s:colour("Todo",             s:blue,    s:dark3,   "NONE")
call s:colour("Comment",          s:dark4,    s:none,   "italic")
call s:colour("Regexp",           s:orange,   s:none,   "NONE")
call s:colour("Function",         s:blue,     s:none,   "NONE")
call s:colour("Notice",           s:yellow,   s:none,   "NONE")

call s:colour("MatchParen",       s:purple,     s:none,   "bold")
call s:colour("Conceal",          s:blue,     s:none,   "NONE")

call s:colour("Special",    s:dark4, s:none, "NONE")
call s:colour("Identifier", s:fg, s:none, "NONE")

call s:colour("String",           s:green,    s:none,   "NONE")
hi! link Character String
call s:colour("Constant", s:pink, s:none, "NONE")
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

call s:colour("Operator", s:dark4, s:none, "NONE")
call s:colour("Type", s:yellow, s:none, "NONE")
hi! link StorageClass Type
call s:colour("Keyword",          s:purple,      s:none,   "italic")
call s:colour("Statement", s:orange, s:none, "bold")
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement

call s:colour("PreProc", s:dark4, s:none, "NONE")
call s:colour("Macro", s:red, s:none, "italic")
hi! link PreCondit    Macro

call s:colour("SignColumn", s:none, s:none, "NONE")

hi! link PmenuThumb   PmenuSel
hi! link Error        ErrorMsg
hi! link NonText      LineNr
hi! link MoreMsg      Normal
hi! link Label        Special

if has('nvim')
   hi! link @text.reference.vimdoc Type
endif 

hi! NonText guifg=bg

" ============================================================================
" Specific Languages
"
" Language specific settings that would otherwise be too generic. These
" definitions are sorted in alphabetical order.

" CtrlP
hi! link CtrlPBufferHid  Todo
hi! link CtrlPBufferPath Todo

call s:colour("CtrlPMode1", s:white, s:dark1, "bold")

" Diffs
hi! link diffFile    WarningMsg
hi! link diffLine    Number
hi! link diffAdded   String
hi! link diffRemoved Keyword

hi! link DiffChange Notice
hi! link DiffAdd    diffAdded
hi! link DiffDelete diffRemoved
hi! link DiffText   diffLine

" Git commits
hi! link gitCommitSummary  String
hi! link gitCommitOverflow ErrorMsg

" JSON
hi! link jsonKeyword String

" Make
hi! link makeTarget Function

" Markdown
hi! link markdownCodeBlock         Todo
hi! link markdownCode              markdownCodeBlock
hi! link markdownListMarker        Keyword
hi! link markdownOrderedListMarker Keyword

" Shell
hi! link shFunctionKey Keyword
hi! link shTestOpr     Operator
hi! link bashStatement Normal
hi! link typescriptExceptions   Keyword

" Vimscript
hi! link vimGroup        Constant
hi! link vimHiGroup      Constant
hi! link VimIsCommand    Constant
hi! link VimCommentTitle Todo

" YAML
hi! link yamlPlainScalar String
hi! link NeomakeWarning WarningMsg

" Wild menu completion
hi! link WildMenu PmenuSel

" Vim tabline
hi! link TabLine     StatusLine
hi! link TabLineFill StatusLine

call s:colour("TabLineSel", s:white, s:dark2, "bold")

" Neovim terminal colors
let g:terminal_color_0 = s:dark1
let g:terminal_color_1 = s:red
let g:terminal_color_2 = s:green
let g:terminal_color_3 = s:yellow
let g:terminal_color_4 = s:blue
let g:terminal_color_5 = s:pink
let g:terminal_color_6 = s:purple
let g:terminal_color_7 = s:white
let g:terminal_color_8 = s:dark1
let g:terminal_color_9 = s:red
let g:terminal_color_10 = s:green
let g:terminal_color_11 = s:yellow
let g:terminal_color_12 = s:blue
let g:terminal_color_13 = s:pink
let g:terminal_color_14 = s:purple
let g:terminal_color_15 = s:white

" Spell checking
call s:colour("SpellBad", s:red, s:none, "underline")

" Vimwiki
hi! link VimWikiCode markdownCode
