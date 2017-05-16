" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set t_Co=256
colorscheme ron
set history=700
"Enable filetype plugin
filetype plugin on
filetype plugin indent on

"auto-read when file changed
"set autoread
let mapleader = "\<space>"
let g:mapleader = "\<space>"

"Fast saving
nmap <leader>w :up<cr>

""""""""""""""""""""""""""""""""""""""
" => VIM user interface`
"""""""""""""""""""""""""""""""""""""

"Turn on the Wild menu
set wildmenu

"Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

"Show line number
set number

set cmdheight=1

"A hide buffer when it is abandoned
set hid

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
"Ignore case when searching
set ignorecase

" When searching try to be smart about case
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

"Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

"colorscheme dracula


"Use Unix as the standard file type
set ffs=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Line-break on 200 characters
set lbr
set tw=200

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"Plugins Install
call plug#begin()

Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
Plug 'mattn/emmet-vim'
"Plug 'jwalton512/vim-blade'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx','typescript'] }
Plug 'mxw/vim-jsx', {'for': ['javascript','javascript.jsx']}

Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
"Plug 'Valloric/YouCompleteMe'
"Plug 'vim-scripts/php.vim-html-enhanced', {'for':['php','phtml']}
Plug 'msanders/snipmate.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

call plug#end()
"End Plugins

"Plugin Settings"--------------------
"NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

"React JSX in normal js
let g:jsx_ext_required = 0

"syntastic for php
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"phpctags
let g:tagbar_phpctags_memory_limit='1024M'
let g:phpcomplete_index_composer_command='composer'
let g:phpcomplete_search_tags_for_variables = 1

if has('nvim')
    "Terminal Key mapping
    tnoremap <A-x> <C-\><C-n>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

    vnoremap <leader>y "*y
    vnoremap <leader>p "*p
endif

"spell check
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>

"tagbar
nnoremap <F4> :TagbarToggle<CR>

"PATH
set path=$PWD/**


"Clipboard"
"Paste from clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
"
"Short Cuts
nnoremap <F2> :set relativenumber!<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k


"Turn on syntax folding
autocmd BufRead *.php :setlocal foldmethod=syntax
autocmd BufRead * :setlocal foldlevelstart=2

"auto-complete clang
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_semantic_triggers = {'cpp,objcpp,c' : ['->','.','::', 're!gl']}
"
"Snippet Settings
let g:snips_author="Steve Zhao <szhao@montrosetravel.com>"
"airline settup
let g:airline#extensions#hunks#enabled=0


"javascript eslint config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
"syntastic for javascript
let g:syntastic_javascript_eslint_exe = 'yarn eslint --'
let g:syntastic_javascript_flow_exe = 'yarn flow --'
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:javascript_plugin_flow = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

