
"------------------------------------------------------------------
"custom added below:
"------------------------------------------------------------------
" hide toobar or menus to see more text
:set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar

set nu                          "auto line num
set hlsearch                    "highlight searching
"color molokai
color jellybeans
"set guifont=\Ubuntu\ Mono\ Bold\ 11
set guifont=\Monaco\ Bold\ 9

"""autoload Pathogen
execute pathogen#infect()

"""Code Folding
set foldmethod=indent
set foldlevel=99

"""maps for moving within splitting windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

"""Task lists
map <leader>td <Plug>TaskList


"""Revision History
map <leader>g :GundoToggle<CR>

"""Syntax Highlighting and Validation
syntax on
filetype on
"au BufNewFile,BufRead *.sh set filetype=zsh
filetype plugin on
filetype plugin indent on
set tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType python setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

"""clipboard
set clipboard=unnamedplus
set mouse=a		" Enable mouse usage (all modes)




"ln -s ./gvim /etc/vim/gvim  " " Make external commands work through a pipe instead of a pseudo-tty "set noguipty " You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=\Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif " If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org
"
"------------------------------------------------------------------
"uses Vim's readfile() and writefile() functions to access the file used to save the size/position.
"------------------------------------------------------------------
"
"
" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
