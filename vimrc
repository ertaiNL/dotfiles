" this must be first, because it changes other options as a side effect.
set nocompatible

" initialize pathogen
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype indent on
filetype plugin on

" general options
set hidden			" I want to be able to open another file and background current buffer
set ttyfast			" smoother output
set nobackup			" do not keep backup-files
set history=1000		" keep 1000 lines of command line history
set undolevels=1000		" be able to do 1000 undo's

" view options
set showcmd			" display incomplete commands
set number			" show line numbers
"set visualbell			" set visual bell, no sound
syntax on			" enable syntax highlighting
set background=dark		" background of my console is black
set t_Co=256			" correct colorset
set laststatus=2		" always show statusbar
set ruler			" show the cursor position all the time

" edit options
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set showmatch			" show matching brackets
set softtabstop=2		" Replace tabs with 2 spaces
set noai			" Disable auto-indenting at paste
set pastetoggle=<C-p>

" search options
set hlsearch			" search highlighting
set incsearch			" do incremental searching
set ignorecase			" ignore case when searching
set smartcase			" search highlighting

" Map keys
nmap <C-s> :w<CR>
" Re-indent entire file and return to where you was
nmap <C-i> msgg=G's
" move between files with hjkl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-Left> <C-w>h
nmap <C-Down> <C-w>j
nmap <C-Up> <C-w>k
nmap <C-Right> <C-w>l

inoremap <C-h> <ESC><C-w>h
inoremap <C-j> <ESC><C-w>j
inoremap <C-k> <ESC><C-w>k
inoremap <C-l> <ESC><C-w>l
inoremap <C-Left> <ESC><C-w>h
inoremap <C-Down> <ESC><C-w>j
inoremap <C-Up> <ESC><C-w>k
inoremap <C-Right> <ESC><C-w>l

" tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-d> :tabclose<CR>
nmap <S-Right> gt
nmap <S-Left> gT

" Ctrl+n to toggle linenumbers
nnoremap <C-n> :set invnumber<CR>

" Ctrl+c to turn of search
nmap <silent> <C-c> :silent noh<CR>

" don't use fancy symbols in statusline
let g:Powerline_symbols = "compatible"

noremap <Leader>rg :color relaxedgreen<CR>
noremap <Leader>ip :color inkpot<CR>
noremap <Leader>ir :color ir_black<CR>

colors inkpot

" bufexplorer: map leader b
nnoremap <silent> <unique> <leader>b :BufExplorer<CR>

" Highlight redundant whitespace and tabs.
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

" clean screen on exit
if !has('win32')
  au VimLeave * :!clear
endif
