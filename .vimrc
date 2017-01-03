" #####
" Vundle stuff for plugins
" #####
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keep Plugin commands between vundle#begin/end.
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Many colorscheme options
Plugin 'flazz/vim-colorschemes'

" Code completion. Too slow for me to use frequently.
" Bundle 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'

" Python
Plugin 'klen/python-mode'

" Web Development
Plugin 'mattn/emmet-vim'

Plugin 'Shutnik/jshint2.vim'
Plugin 'pangloss/vim-javascript'

"Plugin 'skammer/vim-css-color' 
Plugin 'hail2u/vim-css3-syntax'     

" TODO Borrowed from another vimrc, will look into later.
"Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/L9'
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'itchyny/lightline.vim'      
"Plugin 'Lokaltog/vim-easymotion'    
"Plugin 'tpope/vim-surround'         
"Plugin 'kchmck/vim-coffee-script'   
"Plugin 'groenewege/vim-less'        
"Plugin 'digitaltoad/vim-jade' 

" !!! All of your Plugins must be added before the following line !!!
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" #####
" Rest of .vimrc
" #####
" Look at http://vimdoc.sourceforge.net/htmldoc/options.html for details

" YouCompleteMe
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"set tags+=./.tags

" Pymode
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
" Default python options. Not necessarily desirable if not using python.
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_lint_checkers = ['pep8']
" Disable rope
let g:pymode_rope = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_doc = 0

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")
    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).
    " 
    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  

    "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>CR
    "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>CR

    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>CR

    "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>CR
    "nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>CR
    "nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>CR
    "nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>CR

    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    "nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>CR
    "nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>CR
    "nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

" For multi-byte character support (CJK support, for example):
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands
" and when 'autoindent' is on. To insert a real tab when
" 'expandtab' is on, use CTRL-V <Tab>.

set smarttab        " When on, a <Tab> in front of a line inserts blanks
" according to 'shiftwidth'. 'tabstop' is used in other
" places. A <BS> will delete a 'shiftwidth' worth of space
" at the start of the line.

set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set hlsearch        " When there is a previous search pattern, highlight all
" its matches.

set incsearch       " While typing a search command, show immediately where the
" so far typed pattern matches.

set ignorecase      " Ignore case in search patterns.

set smartcase       " Override the 'ignorecase' option if the search pattern
" contains upper case characters.

set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
" and CTRL-U in Insert mode. This is a list of items,
" separated by commas. Each item allows a way to backspace
" over something.

set autoindent      " Copy indent from current line when starting a new line
" (typing <CR> in Insert mode or when using the "o" or "O"
" command).

set textwidth=79    " Maximum width of text that is being inserted. A longer
" line will be broken after white space to get this width.

set formatoptions=c,q,r,t " This is a sequence of letters which describes how
" automatic formatting is to be done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
" c         Auto-wrap comments using textwidth, inserting
"           the current comment leader automatically.
" q         Allow formatting of comments with "gq".
" r         Automatically insert the current comment leader
"           after hitting <Enter> in Insert mode. 
" t         Auto-wrap text using textwidth (does not apply
"           to comments)

set ruler           " Show the line and column number of the cursor position,
" separated by a comma.

set background=dark " When set to "dark", Vim will try to use colors that look
" good on a dark background. When set to "light", Vim will
" try to use colors that look good on a light background.
" Any other value is illegal.

" Makes the monitor taste better for my eyes
colorscheme CandyPaper

" I prefer many buffers to one tab.
set hidden

" Syntax highlighting
syntax on

" Set folding for python
"set foldmethod=indent
"set foldlevel=99

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes render
    " properly when inside 256-color tmux and GNU screen. See also
    " http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

set lazyredraw

" Controls how keyword completion works
set complete=.,w,b,u,t,i
" Options for insert-mode completion
set completeopt="longest"
