" Name:         Seoul 8 Light
" Author:       Aramis Razzaghipour <aramisnoah@gmail.com>
" Maintainer:   Aramis Razzaghipour <aramisnoah@gmail.com>
" License:      Vim License (see `:help license`)
" Last Updated: Wed 14 Nov 19:50:57 2018

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
      \ && (!exists('&t_Co') || &t_Co < 256)
  echoerr '[Seoul 8 Light] There are not enough colors.'
  finish
endif

set background=light

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'seoul8_light'

hi Normal ctermfg=241 ctermbg=254 guifg=#616161 guibg=#e1e1e1 guisp=NONE cterm=NONE gui=NONE
hi LineNr ctermfg=101 ctermbg=252 guifg=#999872 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi Visual ctermfg=NONE ctermbg=152 guifg=NONE guibg=#bcdede guisp=NONE cterm=NONE gui=NONE
hi VisualNOS ctermfg=NONE ctermbg=152 guifg=NONE guibg=#bcdede guisp=NONE cterm=NONE gui=NONE
hi Comment ctermfg=65 ctermbg=NONE guifg=#719872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Number ctermfg=138 ctermbg=NONE guifg=#9a7372 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Float ctermfg=138 ctermbg=NONE guifg=#9a7372 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Boolean ctermfg=175 ctermbg=NONE guifg=#e17899 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi String ctermfg=30 ctermbg=NONE guifg=#009799 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Constant ctermfg=23 ctermbg=NONE guifg=#007173 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Character ctermfg=175 ctermbg=NONE guifg=#e17899 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Delimiter ctermfg=94 ctermbg=NONE guifg=#9a7200 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi StringDelimiter ctermfg=94 ctermbg=NONE guifg=#9a7200 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Statement ctermfg=66 ctermbg=NONE guifg=#719899 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Conditional ctermfg=38 ctermbg=NONE guifg=#0099bd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Repeat ctermfg=67 ctermbg=NONE guifg=#7299bc guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Todo ctermfg=125 ctermbg=255 guifg=#bf2172 guibg=#f1f1f1 guisp=NONE cterm=NONE gui=NONE
hi Function ctermfg=58 ctermbg=NONE guifg=#727100 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Define ctermfg=174 ctermbg=NONE guifg=#be7572 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Macro ctermfg=174 ctermbg=NONE guifg=#be7572 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Include ctermfg=174 ctermbg=NONE guifg=#be7572 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PreCondit ctermfg=174 ctermbg=NONE guifg=#be7572 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PreProc ctermfg=58 ctermbg=NONE guifg=#727100 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Identifier ctermfg=139 ctermbg=NONE guifg=#9a7599 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Type ctermfg=94 ctermbg=NONE guifg=#9a7200 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Operator ctermfg=174 ctermbg=NONE guifg=#be7572 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Keyword ctermfg=175 ctermbg=NONE guifg=#e17899 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Exception ctermfg=161 ctermbg=NONE guifg=#e12672 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Structure ctermfg=23 ctermbg=NONE guifg=#007173 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Error ctermfg=255 ctermbg=174 guifg=#e9e9e9 guibg=#e09b99 guisp=NONE cterm=NONE gui=NONE
hi ErrorMsg ctermfg=255 ctermbg=175 guifg=#e9e9e9 guibg=#e17899 guisp=NONE cterm=NONE gui=NONE
hi Underlined ctermfg=175 ctermbg=NONE guifg=#e17899 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi CursorLine ctermfg=NONE ctermbg=253 guifg=NONE guibg=#d9d9d9 guisp=NONE cterm=NONE gui=NONE
hi CursorLineNr ctermfg=174 ctermbg=253 guifg=#be7572 guibg=#d9d9d9 guisp=NONE cterm=NONE gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=253 guifg=NONE guibg=#d9d9d9 guisp=NONE cterm=NONE gui=NONE
hi Directory ctermfg=138 ctermbg=NONE guifg=#9a7372 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi DiffAdd ctermfg=NONE ctermbg=151 guifg=NONE guibg=#bcddbd guisp=NONE cterm=NONE gui=NONE
hi DiffDelete ctermfg=NONE ctermbg=181 guifg=NONE guibg=#e0bebc guisp=NONE cterm=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=189 guifg=NONE guibg=#dfdfff guisp=NONE cterm=NONE gui=NONE
hi DiffText ctermfg=NONE ctermbg=224 guifg=NONE guibg=#ffdfdf guisp=NONE cterm=NONE gui=NONE
hi VertSplit ctermfg=251 ctermbg=251 guifg=#c8c8c8 guibg=#c8c8c8 guisp=NONE cterm=NONE gui=NONE
hi Folded ctermfg=101 ctermbg=252 guifg=#999872 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi FoldColumn ctermfg=94 ctermbg=252 guifg=#9a7200 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi MatchParen ctermfg=NONE ctermbg=251 guifg=NONE guibg=#c8c8c8 guisp=NONE cterm=NONE gui=NONE
hi ModeMsg ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi NonText ctermfg=250 ctermbg=NONE guifg=#bdbdbd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi MoreMsg ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Pmenu ctermfg=240 ctermbg=224 guifg=#565656 guibg=#ffdfdf guisp=NONE cterm=NONE gui=NONE
hi PmenuSel ctermfg=253 ctermbg=126 guifg=#d9d9d9 guibg=#9b1d72 guisp=NONE cterm=NONE gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=65 guifg=NONE guibg=#719872 guisp=NONE cterm=NONE gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=23 guifg=NONE guibg=#007173 guisp=NONE cterm=NONE gui=NONE
hi Search ctermfg=255 ctermbg=74 guifg=#f1f1f1 guibg=#70bddf guisp=NONE cterm=NONE gui=NONE
hi IncSearch ctermfg=220 ctermbg=240 guifg=#ffdd00 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi Special ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SpecialKey ctermfg=250 ctermbg=NONE guifg=#bdbdbd guibg=NONE guisp=NONE cterm=NONE gui=NONE
if !has('gui_running')
  hi SpellBad ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi SpellCap ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi SpellLocal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi SpellRare ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
else
  hi SpellBad ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#bf2172 cterm=NONE,undercurl gui=NONE,undercurl
  hi SpellCap ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#0074be cterm=NONE,undercurl gui=NONE,undercurl
  hi SpellLocal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#0099bd cterm=NONE,undercurl gui=NONE,undercurl
  hi SpellRare ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#9a7599 cterm=NONE,undercurl gui=NONE,undercurl
endif
hi StatusLine ctermfg=187 ctermbg=138 guifg=#dfdebd guibg=#9a7372 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi StatusLineNC ctermfg=240 ctermbg=252 guifg=#565656 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi TabLineFill ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi TabLineSel ctermfg=187 ctermbg=66 guifg=#dfdebd guibg=#719899 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi TabLine ctermfg=243 ctermbg=250 guifg=#757575 guibg=#bdbdbd guisp=NONE cterm=NONE gui=NONE
hi WildMenu ctermfg=138 ctermbg=220 guifg=#9a7372 guibg=#ffdd00 guisp=NONE cterm=NONE gui=NONE
hi Title ctermfg=124 ctermbg=NONE guifg=#9b1300 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Question ctermfg=124 ctermbg=NONE guifg=#9b1300 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi WarningMsg ctermfg=124 ctermbg=NONE guifg=#9b1300 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SignColumn ctermfg=173 ctermbg=254 guifg=#e19972 guibg=#e1e1e1 guisp=NONE cterm=NONE gui=NONE
hi Conceal ctermfg=239 ctermbg=255 guifg=#4b4b4b guibg=#f1f1f1 guisp=NONE cterm=NONE gui=NONE
hi Ignore ctermfg=251 ctermbg=254 guifg=#c8c8c8 guibg=#e1e1e1 guisp=NONE cterm=NONE gui=NONE
let g:terminal_color_0  = '#606060'
let g:terminal_color_1  = '#be7472'
let g:terminal_color_2  = '#709872'
let g:terminal_color_3  = '#bd9873'
let g:terminal_color_4  = '#7199bc'
let g:terminal_color_5  = '#997498'
let g:terminal_color_6  = '#719899'
let g:terminal_color_7  = '#e9e9e9'
let g:terminal_color_8  = '#4a4a4a'
let g:terminal_color_9  = '#9a1200'
let g:terminal_color_10 = '#006f00'
let g:terminal_color_11 = '#e09871'
let g:terminal_color_12 = '#0098bd'
let g:terminal_color_13 = '#9a1c72'
let g:terminal_color_14 = '#009799'
let g:terminal_color_15 = '#f1f1f1'
let ruby_operators = 1
hi rubyClass ctermfg=38 ctermbg=NONE guifg=#0099bd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyRegexp ctermfg=101 ctermbg=NONE guifg=#999872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=175 ctermbg=NONE guifg=#e17899 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyArrayDelimiter ctermfg=38 ctermbg=NONE guifg=#00bddf guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyBlockParameterList ctermfg=94 ctermbg=NONE guifg=#9a7200 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyCurlyBlockDelimiter ctermfg=101 ctermbg=NONE guifg=#999872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyPredefinedIdentifier ctermfg=88 ctermbg=NONE guifg=#730b00 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi! link HighlightedyankRegion Ignore
hi GitGutterAdd ctermfg=65 ctermbg=252 guifg=#719872 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi GitGutterChange ctermfg=75 ctermbg=252 guifg=#719cdf guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi GitGutterDelete ctermfg=161 ctermbg=252 guifg=#e12672 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi GitGutterChangeDelete ctermfg=175 ctermbg=252 guifg=#e17899 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi SignifySignAdd ctermfg=65 ctermbg=252 guifg=#719872 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi SignifySignChange ctermfg=75 ctermbg=252 guifg=#719cdf guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=161 ctermbg=252 guifg=#e12672 guibg=#d1d0d1 guisp=NONE cterm=NONE gui=NONE
hi ALEErrorSign ctermfg=161 ctermbg=241 guifg=#e12672 guibg=#616161 guisp=NONE cterm=NONE gui=NONE
hi ALEWarningSign ctermfg=174 ctermbg=241 guifg=#be7572 guibg=#616161 guisp=NONE cterm=NONE gui=NONE
hi! link vimFunction Function
hi! link vimUserFunc Function
hi! link vimIsCommand Statement
hi! link vimAutoCmdSfxList Type
finish

" Background:      light
" Color: darkCyan          #009799 ~
" Color: greyCyan          #719899 ~
" Color: hotCyan           #00bddf ~
" Color: lightCyan         #bcdede ~
" Color: reallyDarkCyan    #007173 ~
" Color: darkBlue          #0099bd ~
" Color: darkSkyBlue       #7299bc ~
" Color: hotGreyBlue       #719cdf ~
" Color: hotSkyBlue        #0074be ~
" Color: lightBlue         #70bddf ~
" Color: lightIndigo       #dfdfff ~
" Color: darkPurple        #9a7599 ~
" Color: hotPurple         #9b1d72 ~
" Color: hotPink           #bf2172 ~
" Color: lightPink         #e17899 ~
" Color: reallyHotPink     #e12672 ~
" Color: darkSalmon        #be7572 ~
" Color: lightSalmon       #e09b99 ~
" Color: darkRed           #9a7372 ~
" Color: lightRed          #e0bebc ~
" Color: reallyDarkRed     #9b1300 ~
" Color: reallyLightRed    #ffdfdf ~
" Color: superDarkRed      #730b00 ~
" Color: lightOrange       #e19972 ~
" Color: darkGold          #727100 ~
" Color: lightYellow       #ffdd00 ~
" Color: reallyDarkYellow  #999872 ~
" Color: reallyLightYellow #dfdebd ~
" Color: darkGreen         #719872 ~
" Color: lightGreen        #bcddbd ~
" Color: brown             #9a7200 ~
" Color: bitLessLightGrey  #d9d9d9 ~
" Color: darkGrey          #616161 ~
" Color: darkMedGrey       #bdbdbd ~
" Color: lessDarkGrey      #757575 ~
" Color: lessLightGrey     #d1d0d1 ~
" Color: lightGrey         #e1e1e1 ~
" Color: medGrey           #c8c8c8 ~
" Color: reallyDarkGrey    #565656 ~
" Color: reallyLightGrey   #e9e9e9 ~
" Color: superDarkGrey     #4b4b4b ~
" Color: white             #f1f1f1 ~
" Normal                   darkGrey            lightGrey
" LineNr                   reallyDarkYellow    lessLightGrey
" Visual                   none                lightCyan
" VisualNOS                none                lightCyan
" Comment                  darkGreen           none
" Number                   darkRed             none
" Float                    darkRed             none
" Boolean                  lightPink           none
" String                   darkCyan            none
" Constant                 reallyDarkCyan      none
" Character                lightPink           none
" Delimiter                brown               none
" StringDelimiter          brown               none
" Statement                greyCyan            none     bold
" Conditional              darkBlue            none
" Repeat                   darkSkyBlue         none
" Todo                     hotPink             white
" Function                 darkGold            none
" Define                   darkSalmon          none
" Macro                    darkSalmon          none
" Include                  darkSalmon          none
" PreCondit                darkSalmon          none
" PreProc                  darkGold            none
" Identifier               darkPurple          none
" Type                     brown               none
" Operator                 darkSalmon          none
" Keyword                  lightPink           none
" Exception                reallyHotPink       none
" Structure                reallyDarkCyan      none
" Error                    reallyLightGrey     lightSalmon
" ErrorMsg                 reallyLightGrey     lightPink
" Underlined               lightPink           none
" ColorColumn              none                lessLightGrey
" CursorLine               none                bitLessLightGrey
" CursorLineNr             darkSalmon          bitLessLightGrey
" CursorColumn             none                bitLessLightGrey
" Directory                darkRed             none
" DiffAdd                  none                lightGreen
" DiffDelete               none                lightRed
" DiffChange               none                lightIndigo
" DiffText                 none                reallyLightRed
" VertSplit                medGrey             medGrey
" Folded                   reallyDarkYellow    lessLightGrey
" FoldColumn               brown               lessLightGrey
" MatchParen               none                medGrey
" ModeMsg                  lightOrange         none     bold
" NonText                  darkMedGrey         none
" MoreMsg                  lightOrange         none
" Pmenu                    reallyDarkGrey      reallyLightRed
" PmenuSel                 bitLessLightGrey    hotPurple
" PmenuSbar                none                darkGreen
" PmenuThumb               none                reallyDarkCyan
" Search                   white               lightBlue
" IncSearch                lightYellow         reallyDarkGrey
" Special                  lightOrange         none
" SpecialKey               darkMedGrey         none
" SpellBad   none none underline
" SpellCap   none none underline
" SpellLocal none none underline
" SpellRare  none none underline
" SpellBad   none none undercurl guisp=hotPink
" SpellCap   none none undercurl guisp=hotSkyBlue
" SpellLocal none none undercurl guisp=darkBlue
" SpellRare  none none undercurl guisp=darkPurple
" StatusLine               reallyLightYellow   darkRed  bold
" StatusLineNC             reallyDarkGrey      lessLightGrey
" StatusLineTerm           ->                  StatusLine
" StatusLineTermNC         ->                  StatusLineNC
" TabLineFill              none                lessLightGrey
" TabLineSel               reallyLightYellow   greyCyan bold
" TabLine                  lessDarkGrey        darkMedGrey
" WildMenu                 darkRed             lightYellow
" Title                    reallyDarkRed       none     bold
" Question                 reallyDarkRed       none     bold
" WarningMsg               reallyDarkRed       none
" SignColumn               lightOrange         lightGrey
" Conceal                  superDarkGrey       white
" Ignore                   medGrey             lightGrey
" rubyClass                darkBlue            none
" rubyRegexp               reallyDarkYellow    none
" rubyRegexpDelimiter      lightPink           none
" rubyArrayDelimiter       hotCyan             none
" rubyBlockParameterList   brown               none
" rubyCurlyBlockDelimiter  reallyDarkYellow    none
" rubyPredefinedIdentifier superDarkRed        none
" HighlightedyankRegion -> Ignore
" GitGutterAdd             darkGreen           lessLightGrey
" GitGutterChange          hotGreyBlue         lessLightGrey
" GitGutterDelete          reallyHotPink       lessLightGrey
" GitGutterChangeDelete    lightPink           lessLightGrey
" SignifySignAdd           darkGreen           lessLightGrey
" SignifySignChange        hotGreyBlue         lessLightGrey
" SignifySignDelete        reallyHotPink       lessLightGrey
" ALEErrorSign             reallyHotPink       darkGrey
" ALEWarningSign           darkSalmon          darkGrey
" vimFunction       -> Function
" vimUserFunc       -> Function
" vimIsCommand      -> Statement
" vimAutoCmdSfxList -> Type
