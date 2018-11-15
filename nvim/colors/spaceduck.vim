" spaceduck Theme: 
"
" https://github.com/zenorocha/spaceduck-theme
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Trevor Heins <@heinst>
" @author Éverton Ribeiro <nuxlli@gmail.com>
" @author Derek Sifford <dereksifford@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>
scriptencoding utf8
" 

" Configuration: 

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'spaceduck'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: 

let s:fg        = ['#ECF0C1', 255]

let s:bglighter = ['#424450', 238]
let s:bglight   = ['#343746', 237]
let s:bg        = ['#282A36', 236]
let s:bgdark    = ['#21222C', 235]
let s:bgdarker  = ['#191A21', 234]

let s:subtle    = ['', 238]

let s:selection = ['', 239]
let s:comment   = ['',  61]
let s:cyan      = ['', 117]
let s:green     = ['',  84]
let s:orange    = ['', 215]
let s:pink      = ['', 212]
let s:purple    = ['', 141]
let s:red       = ['', 203]
let s:yellow    = ['', 228]

let s:none      = ['NONE', 'NONE']

let g:spaceduck_palette = {
      \ 'fg': s:fg,
      \ 'bg': s:bg,
      \ 'selection': s:selection,
      \ 'comment': s:comment,
      \ 'cyan': s:cyan,
      \ 'green': s:green,
      \ 'orange': s:orange,
      \ 'pink': s:pink,
      \ 'purple': s:purple,
      \ 'red': s:red,
      \ 'yellow': s:yellow,
      \
      \ 'bglighter': s:bglighter,
      \ 'bglight': s:bglight,
      \ 'bgdark': s:bgdark,
      \ 'bgdarker': s:bgdarker,
      \ 'subtle': s:subtle,
      \}

if has('nvim')
  let g:terminal_color_0  = '#21222C'
  let g:terminal_color_1  = '#FF5555'
  let g:terminal_color_2  = '#50FA7B'
  let g:terminal_color_3  = '#F1FA8C'
  let g:terminal_color_4  = '#BD93F9'
  let g:terminal_color_5  = '#FF79C6'
  let g:terminal_color_6  = '#8BE9FD'
  let g:terminal_color_7  = '#F8F8F2'
  let g:terminal_color_8  = '#6272A4'
  let g:terminal_color_9  = '#FF6E6E'
  let g:terminal_color_10 = '#69FF94'
  let g:terminal_color_11 = '#FFFFA5'
  let g:terminal_color_12 = '#D6ACFF'
  let g:terminal_color_13 = '#FF92DF'
  let g:terminal_color_14 = '#A4FFFF'
  let g:terminal_color_15 = '#FFFFFF'
endif

" 
" User Configuration: 

if !exists('g:spaceduck_bold')
  let g:spaceduck_bold = 1
endif

if !exists('g:spaceduck_italic')
  let g:spaceduck_italic = 1
endif

if !exists('g:spaceduck_underline')
  let g:spaceduck_underline = 1
endif

if !exists('g:spaceduck_undercurl') && g:spaceduck_underline != 0
  let g:spaceduck_undercurl = 1
endif

if !exists('g:spaceduck_inverse')
  let g:spaceduck_inverse = 1
endif

if !exists('g:spaceduck_colorterm')
  let g:spaceduck_colorterm = 1
endif


" Script Helpers: 

let s:attrs = {
      \ 'bold': g:spaceduck_bold == 1 ? 'bold' : 0,
      \ 'italic': g:spaceduck_italic == 1 ? 'italic' : 0,
      \ 'underline': g:spaceduck_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:spaceduck_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:spaceduck_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

function! s:Background()
  if g:spaceduck_colorterm || has('gui_running')
    return s:bg
  else
    return s:none
  endif
endfunction


" spaceduck Highlight Groups: 

call s:h('spaceduckBgLight', s:none, s:bglight)
call s:h('spaceduckBgLighter', s:none, s:bglighter)
call s:h('spaceduckBgDark', s:none, s:bgdark)
call s:h('spaceduckBgDarker', s:none, s:bgdarker)

call s:h('spaceduckFg', s:fg)
call s:h('spaceduckFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('spaceduckFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('spaceduckComment', s:comment)
call s:h('spaceduckCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('spaceduckSelection', s:none, s:selection)

call s:h('spaceduckSubtle', s:subtle)

call s:h('spaceduckCyan', s:cyan)
call s:h('spaceduckCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('spaceduckGreen', s:green)
call s:h('spaceduckGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('spaceduckGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('spaceduckGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('spaceduckOrange', s:orange)
call s:h('spaceduckOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('spaceduckOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('spaceduckOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('spaceduckOrangeInverse', s:bg, s:orange)

call s:h('spaceduckPink', s:pink)
call s:h('spaceduckPinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('spaceduckPurple', s:purple)
call s:h('spaceduckPurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('spaceduckPurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('spaceduckRed', s:red)
call s:h('spaceduckRedInverse', s:fg, s:red)

call s:h('spaceduckYellow', s:yellow)
call s:h('spaceduckYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('spaceduckError', s:red, s:none, [], s:red)

call s:h('spaceduckErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('spaceduckWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('spaceduckInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('spaceduckTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('spaceduckSearch', s:green, s:none, [s:attrs.inverse])
call s:h('spaceduckBoundary', s:comment, s:bgdark)
call s:h('spaceduckLink', s:cyan, s:none, [s:attrs.underline])

call s:h('spaceduckDiffChange', s:none, s:none)
call s:h('spaceduckDiffText', s:bg, s:orange)
call s:h('spaceduckDiffDelete', s:red, s:bgdark)

" 

" 
" User Interface: 

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, s:Background())
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  spaceduckSelection
hi! link CursorColumn spaceduckSelection
hi! link CursorLineNr spaceduckYellow
hi! link DiffAdd      spaceduckGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   spaceduckDiffChange
hi! link DiffDelete   spaceduckDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     spaceduckDiffText
hi! link Directory    spaceduckPurpleBold
hi! link ErrorMsg     spaceduckRedInverse
hi! link FoldColumn   spaceduckSubtle
hi! link Folded       spaceduckBoundary
hi! link IncSearch    spaceduckOrangeInverse
hi! link LineNr       spaceduckComment
hi! link MoreMsg      spaceduckFgBold
hi! link NonText      spaceduckSubtle
hi! link Pmenu        spaceduckBgDark
hi! link PmenuSbar    spaceduckBgDark
hi! link PmenuSel     spaceduckSelection
hi! link PmenuThumb   spaceduckSelection
hi! link Question     spaceduckFgBold
hi! link Search       spaceduckSearch
hi! link SignColumn   spaceduckComment
hi! link TabLine      spaceduckBoundary
hi! link TabLineFill  spaceduckBgDarker
hi! link TabLineSel   Normal
hi! link Title        spaceduckGreenBold
hi! link VertSplit    spaceduckBoundary
hi! link Visual       spaceduckSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   spaceduckOrangeInverse

" 
" Syntax: 

" Required as some plugins will overwrite
call s:h('MatchParen', s:fg, s:pink, [s:attrs.underline])
call s:h('Conceal', s:comment, s:bglight)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey spaceduckRed
else
  hi! link SpecialKey spaceduckSubtle
endif

hi! link Comment spaceduckComment
hi! link Underlined spaceduckFgUnderline
hi! link Todo spaceduckTodo

hi! link Error spaceduckError
hi! link SpellBad spaceduckErrorLine
hi! link SpellLocal spaceduckWarnLine
hi! link SpellCap spaceduckInfoLine
hi! link SpellRare spaceduckInfoLine

hi! link Constant spaceduckPurple
hi! link String spaceduckYellow
hi! link Character spaceduckPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier spaceduckFg
hi! link Function spaceduckGreen

hi! link Statement spaceduckPink
hi! link Conditional spaceduckPink
hi! link Repeat spaceduckPink
hi! link Label spaceduckPink
hi! link Operator spaceduckPink
hi! link Keyword spaceduckPink
hi! link Exception spaceduckPink

hi! link PreProc spaceduckPink
hi! link Include spaceduckPink
hi! link Define spaceduckPink
hi! link Macro spaceduckPink
hi! link PreCondit spaceduckPink
hi! link StorageClass spaceduckPink
hi! link Structure spaceduckPink
hi! link Typedef spaceduckPink

hi! link Type spaceduckCyanItalic

hi! link Delimiter spaceduckFg

hi! link Special spaceduckPink
hi! link SpecialComment spaceduckCyanItalic
hi! link Tag spaceduckCyan
hi! link helpHyperTextJump spaceduckLink
hi! link helpCommand spaceduckPurple
hi! link helpExample spaceduckGreen
hi! link helpBacktick Special



" vim: fdm=marker ts=2 sts=2 sw=2:
