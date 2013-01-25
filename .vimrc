execute pathogen#infect()
call pathogen#helptags()
syntax on
" Recognize file types / set indent mode
filetype plugin indent on

" Share OS clipboard
set clipboard=unnamed
" Disable vi compatibility (emulation of old bugs)
set nocompatible
" UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" Visual Bell no audio
set visualbell
" Supposed to speed things up
set ttyfast
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Do not create swap fils
set nobackup
set nowritebackup
set noswapfile
" keep 200 lines of command line history
set history=200
" only complete to the longest unambiguous match, and show a menu
set wildmenu
set wildmode=list:longest
" use sane regex's (meaning you don't have to escape regex characters, unless
" you want the actual character.  So, all numbers: [0-9])
noremap / /\v
noremap ? ?\v


" LEADER
" Map the leader to ,
let mapleader = ","
" 
"nnoremap <leader>cd :cd %:p:h 


" SEARCHING
" Wrap to the top or bottom to search rest of file
set wrapscan
" Ignore case when searching
set ignorecase
" Pattern with case letters is case sensitive, pattern without case will be case insensitive
"set smartcase
" Highlight search results
set hlsearch
" Move cursor to search result as you type pattern
set incsearch
" Show lines above/below when search result is in fold
set scrolloff=3
" Hit space to remove search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Color scheme
colorscheme molokai
if has("gui_running")
    " if using a GUI (like MacVim), don't show toolbar
    set guioptions-=T
    " 256 colors
    "set t_Co=256
endif

" TABS AND SPACE
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set smarttab         " be smart
set softtabstop=4    " fix backspace
set backspace=start,indent,eol
" Display invisible chars
set listchars=tab:▸\ ,eol:¬

" STATUS LINE AND NUMBERS
" Show line numbers
set number
" Use indentation of previous line
set autoindent
set smartindent
" Show the mode 
set showmode
" display incomplete commands in the status line
set showcmd
" Show the cursor position
set ruler
" Always display the status line
set laststatus=2
" briefly highlight matching bracket/brace/etc when completing a match
set showmatch
" only highlight match for 600 milliseconds
set matchtime=3

" Move between windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <F8> :TagbarToggle<CR>

if has("autocmd")
    au!
    " Generate ctags
    "au BufWritePost *.php :silent !ctags -R --languages=php . &      
    " save files on change of focus and change of tab/buffer
    autocmd BufLeave,FocusLost * silent! wall
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
syntax on


" PLUGINS
map <F2> :NERDTreeToggle<CR>

" set runtimepath+=~/.vim/bundle/UltiSnips

" http://lerdorf.com/funclist.txt
set dictionary-=~/funclist.txt dictionary+=~/funclist.txt
" Use the dictionary completion
set complete-=k complete+=k

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
" Remap the tab key to select action with InsertTabWrapper
function! InsertTabWrapper()
    let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
endfunction
