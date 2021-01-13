execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=4 shiftwidth=4 expandtab
set textwidth=120
set autoindent
set guifont=agave:h14
set number

"Open nerdtree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Open nerdtree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

"Close vim if the only window left open is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"The leader
let mapleader="\<Space>"

"Quick save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

"autoclose tags
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
autocmd FileType java,c,cpp inoremap <buffer> { {<cr>}<esc>O
autocmd FileType javascript inoremap <buffer> { {}<Left>
