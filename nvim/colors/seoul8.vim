" Name:         Seoul 8
" Author:       Aramis Razzaghipour <aramisnoah@gmail.com>
" Maintainer:   Aramis Razzaghipour <aramisnoah@gmail.com>
" License:      Vim License (see `:help license`)
" Last Updated: Wed 14 Nov 19:51:05 2018

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
      \ && (!exists('&t_Co') || &t_Co < 256)
  echoerr '[Seoul 8] There are not enough colors.'
  finish
endif

set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'seoul8'

hi Normal ctermfg=253 ctermbg=239 guifg=#d9d9d9 guibg=#4b4b4b guisp=NONE cterm=NONE gui=NONE
hi LineNr ctermfg=101 ctermbg=240 guifg=#999872 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi Visual ctermfg=NONE ctermbg=23 guifg=NONE guibg=#007173 guisp=NONE cterm=NONE gui=NONE
hi VisualNOS ctermfg=NONE ctermbg=23 guifg=NONE guibg=#007173 guisp=NONE cterm=NONE gui=NONE
hi Comment ctermfg=65 ctermbg=NONE guifg=#719872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Number ctermfg=222 ctermbg=NONE guifg=#ffde99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Float ctermfg=222 ctermbg=NONE guifg=#ffde99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Boolean ctermfg=103 ctermbg=NONE guifg=#999abd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi String ctermfg=109 ctermbg=NONE guifg=#98bcbd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Constant ctermfg=73 ctermbg=NONE guifg=#6fbcbd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Character ctermfg=174 ctermbg=NONE guifg=#e09b99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Delimiter ctermfg=137 ctermbg=NONE guifg=#be9873 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi StringDelimiter ctermfg=137 ctermbg=NONE guifg=#be9873 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Statement ctermfg=108 ctermbg=NONE guifg=#98bc99 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Conditional ctermfg=110 ctermbg=NONE guifg=#98bede guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Repeat ctermfg=75 ctermbg=NONE guifg=#719cdf guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Todo ctermfg=161 ctermbg=236 guifg=#e12672 guibg=#333233 guisp=NONE cterm=NONE gui=NONE
hi Function ctermfg=187 ctermbg=NONE guifg=#dfdebd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Define ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Macro ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Include ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PreCondit ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PreProc ctermfg=143 ctermbg=NONE guifg=#bdbb72 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Identifier ctermfg=217 ctermbg=NONE guifg=#ffbfbd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Type ctermfg=179 ctermbg=NONE guifg=#dfbc72 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Operator ctermfg=186 ctermbg=NONE guifg=#dedd99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Keyword ctermfg=175 ctermbg=NONE guifg=#e17899 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Exception ctermfg=161 ctermbg=NONE guifg=#e12672 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Structure ctermfg=116 ctermbg=NONE guifg=#97dddf guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Error ctermfg=NONE ctermbg=88 guifg=NONE guibg=#730b00 guisp=NONE cterm=NONE gui=NONE
hi ErrorMsg ctermfg=NONE ctermbg=88 guifg=NONE guibg=#730b00 guisp=NONE cterm=NONE gui=NONE
hi Underlined ctermfg=217 ctermbg=NONE guifg=#ffbfbd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 guifg=NONE guibg=#3f3f3f guisp=NONE cterm=NONE gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 guifg=NONE guibg=#3f3f3f guisp=NONE cterm=NONE gui=NONE
hi CursorLineNr ctermfg=174 ctermbg=237 guifg=#be7572 guibg=#3f3f3f guisp=NONE cterm=NONE gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 guifg=NONE guibg=#3f3f3f guisp=NONE cterm=NONE gui=NONE
hi Directory ctermfg=187 ctermbg=NONE guifg=#dfdebd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi DiffAdd ctermfg=NONE ctermbg=22 guifg=NONE guibg=#006f00 guisp=NONE cterm=NONE gui=NONE
hi DiffDelete ctermfg=NONE ctermbg=138 guifg=NONE guibg=#9a7372 guisp=NONE cterm=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=242 guifg=NONE guibg=#6b6b6b guisp=NONE cterm=NONE gui=NONE
hi DiffText ctermfg=NONE ctermbg=88 guifg=NONE guibg=#730b00 guisp=NONE cterm=NONE gui=NONE
hi VertSplit ctermfg=236 ctermbg=236 guifg=#333233 guibg=#333233 guisp=NONE cterm=NONE gui=NONE
hi Folded ctermfg=101 ctermbg=240 guifg=#999872 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi FoldColumn ctermfg=144 ctermbg=240 guifg=#bdbc98 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi MatchParen ctermfg=NONE ctermbg=242 guifg=NONE guibg=#6b6b6b guisp=NONE cterm=NONE gui=NONE
hi ModeMsg ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi NonText ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi MoreMsg ctermfg=173 ctermbg=NONE guifg=#e19972 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Pmenu ctermfg=240 ctermbg=224 guifg=#565656 guibg=#ffdfdf guisp=NONE cterm=NONE gui=NONE
hi PmenuSel ctermfg=253 ctermbg=126 guifg=#d9d9d9 guibg=#9b1d72 guisp=NONE cterm=NONE gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=65 guifg=NONE guibg=#719872 guisp=NONE cterm=NONE gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=23 guifg=NONE guibg=#007173 guisp=NONE cterm=NONE gui=NONE
hi Search ctermfg=253 ctermbg=24 guifg=#d9d9d9 guibg=#007299 guisp=NONE cterm=NONE gui=NONE
hi IncSearch ctermfg=240 ctermbg=220 guifg=#565656 guibg=#ffdd00 guisp=NONE cterm=NONE gui=NONE
hi Special ctermfg=216 ctermbg=NONE guifg=#ffbd98 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SpecialKey ctermfg=243 ctermbg=NONE guifg=#727272 guibg=NONE guisp=NONE cterm=NONE gui=NONE
if !has('gui_running')
  hi SpellBad ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi SpellCap ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi SpellLocal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
  hi SpellRare ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
else
  hi SpellBad ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#e17899 cterm=NONE,undercurl gui=NONE,undercurl
  hi SpellCap ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#98bede cterm=NONE,undercurl gui=NONE,undercurl
  hi SpellLocal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#bce0ff cterm=NONE,undercurl gui=NONE,undercurl
  hi SpellRare ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#ffc0de cterm=NONE,undercurl gui=NONE,undercurl
endif
hi StatusLine ctermfg=187 ctermbg=138 guifg=#dfdebd guibg=#9a7372 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi StatusLineNC ctermfg=187 ctermbg=241 guifg=#dfdebd guibg=#616161 guisp=NONE cterm=NONE gui=NONE
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi TabLineFill ctermfg=NONE ctermbg=241 guifg=NONE guibg=#616161 guisp=NONE cterm=NONE gui=NONE
hi TabLineSel ctermfg=187 ctermbg=23 guifg=#dfdebd guibg=#007173 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi TabLine ctermfg=250 ctermbg=243 guifg=#bfbfbf guibg=#727272 guisp=NONE cterm=NONE gui=NONE
hi WildMenu ctermfg=138 ctermbg=220 guifg=#9a7372 guibg=#ffdd00 guisp=NONE cterm=NONE gui=NONE
hi Title ctermfg=181 ctermbg=NONE guifg=#e0bebc guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Question ctermfg=179 ctermbg=NONE guifg=#dfbc72 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi WarningMsg ctermfg=179 ctermbg=NONE guifg=#dfbc72 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SignColumn ctermfg=173 ctermbg=239 guifg=#e19972 guibg=#4b4b4b guisp=NONE cterm=NONE gui=NONE
hi Conceal ctermfg=241 ctermbg=NONE guifg=#616161 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Ignore ctermfg=242 ctermbg=239 guifg=#6b6b6b guibg=#4b4b4b guisp=NONE cterm=NONE gui=NONE
let g:terminal_color_0  = '#606060'
let g:terminal_color_1  = '#df9a98'
let g:terminal_color_2  = '#719672'
let g:terminal_color_3  = '#e0bb71'
let g:terminal_color_4  = '#96bbdc'
let g:terminal_color_5  = '#dfbdbc'
let g:terminal_color_6  = '#97bcbc'
let g:terminal_color_7  = '#d8d8d8'
let g:terminal_color_8  = '#757575'
let g:terminal_color_9  = '#e07798'
let g:terminal_color_10 = '#97bb98'
let g:terminal_color_11 = '#ffdd98'
let g:terminal_color_12 = '#badcfb'
let g:terminal_color_13 = '#ffbebc'
let g:terminal_color_14 = '#96ddde'
let g:terminal_color_15 = '#e9e9e9'
let ruby_operators = 1
hi rubyClass ctermfg=38 ctermbg=NONE guifg=#0099bd guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE guifg=#dedd99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE guifg=#dedd99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyArrayDelimiter ctermfg=67 ctermbg=NONE guifg=#7299bc guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyBlockParameterList ctermfg=186 ctermbg=NONE guifg=#dedd99 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyCurlyBlockDelimiter ctermfg=144 ctermbg=NONE guifg=#bdbc98 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi rubyPredefinedIdentifier ctermfg=230 ctermbg=NONE guifg=#ffffdf guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi! link HighlightedyankRegion Ignore
hi GitGutterAdd ctermfg=108 ctermbg=240 guifg=#98bc99 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi GitGutterChange ctermfg=75 ctermbg=240 guifg=#719cdf guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi GitGutterDelete ctermfg=161 ctermbg=240 guifg=#e12672 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi GitGutterChangeDelete ctermfg=175 ctermbg=240 guifg=#e17899 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi SignifySignAdd ctermfg=108 ctermbg=240 guifg=#98bc99 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi SignifySignChange ctermfg=75 ctermbg=240 guifg=#719cdf guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=161 ctermbg=240 guifg=#e12672 guibg=#565656 guisp=NONE cterm=NONE gui=NONE
hi ALEErrorSign ctermfg=161 ctermbg=239 guifg=#e12672 guibg=#4b4b4b guisp=NONE cterm=NONE gui=NONE
hi ALEWarningSign ctermfg=174 ctermbg=239 guifg=#e09b99 guibg=#4b4b4b guisp=NONE cterm=NONE gui=NONE
hi! link vimFunction Function
hi! link vimUserFunc Function
hi! link vimIsCommand Statement
hi! link vimAutoCmdSfxList Type
finish

" Background:      dark
" Color: darkTeal           #007173 ~
" Color: lightTeal          #6fbcbd ~
" Color: darkBlue           #007299 ~
" Color: lightBlue          #0099bd ~
" Color: darkGreyBlue       #7299bc ~
" Color: lightGreyBlue      #98bcbd ~
" Color: cyan               #97dddf ~
" Color: darkSkyBlue        #719cdf ~
" Color: reallyLightSkyBlue #bce0ff ~
" Color: skyBlue            #98bede ~
" Color: darkIndigo         #999abd ~
" Color: darkPurple         #9b1d72 ~
" Color: reallyDarkPurple   #333233 ~
" Color: hotPink            #e12672 ~
" Color: lightPink          #e17899 ~
" Color: reallyLightPink    #ffc0de ~
" Color: superLightPink     #ffdfdf ~
" Color: darkRed            #9a7372 ~
" Color: lightRed           #e09b99 ~
" Color: reallyDarkRed      #730b00 ~
" Color: darkOrange         #e19972 ~
" Color: lightOrange        #ffde99 ~
" Color: reallyLightOrange  #ffbd98 ~
" Color: darkSalmon         #be7572 ~
" Color: dimSalmon          #e0bebc ~
" Color: lightSalmon        #ffbfbd ~
" Color: darkYellow         #bdbb72 ~
" Color: hotYellow          #ffdd00 ~
" Color: lightYellow        #dedd99 ~
" Color: prettyDarkYellow   #bdbc98 ~
" Color: reallyDarkYellow   #999872 ~
" Color: reallyLightYellow  #dfdebd ~
" Color: superLightYellow   #ffffdf ~
" Color: lightMustard       #dfbc72 ~
" Color: darkGreen          #719872 ~
" Color: hotGreen           #006f00 ~
" Color: lightGreen         #98bc99 ~
" Color: brown              #be9873 ~
" Color: darkGrey           #4b4b4b ~
" Color: lessDarkGrey       #565656 ~
" Color: lightGrey          #bfbfbf ~
" Color: medGrey            #6b6b6b ~
" Color: medLightGrey       #727272 ~
" Color: medSlightGrey      #616161 ~
" Color: reallyDarkGrey     #3f3f3f ~
" Color: white              #d9d9d9 ~
" Normal                   white               darkGrey
" LineNr                   reallyDarkYellow    lessDarkGrey
" Visual                   none                darkTeal
" VisualNOS                none                darkTeal
" Comment                  darkGreen           none
" Number                   lightOrange         none
" Float                    lightOrange         none
" Boolean                  darkIndigo          none
" String                   lightGreyBlue       none
" Constant                 lightTeal           none
" Character                lightRed            none
" Delimiter                brown               none
" StringDelimiter          brown               none
" Statement                lightGreen          none     bold
" Conditional              skyBlue             none
" Repeat                   darkSkyBlue         none
" Todo                     hotPink             reallyDarkPurple
" Function                 reallyLightYellow   none
" Define                   darkOrange          none
" Macro                    darkOrange          none
" Include                  darkOrange          none
" PreCondit                darkOrange          none
" PreProc                  darkYellow          none
" Identifier               lightSalmon         none
" Type                     lightMustard        none
" Operator                 lightYellow         none
" Keyword                  lightPink           none
" Exception                hotPink             none
" Structure                cyan                none
" Error                    none                reallyDarkRed
" ErrorMsg                 none                reallyDarkRed
" Underlined               lightSalmon         none
" ColorColumn              none                reallyDarkGrey
" CursorLine               none                reallyDarkGrey
" CursorLineNr             darkSalmon          reallyDarkGrey
" CursorColumn             none                reallyDarkGrey
" Directory                reallyLightYellow   none
" DiffAdd                  none                hotGreen
" DiffDelete               none                darkRed
" DiffChange               none                medGrey
" DiffText                 none                reallyDarkRed
" VertSplit                reallyDarkPurple    reallyDarkPurple
" Folded                   reallyDarkYellow    lessDarkGrey
" FoldColumn               prettyDarkYellow    lessDarkGrey
" MatchParen               none                medGrey
" ModeMsg                  darkOrange          none     bold
" NonText                  medLightGrey        none
" MoreMsg                  darkOrange          none
" Pmenu                    lessDarkGrey        superLightPink
" PmenuSel                 white               darkPurple
" PmenuSbar                none                darkGreen
" PmenuThumb               none                darkTeal
" Search                   white               darkBlue
" IncSearch                lessDarkGrey        hotYellow
" Special                  reallyLightOrange   none
" SpecialKey               medLightGrey        none
" SpellBad   none none underline
" SpellCap   none none underline
" SpellLocal none none underline
" SpellRare  none none underline
" SpellBad   none none undercurl guisp=lightPink
" SpellCap   none none undercurl guisp=skyBlue
" SpellLocal none none undercurl guisp=reallyLightSkyBlue
" SpellRare  none none undercurl guisp=reallyLightPink
" StatusLine               reallyLightYellow   darkRed  bold
" StatusLineNC             reallyLightYellow   medSlightGrey
" StatusLineTerm           ->                  StatusLine
" StatusLineTermNC         ->                  StatusLineNC
" TabLineFill              none                medSlightGrey
" TabLineSel               reallyLightYellow   darkTeal bold
" TabLine                  lightGrey           medLightGrey
" WildMenu                 darkRed             hotYellow
" Title                    dimSalmon           none     bold
" Question                 lightMustard        none     bold
" WarningMsg               lightMustard        none
" SignColumn               darkOrange          darkGrey
" Conceal                  medSlightGrey       none
" Ignore                   medGrey             darkGrey
" rubyClass                lightBlue           none
" rubyRegexp               lightYellow         none
" rubyRegexpDelimiter      lightYellow         none
" rubyArrayDelimiter       darkGreyBlue        none
" rubyBlockParameterList   lightYellow         none
" rubyCurlyBlockDelimiter  prettyDarkYellow    none
" rubyPredefinedIdentifier superLightYellow    none
" HighlightedyankRegion -> Ignore
" GitGutterAdd             lightGreen          lessDarkGrey
" GitGutterChange          darkSkyBlue         lessDarkGrey
" GitGutterDelete          hotPink             lessDarkGrey
" GitGutterChangeDelete    lightPink           lessDarkGrey
" SignifySignAdd           lightGreen          lessDarkGrey
" SignifySignChange        darkSkyBlue         lessDarkGrey
" SignifySignDelete        hotPink             lessDarkGrey
" ALEErrorSign             hotPink             darkGrey
" ALEWarningSign           lightRed            darkGrey
" vimFunction       -> Function
" vimUserFunc       -> Function
" vimIsCommand      -> Statement
" vimAutoCmdSfxList -> Type
