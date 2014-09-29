"ln -s ./vimrc ~/.vimrc

"-----------------------------------"Set up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall!
endif


"-----"Custom Bundles below(original repos on github):
"
Bundle 'slim-template/vim-slim'
"-----"automatic closing of quotes
Bundle 'Raimondi/delimitMate'
"-----"comment code block <leader>cc <leader>cu
Bundle 'scrooloose/nerdcommenter'
"Bundle 'bronson/vim-trailing-whitespace'
"Bundle 'kien/rainbow_parentheses.vim'
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
"-----"quickly search and open file
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler.vim'
Bundle 'Shougo/vimproc.vim'
"Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/vimshell.vim'
"-----"html tag plugin:emmet-vim
Bundle 'mattn/emmet-vim'
"-----"tab completion plugin:supertab
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
"-----"syntax checking plugin:syntastic
Bundle 'scrooloose/syntastic'

Bundle 'sunaku/vim-ruby-minitest'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'plasticboy/vim-markdown'
Bundle 'hallison/vim-ruby-sinatra'
Bundle 'vim-scripts/SudoEdit.vim'


"-----------------------------------"Vim setting
set nu
set t_Co=256
"set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set nocompatible              "be vim
set clipboard=unnamedplus,unnamed,autoselect
                               "murge vim clipboard to system clipboard
set mouse=a		       "enable mouse usage (all modes)
set hidden

:let mapleader=","            "set mapleader key

syntax on
filetype off                  "off for Vundle
filetype indent on
filetype plugin on

"set autochdir
" CDC = Change to Directory of Current file
command CDC cd %:p:h

"-----"auto save
":set autowriteall             "save the file when you switch buffers
":au FocusLost * :wa           "save file when focusLost

"-----"color scheme and fonts setting
colorscheme solarized
if has('gui_running')
    if has('unix')
        set guifont=Monaco:h12
    else
        set guifont=Monaco\ 9
    endif
  "set guifont=Monaco\ Bold\ 9
  set background=light

  set guioptions-=m                "remove menu bar
  "set guioptions-=T               "remove toolbar
  "set guioptions-=r               "remove right-hand scroll bar
else
  set background=dark
endif

"-----"code indent
set autoindent
set expandtab
"set tabstop=8 shiftwidth=4 softtabstop=4
set tabstop=4 shiftwidth=2 softtabstop=2
au FileType python set tabstop=8 shiftwidth=4 softtabstop=4
au FileType sh set tabstop=8 shiftwidth=4 softtabstop=4
au FileType ruby set tabstop=4 shiftwidth=2 softtabstop=2




"-----------------------------------"setting & shortcut mapping
"Force saving files that require root permission
cmap W! w !sudo tee > /dev/null %

"-----"vim markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1


"-----"vim move through windows
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"if has('gui_running')
"  map <C-tab> <C-w>w
"endif


"-----"buffer switch mapping
"map <C-k> :bd<CR>

"-----"vim backslash search
set ignorecase                "/pattern/c
set nowrapscan                "do not wrap around
set incsearch                 "interactive searching
set hlsearch                  "highlight searching
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"-----"VimFiler
:let g:vimfiler_as_default_explorer = 1
nnoremap <leader>f :VimFiler<CR>
nnoremap <leader>r :VimFilerExplorer<CR>

"-----"Unite
let g:unite_source_history_yank_enable = 1
nnoremap <leader>h :bn<CR>
nnoremap <leader>l :bp<CR>
nnoremap <leader>j :Unite file<CR>
nnoremap <leader>m :Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>k :bd<CR>
"map <leader>b :Unite file buffer<CR>
nnoremap <leader>b :Unite buffer bookmark<CR>

"-----"tarbar
map <F8> :TagbarToggle<CR>

"-----"airline
set laststatus=2              "vim-airline doesn't appear until I create a new split
set ttimeoutlen=50            "There is a pause when leaving insert mode
let g:airline#extensions#tabline#enabled = 1
set noshowmode                "get rid of the default mode indicator
let g:bufferline_echo = 0     "vim-bufferline is printing to the statusline as well as the command bar


"-----"autocomplete ruby statement mapping
"if !exists( "*RubyEndToken" )
  "function RubyEndToken()
    "let current_line = getline( '.' )
    "let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    "let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      "let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
"
      "if match(current_line, braces_at_end) >= 0
        "return "\<CR>}\<C-O>O"
      "elseif match(current_line, stuff_without_do) >= 0
        "return "\<CR>end\<C-O>O"
      "elseif match(current_line, with_do) >= 0
        "return "\<CR>end\<C-O>O"
      "else
        "return "\<CR>"
      "endif
    "endfunction
"endif
"imap <buffer> <CR> <C-R>=RubyEndToken()<CR>


"------"uses Vim's readfile() and writefile() functions to access the file used to save the size/position.
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
