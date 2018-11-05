" -----------------------------------------------------------------------------
"-------------------------------- Appearance ---------------------------------
" -----------------------------------------------------------------------------
" Theme
colorscheme molokai
let g:molokai_original = 1

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

" Fix some issues with backspace
set backspace=indent,eol,start

" Enable folding and set no highligth for foldings
set fdm=indent
set foldlevelstart=99
hi Folded ctermbg=NONE



" -----------------------------------------------------------------------------
" ------------------------------ Search options -------------------------------
" -----------------------------------------------------------------------------
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Incremental search
set incsearch

" Highlight searches (use <C-L> to temporarily turn off highlighting)
set hlsearch



" -----------------------------------------------------------------------------
" --------------------------------- Behaviour ---------------------------------
" -----------------------------------------------------------------------------
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

" At saving, remove all tailing whitespaces
autocmd BufWritePre * %s/\s\+$//e



" -----------------------------------------------------------------------------
" --------------------------------- Mappings ----------------------------------
" -----------------------------------------------------------------------------
"  Map <C-w> on insert mode to exit from insert mode first
imap <C-w> <ESC><C-w>

" Y acts as C or D
map Y y$

" <C-L> disable higligthing
nnoremap <C-L> :nohl<CR><C-L>

" Disable folding
map <expr> <F3>
    \ &foldlevel == 0 ?
    \ ':set foldlevel=99<CR>' :
    \ ':set foldlevel=0<CR>'

" Open/Close file tree (NERDtree pluggin needed)
map <expr> <F5>
    \ exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1 ?
    \     ':NERDTreeClose<CR>':
    \     ':NERDTree<CR>'
imap <expr> <F5>
    \ exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1 ?
    \     '<ESC>:NERDTreeClose<CR>':
    \     '<ESC>:NERDTree<CR>'

" Open/Close tag list (tag list pluggin needed)
map <F6> :Tlist<CR>
imap <F6> <ESC>:Tlist<CR>

" Jump to function (ctags needed)
map <F7> <C-]>
imap <F7> <ESC><C-]>

" Return to previous tag (ctags needed)
map <F8> <C-t>
imap <F8> <ESC><C-t>

" Compile
map <F9> :make<CR>
imap <F9> <ESC>:make<CR>



" -----------------------------------------------------------------------------
" --------------------------------- Pluggins ----------------------------------
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Easy allingment
Plug 'godlygeek/tabular'

" Enhanced status lines
Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'active': {
    \     'left': [['mode', 'paste'], ['gitbranch'],
    \              ['readonly', 'filename', 'modified']]
    \ },
    \ 'component_function': {
    \     'gitbranch': 'fugitive#head'
    \}
    \}

" Git pluggins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0

" Highligthing
Plug 'haradriam/vim_hl'

" Highligth from column 81
Plug 'haradriam/vim_hl_limits'
let g:hl_limits_columns = 80
autocmd VimEnter * HlLimitsUpdate

" Auto reload tags file
" It will find for file listed on gutentags_project_root in order to define
" where to set the project root.
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.tags','.local.vimrc', '.vimrc']
let g:gutentags_ctags_extra_args = ['--c++-kinds=+p', '--fields=+iaS', '--extra=+q']


" Syntax checking
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ['inc', 'include', '../inc', '../include']
let g:syntastic_cpp_include_dirs = ['inc', 'include', '../inc', '../include']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_config_file = '~/.syntastic_cpp_config'

let g:syntastic_aggregate_errors = 1

" Easy jump to header file (:A to jump)
Plug 'vim-scripts/a.vim'

" Auto complete
Plug 'vim-scripts/OmniCppComplete'
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteScope = 1

Plug 'vim-scripts/AutoComplPop'
let OmniCpp_ShowPrototypeInAbbr = 1
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

:inoremap <expr><Up> pumvisible() ? "<C-e><Up>" : "<Up>"
:imap <ESC>[1;5A <C-Up>
:imap <expr><C-Up> pumvisible() ? "<C-p>" : "<Up>"

:inoremap <expr><Down> pumvisible() ? "<C-e><Down>" : "<Down>"
:imap <ESC>[1;5B <C-Down>
:imap <expr><C-Down> pumvisible() ? "<C-n>" : "<Down>"

set tags+=~/.vim/tags/cpp

" Tag list
Plug 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" NerdTree
Plug 'scrooloose/nerdtree'
let g:NERDTreeQuitOnOpen = 1

" Conque GDB (mapping with \)
Plug 'vim-scripts/Conque-GDB'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_select_all_word_key = '<C-a>'

function! Multiple_cursors_before()
   if exists(':AutoComplPopDisable')==2
      exe 'AutoComplPopDisable'
      let g:OmniCpp_MayCompleteDot = 0
      let g:OmniCpp_MayCompleteArrow = 0
   endif
endfunction

function! Multiple_cursors_after()
   if exists(':AutoComplPopEnable')==2
      exe 'AutoComplPopEnable'
      let g:OmniCpp_MayCompleteDot = 1
      let g:OmniCpp_MayCompleteArrow = 1
   endif
endfunction

" Project specific vimrc
Plug 'https://github.com/thinca/vim-localrc.git'

" Molokai colorscheme (colors folder needs to be copied to .vim folder)
" Replace also 'Visual' and VirsualNOS values with '#585858' or 240
Plug 'tomasr/molokai'
call plug#end()
