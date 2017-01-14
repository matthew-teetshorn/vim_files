"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader key to comma
let mapleader = ","
let g:mapleader = ","

" Auto update on external file edit
set autoread

" Setup leader commands
" Quick save
nnoremap <leader>w :w!<cr>
" Quick quit - No force on unsaved file
nnoremap <leader>q :q<cr>

" Quick exit from Insert mode
inoremap jk <Esc>

" set <C-a> (increment) & <C-x> (decrement) to not see octal 
set nrformats-=octal

" Wait a long time for multi-key commands
set ttimeout
set ttimeoutlen=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show current command in lower right corner of window
set showcmd

" Set command line completion options
set wildmenu
set wildmode=longest,full

" Alway show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Leave some space above and below cursor when scrolling
if !&scrolloff
  set scrolloff=10
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

set lazyredraw

" Map FullscreenToggle
nnoremap <leader>f :FullscreenToggle <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
  filetype plugin indent on
endif

" :list settings for non-printable characters
set list
set listchars=tab:\|\-,trail:-,extends:>,precedes:<,nbsp:+

" Activate line numbers
set number

" Open new horizontal splits below
set splitbelow
" Open new vertical splits to the right
set splitright

" Remap Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Indenting
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" Keep backspace behaving
set backspace=indent,eol,start

" Make <Tab> emulate the % bracket matching
nnoremap <Tab> %

" Set syntax folding parameters
set foldmethod=syntax
set foldnestmax=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=r
    set t_Co=256
endif

" Set the gnome terminal to 256 colors in Ubuntu
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Set font depending on system being run on
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 14
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h14:cANSI
  endif
endif

" Choose syntax highlighting color scheme
" Ensure this remains after set t_Co=256 for appropriate colors
colorscheme mustang

" :E(xplore) netrw options
let g:netrw_browse_split = 4
" Don't show info banner in netrw
let g:netrw_banner = 0
" Netrw tree view
let g:netrw_liststyle = 0
" Change sort options for directories and files
let g:netrw_sort_sequence = '[\/]$,*'

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Setup Arduino syntax highlighting
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" Turn on column 80 highlight
set cc=80

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


""""""""""""""""""""""""""""""
" => Pathogen (Tim Pope)
""""""""""""""""""""""""""""""
" Get Pathogen running
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""
" => Remap :E to :Explore from :ELP
"""""""""""""""""""""""""""""""""""
command -nargs=* -complete=dir -bar -count -bang E :Explore<bang> <args>
