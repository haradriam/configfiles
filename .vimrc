" -----------------------------------------------------------------------------
" -------------------------------- Appearance ---------------------------------
" -----------------------------------------------------------------------------
" Enable syntax highlighting
syntax on
colorscheme torte

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

" Show line in the cursor (disable for performance in current version)
" set cursorline

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

" Replace all ocurrences of word under cursor [\s]
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>



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

" Automatically open QuickFix window after using :grep
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END



" -----------------------------------------------------------------------------
" --------------------------------- Mappings ----------------------------------
" -----------------------------------------------------------------------------
"  Map <C-w> on insert mode to exit from insert mode first
imap <C-w> <ESC><C-w>

" Y acts as C or D
map Y y$

" <C-L> disable higligthing
nnoremap <C-L> :nohl<CR><C-L>

" Enable/Disable folding
map <expr> <F3>
    \ &foldlevel == 0 ?
    \ ':set foldlevel=99<CR>' :
    \ ':set foldlevel=0<CR>'

" Open FZF searcher (FZF pluggin needed)
nmap <F4> :Files<CR>
imap <F4> :Files<CR>

" Open/Close file tree (NERDtree pluggin needed)
nmap <F5> :NERDTreeToggle<CR>
imap <F5> :NERDTreeToggle<CR>

" Open/Close tag list (tag list pluggin needed)
map <F6> :Tlist<CR>
imap <F6> <ESC>:Tlist<CR>

" Jump to function (YouCompleteMe needed)
map <F7> :YcmCompleter GoToDefinition<CR>
imap <F7> <ESC>:YcmCompleter GoToDefinition<CR>

" Return to previous tag (YouCompleteMe needed)
map <F8> <C-o>
imap <F8> <ESC><C-o>

" Tabs
nnoremap tc :tabnew<Space><CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>



" -----------------------------------------------------------------------------
" --------------------------------- Pluggins ----------------------------------
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Cool status bar
Plug 'vim-airline/vim-airline'

" Fugitive to provide branch information to status bar.
Plug 'tpope/vim-fugitive'

" Highlight Git changes.
Plug 'mhinz/vim-signify'



" NerdTree
Plug 'scrooloose/nerdtree'
let g:NERDTreeQuitOnOpen = 1

" Tag list
Plug 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" FZF searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" Easy jump to header file (:A to jump)
Plug 'vim-scripts/a.vim'

" Project specific vimrc
Plug 'https://github.com/thinca/vim-localrc.git'



" Easy allingment
Plug 'godlygeek/tabular'



" Highligthing
Plug 'haradriam/vim_hl'

" Highligth from column 81
Plug 'haradriam/vim_hl_limits'
let g:hl_limits_columns = 80
autocmd VimEnter * HlLimitsUpdate



" Autocompletion. Follow Github installation instructions.
Plug 'ycm-core/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax = 1

" PlantUML syntax
Plug 'aklt/plantuml-syntax'

" Copilot
Plug 'github/copilot.vim'
call plug#end()

" Source the termdebug plugin
packadd termdebug
let g:termdebug_wide=1

