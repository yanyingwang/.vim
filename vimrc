"ln -s ./vimrc ~/.vimrc

"-----------------------------"autoload Pathogen
execute pathogen#infect()


"-----------------------------"airline
set laststatus=2              "vim-airline doesn't appear until I create a new split
set ttimeoutlen=50            "There is a pause when leaving insert mode
"let g:airline#extensions#tabline#enabled = 1
"set noshowmode                "get rid of the default mode indicator



if has('gui_running')
    set background=light
else
    set background=dark
endif

syntax enable
colorscheme solarized
"colorscheme jellybeans


syntax on                   
filetype on
filetype indent on
filetype plugin on

set nu                        "Auto line num
set hlsearch                  "Highlight Searching
set t_Co=256
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set nocompatible              "vim is vim not vi
set clipboard=unnamedplus     "murge vim clipboard to system clipboard
set mouse=a		              "Enable mouse usage (all modes)

set autoindent                "autoindent
set expandtab
set tabstop=4 shiftwidth=2 softtabstop=2
au FileType python set tabstop=8 shiftwidth=4 softtabstop=4



"-----------------------------"shortcut mapping
map <c-j> <c-w>j             
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>


