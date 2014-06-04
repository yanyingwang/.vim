"-----"color scheme and fonts setting
colorscheme solarized
if has('gui_running')
  set guifont=Monaco\ 9
  "set guifont=Monaco\ Bold\ 9
  set background=light

  set guioptions-=m                "remove menu bar
  "set guioptions-=T               "remove toolbar
  "set guioptions-=r               "remove right-hand scroll bar
else
  set background=dark
endif

