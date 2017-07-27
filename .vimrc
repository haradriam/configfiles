" -------------------------------- Appearance ---------------------------------
" Theme
colorscheme koehler

" Enable syntax highlighting
syntax on

" Display line numbers on the left
set number

" Keep 3 lines above and below cursor
set scrolloff=3

" Keep 3 columns left/right the cursor
set sidescrolloff=3

" TABs configuration
set shiftwidth=4
set softtabstop=4
set expandtab

" Auto indent
set autoindent

" Show line in the cursor
set cursorline

" Enable folding and set no highligth for foldings
set fdm=indent
hi Folded ctermbg=NONE

" Show Git branch in status line (fugitive and lightline pluggins needed)
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }



" ------------------------------ Search options -------------------------------
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Incremental search
set incsearch

" Highlight searches (use <C-L> to temporarily turn off highlighting)
set hlsearch



" --------------------------------- Behaviour ---------------------------------
" Allow jumping between buffers without lossing undos
set hidden

" Enable use of the mouse for all modes
set mouse=a

" Hide the mouse when typing text
set mousehide

" Better command-line completion
set wildmenu

" Raise a dialog instead of raising an error when exit with unsaved files.
set confirm

" Buffer size for changes storing
set undolevels=1000

" Avoid distro especific modifications
set nocompatible

" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

" Avoid generating swap files
set noswapfile



" --------------------------------- Mappings ----------------------------------
"  Map <C-w> on insert mode to exit from insert mode first
imap <C-w> <ESC><C-w>

" Y acts as C or D
map Y y$

" <C-L> disable higligthing
nnoremap <C-L> :nohl<CR><C-L>

map <F5> <C-]>
imap <F5> <ESC><C-]>
map <F6> <C-t>
imap <F6> <ESC><C-t>



" --------------------------------- Pluggins ----------------------------------
call plug#begin('~/.vim/plugged')
" Easy allingment
Plug 'godlygeek/tabular'

" Enhanced status lines
Plug 'itchyny/lightline.vim'
set laststatus=2

" Git pluggin
Plug 'tpope/vim-fugitive'

" Highligthing
Plug 'mikelgarai/vim_hl'

" Highligth from column 81
Plug 'haradriam/hl_limits'

" Auto reload tags file
Plug 'craigemery/vim-autotag'
let g:autotagCtagsCmd = "ctags -R --fields=+iaS --extra=+q ."

" Syntax checking
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ["inc","include","../inc","../include"]

" Easy jump to header file (:A to jump)
Plug 'vim-scripts/a.vim'

" Auto complete
Plug 'vim-scripts/OmniCppComplete'
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

" Tag list
Plug 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 1
map <F7> :TlistOpen<CR>
imap <F7> <ESC>:TlistOpen<CR>
map <F8> :TlistClose<CR>
imap <F8> <ESC>:TlistClose<CR>
call plug#end()
