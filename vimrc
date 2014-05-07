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


"-----"Custom Bundles below(original repos on github):
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
"-----"quickly search and open file
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler.vim'
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

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall!
endif




"-----------------------------------"Vim setting
set nu
set t_Co=256
"set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set nocompatible              "be vim
set clipboard=unnamedplus     "murge vim clipboard to system clipboard
set mouse=a		              "enable mouse usage (all modes)

:let mapleader=","            "set mapleader key

syntax on
filetype off                  "off for Vundle
filetype indent on
filetype plugin on

"-----"auto save
":set autowriteall             "save the file when you switch buffers
":au FocusLost * :wa           "save file when focusLost

"-----"auto change background color
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

"-----"code indent
set autoindent
set expandtab
set tabstop=4 shiftwidth=2 softtabstop=2
au FileType python set tabstop=8 shiftwidth=4 softtabstop=4
au FileType sh set tabstop=8 shiftwidth=4 softtabstop=4
au FileType ruby set tabstop=4 shiftwidth=2 softtabstop=2




"-----------------------------------"setting & shortcut mapping
"-----"vim tab switch mapping
map <C-l> :bn<CR> 
map <C-h> :bp<CR> 
map <C-k> :bd<CR> 

"-----"vim backslash search
"set ignorecase
set incsearch                 "interactive searching
set hlsearch                  "highlight searching
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"-----"VimFiler
:let g:vimfiler_as_default_explorer = 1
map <Leader>p :VimFiler<CR>

"-----"Unite
map <C-p> :Unite file<CR>

"-----"tarbar
map <F8> :TagbarToggle<CR>

"-----"airline
set laststatus=2              "vim-airline doesn't appear until I create a new split
set ttimeoutlen=50            "There is a pause when leaving insert mode
let g:airline#extensions#tabline#enabled = 1
set noshowmode                "get rid of the default mode indicator
let g:bufferline_echo = 0     "vim-bufferline is printing to the statusline as well as the command bar

"-----"autocomplete ruby statement mapping
if !exists( "*RubyEndToken" )
  function RubyEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction
endif
imap <buffer> <CR> <C-R>=RubyEndToken()<CR>


