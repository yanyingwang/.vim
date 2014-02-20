"ln -s ./vimrc ~/.vimrc


"-----------------------------"Setting up Vundle - the vim plugin bundler
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

"Custom Bundles below(original repos on github):
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'

Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
                              "html tag plugin:emmet-vim
Bundle 'mattn/emmet-vim'      
Bundle 'scrooloose/nerdtree'
                              "tab completion plugin:supertab
Bundle 'ervandew/supertab'    
Bundle 'majutsushi/tagbar'
                              "syntax checking plugin:syntastic
Bundle 'scrooloose/syntastic' 

Bundle 'sunaku/vim-ruby-minitest'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
"-----------------------------"Setting up Vundle - the vim plugin bundler end



"-----------------------------"airline
set laststatus=2              "vim-airline doesn't appear until I create a new split
set ttimeoutlen=50            "There is a pause when leaving insert mode
let g:airline#extensions#tabline#enabled = 1
set noshowmode                "get rid of the default mode indicator
let g:bufferline_echo = 0     "vim-bufferline is printing to the statusline as well as the command bar



"-----------------------------"auto save
:set autowriteall             "save the file when you switch buffers
:au FocusLost * :wa           "save file when focusLost


set nu                        "Auto line num
set hlsearch                  "Highlight Searching
set t_Co=256
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set nocompatible              "be vim
set clipboard=unnamedplus     "murge vim clipboard to system clipboard
set mouse=a		              "enable mouse usage (all modes)

syntax on
"syntax enable
filetype off                  "off for Vundle
"filetype on
filetype indent on
filetype plugin on

colorscheme solarized
"colorscheme jellybeans
if has('gui_running')
    set background=light
else
    set background=dark
endif

"-----------------------------"indent config
set autoindent
set expandtab
set tabstop=4 shiftwidth=2 softtabstop=2
au FileType python set tabstop=8 shiftwidth=4 softtabstop=4
au FileType sh set tabstop=8 shiftwidth=4 softtabstop=4
au FileType ruby set tabstop=4 shiftwidth=2 softtabstop=2


"-----------------------------"CtrlP shotcut mapp to Ctrl
"let g:ctrlp_map = '<c-l>'
"let g:ctrlp_cmd = 'CtrlP'

"-----------------------------"windows moving shortcut mapping
"map <C-j> <c-w>j             
"map <C-k> <c-w>k
"map <C-l> <c-w>l
"map <C-h> <c-w>h

"-----------------------------"bn bp mapping
map <C-l> :bn<CR> 
map <C-h> :bp<CR> 
"map <C-b>l :bn<CR> 
"map <C-b>h :bp<CR> 

map <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>

map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>

"-----------------------------"map for ruby
imap <S-CR>    <CR><CR>end<Esc>-cc


