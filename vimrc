"NeoBundle-----------------------------------
if !1 | finish | endif                  "Skip initialization for vim-tiny or vim-small.

"auto clone neobundle for the first time
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing Neobundle.vim ......"
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif


if has('vim_starting')
  set nocompatible                      "Be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif

NeoBundleFetch 'Shougo/neobundle.vim'   "Let NeoBundle manage NeoBundle

"Bundleplugins----------
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Raimondi/delimitMate'        "automatic closing of quotes
NeoBundle 'scrooloose/nerdcommenter'    "comment code block <leader>cc <leader>cu
"NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimshell.vim'
"NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'mattn/emmet-vim'   "auto complete html tag
NeoBundle 'ervandew/supertab' "tab completion
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic' "syntax checking
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'hallison/vim-ruby-sinatra'
NeoBundle 'vim-scripts/SudoEdit.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'dag/vim-fish.git'
"End BundlePlugins----------


call neobundle#end()


" fish as login in shell
if &shell =~# 'fish$'
    set shell=sh
endif

filetype plugin indent on

NeoBundleCheck                "prompt uninstalled plugin on startup
"End NeoBundle-----------------------------------



"VimSetting-----------------------------------
set nu
set t_Co=256
"set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set nocompatible              "be vim
set clipboard=unnamedplus     "murge vim clipboard to system clipboard
set mouse=a		              "enable mouse usage (all modes)
set hidden

:let mapleader=","            "set mapleader key

syntax on
filetype off                  "off for Vundle
filetype indent on
filetype plugin on

"chdir----
"CDC = Change to Directory of Current file
:command CDC cd %:p:h
:command Shell VimShell

"delay the timeout of key sequences
set timeoutlen=600

"auto save----
":set autowriteall             "save the file when you switch buffers
":au FocusLost * :wa           "save file when focusLost

"color scheme and fonts----
colorscheme solarized
if has('gui_running')
  "set guifont=Monaco\ 9
  "set guifont=Monaco\ Bold\ 9
  "set guifont=Inconsolata\ LGC\ Bold\ 10
  set guifont=Ubuntu\ Mono\ Bold\ 11
  set background=light
  "set guioptions-=m            "remove menu bar
  set guioptions-=T           "remove toolbar
  set guioptions-=r           "remove right-hand scroll bar
  set guioptions-=l           "remove right-hand scroll bar
else
  set background=dark
endif

"code indent----
set autoindent
set expandtab
set tabstop=4 shiftwidth=2 softtabstop=2
"set tabstop=8 shiftwidth=4 softtabstop=4
au FileType python set tabstop=8 shiftwidth=4 softtabstop=4
au FileType sh set tabstop=8 shiftwidth=4 softtabstop=4
au FileType ruby set tabstop=4 shiftwidth=2 softtabstop=2

"vim backslash search----
set ignorecase                 "/pattern/c
set nowrapscan                 "do not wrap around
set incsearch                  "interactive searching
set hlsearch                   "highlight searching
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"auto reload vimrc----
"augroup reload_vimrc
"   autocmd!
"   autocmd BufWritePost $MYVIMRC source $MYVIMRC
"ugroup END
"VimSetting-----------------------------------


"Shortcut-----------------------------------
"Force saving files that require root permission----
cmap W! w !sudo tee > /dev/null %
"":command W! w !sudo tee > /dev/null %

"Buffer switch mapping----
"Buffer prefix key----
nnoremap [buffer] <Nop>
nmap z [buffer]
nnoremap <silent> [buffer]l :bn<CR>
nnoremap <silent> [buffer]h :bp<CR>
nnoremap <silent> [buffer]d :bd<CR>

"Tab switch mapping----
"Tab prefix key----
nnoremap [tab] <Nop>
nmap t [tab]
nnoremap <silent> [tab]l :tabn<CR>
nnoremap <silent> [tab]h :tabp<CR>

"PluginSetting-----------------------------------
"tarbar----
map <F8> :TagbarToggle<CR>

"airline----
set laststatus=2               "vim-airline doesn't appear until I create a new split
set ttimeoutlen=50             "There is a pause when leaving insert mode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
set noshowmode                 "get rid of the default mode indicator
let g:bufferline_echo = 0      "vim-bufferline is printing to the statusline as well as the command bar
"vim-markdown----
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1

"vimfiler----
:let g:vimfiler_as_default_explorer = 1
"nnoremap <leader>f :VimFiler<CR>
"nnoremap <leader>r :VimFilerExplorer<CR>

"vimproc----
:command VPB VimProcBang
:command VPR VimProcRead


"Vimfiler------
let g:vimfiler_safe_mode_by_default = 0
:set modifiable


"unite--------
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_source_alias_aliases = {
		      \   'test' : {
		      \     'source': 'file_rec',
		      \     'args': '~/',
		      \   },
		      \   't' : 'tab',
		      \   'b' : 'buffer',
		      \   'm' : 'bookmark',
		      \   'bm' : 'bookmark',
		      \   'ba' : 'bookmark',
		      \   'cg' : 'change',
		      \   'y' : 'history/yank',
		      \   'f' : 'file',
		      \   'p' : 'process',
		      \   'j' : 'jump',
		      \ }

call unite#custom#alias('file', 'delete', 'vimfiler__delete')



"Unite prefix key----
nnoremap [unite] <Nop>
nmap f [unite]

nnoremap <silent> [unite]j
	        \ :<C-u>Unite -buffer-name=files -no-split
	        \ jump_point file_point buffer_tab <CR>


nnoremap <silent> [unite]f :<C-u>Unite file<CR>
nnoremap <silent> [unite]v :<C-u>VimFiler<CR>
nnoremap <silent> [unite]h :<C-u>VimShell<CR>

nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]u :<C-u>UniteResume<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]j :<C-u>Unite jump<CR>
nnoremap <silent> [unite]p :<C-u>Unite process<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file<CR>

nnoremap <silent> [unite]m :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]ma :<C-u>UniteBookmarkAdd<CR>

"nnoremap <silent> [unite]r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <silent> [unite]r :<C-u>Unite -start-insert file_rec<CR>
nnoremap <silent> [unite]rw :<C-u>UniteWithCursorWord -start-insert file_rec<CR>

nnoremap <silent> [unite]g :<C-u>Unite grep:.<CR>
nnoremap <silent> [unite]gw :<C-u>UniteWithCursorWord grep:.<CR>

nnoremap <silent> [unite]/ :<C-u>Unite grep<CR>
nnoremap <silent> [unite]/w :<C-u>UniteWithCursorWord grep<CR>


"nnoremap <silent> [unite]r  :<C-u>Unite
"      \ -buffer-name=register register<CR>
"nnoremap <silent> [unite]f
"      \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]mp
      \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]ms
      \ :<C-u>Unite output:message<CR>
nnoremap  [unite]a  :<C-u>Unite source<CR>

"nnoremap <silent> [unite]s
      "\ :<C-u>Unite -buffer-name=files -no-split
      "\ jump_point file_point buffer_tab
      "\ file_rec:! file file/new<CR>

" Start insert.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1
"\ })

" Like ctrlp.vim settings.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1,
"\   'winheight': 10,
"\   'direction': 'botright',
"\ })

" Prompt choices.
"call unite#custom#profile('default', 'context', {
"\   'prompt': '» ',
"\ })

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
        \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ?
        \ ['sorter_reverse'] : [])

  nnoremap <silent><buffer><expr> <C-s>     unite#do_action('below')
  nnoremap <silent><buffer><expr> <C-S-s>     unite#do_action('above')
  nnoremap <silent><buffer><expr> <C-v>     unite#do_action('right')
  nnoremap <silent><buffer><expr> <C-S-v>     unite#do_action('left')
  nnoremap <silent><buffer><expr> <C-t>     unite#do_action('tabopen')
endfunction"}}}
  "nnoremap <silent><buffer><expr> <C-s>     unite#do_action('split')
  "nmap <buffer> <ESC> <Plug>(unite_exit)
  "nnoremap <silent><buffer><expr> <ESC>     UniteClose 

if executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

" For ack.
if executable('ack-grep')
  " let g:unite_source_grep_command = 'ack-grep'
  " let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
  " let g:unite_source_grep_recursive_opt = ''
endif
"End Unite--------


""Neocomplete--------
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
""inoremap <expr><C-g>     neocomplete#undo_completion()
""inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplete#enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplete#enable_insert_char_pre = 1

"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1

"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""End Neocomplete--------

"End PluginSetting-----------------------------------




"Other------------------------------------
"save windows size of gvim----
"uses Vim's readfile() and writefile() functions to access the file used to save the size/position.
"if has("gui_running")
  "function! ScreenFilename()
    "if has('amiga')
      "return "s:.vimsize"
    "elseif has('win32')
      "return $HOME.'\_vimsize'
    "else
      "return $HOME.'/.vimsize'
    "endif
  "endfunction

  "function! ScreenRestore()
    ""Restore window size (columns and lines) and position
    ""from values stored in vimsize file.
    ""Must set font first so columns and lines are based on font size.
    "let f = ScreenFilename()
    "if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      "let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      "for line in readfile(f)
        "let sizepos = split(line)
        "if len(sizepos) == 5 && sizepos[0] == vim_instance
          "silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          "silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          "return
        "endif

      "endfor
    "endif
  "endfunction

  "function! ScreenSave()
    "" Save window size and position.
    "if has("gui_running") && g:screen_size_restore_pos
      "let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      "let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            "\ (getwinposx()<0?0:getwinposx()) . ' ' .
            "\ (getwinposy()<0?0:getwinposy())
      "let f = ScreenFilename()
      "if filereadable(f)
        "let lines = readfile(f)
        "call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        "call add(lines, data)
      "else
        "let lines = [data]
      "endif
      "call writefile(lines, f)
    "endif
  "endfunction

  "if !exists('g:screen_size_restore_pos')
    "let g:screen_size_restore_pos = 1
  "endif
  "if !exists('g:screen_size_by_vim_instance')
    "let g:screen_size_by_vim_instance = 1
  "endif
  "autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  "autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
"endif
"End Other------------------------------------
