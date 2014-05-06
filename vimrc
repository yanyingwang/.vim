"ln -s ./vimrc ~/.vimrc

"-----------------------------"Set up Vundle - the vim plugin bundler - START

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
Bundle 'tpope/vim-fugitive'

"-----"quickly search and open file
Bundle 'Shougo/unite.vim'

"-----"html tag plugin:emmet-vim
Bundle 'mattn/emmet-vim'      

Bundle 'Shougo/vimfiler.vim'
"Bundle 'scrooloose/nerdtree'

"-----"tab completion plugin:supertab
Bundle 'ervandew/supertab'    

Bundle 'majutsushi/tagbar'
"-----"syntax checking plugin:syntastic

Bundle 'scrooloose/syntastic' 
Bundle 'Lokaltog/vim-easymotion'

Bundle 'sunaku/vim-ruby-minitest'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall!
endif

"-----------------------------"Set up Vundle - the vim plugin bundler - END





"-----------------------------"Vim setting - START

:let mapleader=","           "set mapleader key
"set showcmd

set nu                        "Auto line num
set hlsearch                  "Highlight Searching
set t_Co=256
"set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set nocompatible              "be vim
set clipboard=unnamedplus     "murge vim clipboard to system clipboard
set mouse=a		              "enable mouse usage (all modes)


syntax on
"syntax enable
filetype off                  "off for Vundle
"filetype on
filetype indent on
filetype plugin on




"-----"auto save
:set autowriteall             "save the file when you switch buffers
:au FocusLost * :wa           "save file when focusLost



"-----"change background color automatically
colorscheme solarized
"colorscheme jellybeans
if has('gui_running')
    set background=light
else
    set background=dark
endif


"-----"indent config
set autoindent
set expandtab
set tabstop=4 shiftwidth=2 softtabstop=2
au FileType python set tabstop=8 shiftwidth=4 softtabstop=4
au FileType sh set tabstop=8 shiftwidth=4 softtabstop=4
au FileType ruby set tabstop=4 shiftwidth=2 softtabstop=2

"-----------------------------"Vim setting - END




"-----------------------------"Plugin setting & shortcut mapping - START

"-----"vim tab switch mapping
map <C-l> :bn<CR> 
map <C-h> :bp<CR> 

"-----"windows moving shortcut mapping
"map <C-j> <c-w>j             
"map <C-k> <c-w>k
"map <C-l> <c-w>l
"map <C-h> <c-w>h

map <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>


"-----"airline
set laststatus=2              "vim-airline doesn't appear until I create a new split
set ttimeoutlen=50            "There is a pause when leaving insert mode
let g:airline#extensions#tabline#enabled = 1
set noshowmode                "get rid of the default mode indicator
let g:bufferline_echo = 0     "vim-bufferline is printing to the statusline as well as the command bar


"-----"VimFiler
:let g:vimfiler_as_default_explorer = 1


"-----"Unite
map <C-p> :Unite file<CR>


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


"-----"vim-easymotion mapping
let g:EasyMotion_do_mapping = 0  "Disable default mappings
let g:EasyMotion_smartcase = 1   "Turn on case sensitive feature
"let g:EasyMotion_startofline = 0 "keep cursor colum when JK motion

nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)



"-----------------------------"shortcut mapping - END
