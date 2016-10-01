"----------Plugins----------"
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'chrisbra/Recover.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/a.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'moll/vim-bbye'
call plug#end()

"----------Facebook Settings----------"
source $ADMIN_SCRIPTS/master.vimrc
source $ADMIN_SCRIPTS/vim/biggrep.vim
set colorcolumn=81,101  " absolute columns to highlight
set colorcolumn=+1,+21  " relative (to textwidth) columns to highlight
syn match tab display "\t"
hi link tab Error
" use :retab to replace all tabs with spaces

"----------General Settings----------"

" Display
set ruler
set rnu
set number
set showcmd
set showmode
set showmatch

" Scrolling
set scrolljump=5
set sidescroll=10

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Indent
set autoindent

" Other
set backspace=indent,eol,start

set undolevels=1000
set viminfo='50, "50

set modelines=0

set background=dark
set mouse=a
set backupdir=~/.backups
set directory=~/.backups

let mapleader=","
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
syntax on

" Strip whitespace on save
:autocmd BufWritePre * :StripWhitespace

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Remap buffer switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

"----------Plugin-Specific Settings----------"
"---vim-airline/vim-airline---"
"" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

"---NERD settings---"
"Open/close NERDTree tabs with <leader>t"
nmap <silent> <leader>f :NERDTreeTabsToggle<CR>

"Always have NERDTree open on startup"
let g:nerdtree_tabs_open_on_console_startup=0

"---Buffer Management---"
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Close buffer and maintain windows
nmap <leader>q :Bdelete <CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>

"---scrooloose/syntastic---"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options='-stc=c++11'

"---fzf---"
nnoremap <c-p> :FZF<cr>

"Folding settings
if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

" Toggle fold at current position.
" (Using s-tab to avoid collision between <tab> and <C-i>).
nnoremap <s-tab> za
