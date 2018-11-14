let s:save_cpo = &cpo
set cpo&vim


function! s:build_palette() abort
  let col_base     = ['#696d80', '#34394e', 243, 237]
  let col_edge     = ['#17171b', '#818596', 234, 245]
  let col_error    = ['#161821', '#e24240', 234, 196]
  let col_gradient = ['#17171b', '#5a5f72', 234, 241]
  let col_nc       = ['#3e445e', '#0f1117', 238, 233]
  let col_warning  = ['#161821', '#f19a36', 234, 215]
  let col_insert   = ['#161821', '#56b88a', 234, 41]
  let col_replace  = ['#161821', '#f19a36', 234, 215]
  let col_visual   = ['#161821', '#bca375', 234, 180]
  let col_red      = ['#e24240', '#161821', 196, 234]

  let p = {}
  let p.inactive = airline#themes#generate_color_map(
        \ col_nc,
        \ col_nc,
        \ col_nc)
  let p.normal = airline#themes#generate_color_map(
        \ col_edge,
        \ col_gradient,
        \ col_base)
  let p.insert = airline#themes#generate_color_map(
        \ col_insert,
        \ col_gradient,
        \ col_base)
  let p.replace = airline#themes#generate_color_map(
        \ col_replace,
        \ col_gradient,
        \ col_base)
  let p.visual = airline#themes#generate_color_map(
        \ col_visual,
        \ col_gradient,
        \ col_base)

  " Accents
  let p.accents = {
        \   'red': col_red,
        \ }

  " Error
  let p.inactive.airline_error = col_error
  let p.insert.airline_error = col_error
  let p.normal.airline_error = col_error
  let p.replace.airline_error = col_error
  let p.visual.airline_error = col_error

  " Warning
  let p.inactive.airline_warning = col_warning
  let p.insert.airline_warning = col_warning
  let p.normal.airline_warning = col_warning
  let p.replace.airline_warning = col_warning
  let p.visual.airline_warning = col_warning

  return p
endfunction


let g:airline#themes#iceberg#palette = s:build_palette()


let &cpo = s:save_cpo
unlet s:save_cpo
