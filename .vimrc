" -----------------------------------------------------------------------------
" -------------------------------- Appearance ---------------------------------
" -----------------------------------------------------------------------------
" Enable syntax highlighting
syntax on
if empty(globpath(&rtp, "colors/torte.vim"))
    colorscheme default
else
    colorscheme torte
endif

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

" Improve redraw/performance
set lazyredraw
set updatetime=300

" Persistent undo
set undofile
let s:undodir = expand('~/.vim/undo')
if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p')
endif
let &undodir = s:undodir
unlet s:undodir

" Auto indent
set autoindent

" Show line in the cursor (disable for performance in current version)
" set cursorline

" Fix some issues with backspace
set backspace=indent,eol,start

" Enable folding and set no highlight for foldings
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
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>



" -----------------------------------------------------------------------------
" --------------------------------- Behaviour ---------------------------------
" -----------------------------------------------------------------------------
" Allow jumping between buffers without losing undos
set hidden

" Enable mouse where the terminal supports it; avoid issues on dumb/serial terms
if $TERM =~ 'xterm' || $TERM =~ 'screen' || $TERM =~ 'tmux'
    set mouse=a
else
    set mouse=
endif

" Hide the mouse when typing text
set mousehide

" Better command-line completion
set wildmenu

" Raise a dialog instead of raising an error when exit with unsaved files.
set confirm

" Buffer size for changes storing
set undolevels=1000

" Avoid distro specific modifications
set nocompatible

" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

" Avoid generating swap files
set noswapfile

" At saving, remove all trailing whitespaces
augroup trim_trailing_ws
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

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
inoremap <C-w> <ESC><C-w>

" Y acts as C or D
nnoremap Y y$

" <C-L> disable highlighting
nnoremap <C-L> :nohl<CR><C-L>

" Enable/Disable folding
function! ToggleFolds()
    if &foldlevel == 0
        set foldlevel=99
    else
        set foldlevel=0
    endif
endfunction
nnoremap <F3> :call ToggleFolds()<CR>

" Open FZF searcher (FZF plugin needed)
nnoremap <F4> :Files<CR>
inoremap <F4> <ESC>:Files<CR>

" Open/Close file tree (NERDTree plugin needed)
nnoremap <F5> :NERDTreeToggle<CR>
inoremap <F5> <ESC>:NERDTreeToggle<CR>

" Open/Close tag list (tag list plugin needed)
nnoremap <F6> :Tlist<CR>
inoremap <F6> <ESC>:Tlist<CR>

" Jump to function (YouCompleteMe needed)
nnoremap <F7> :YcmCompleter GoToDefinition<CR>
inoremap <F7> <ESC>:YcmCompleter GoToDefinition<CR>

" Return to previous tag (YouCompleteMe needed)
nnoremap <F8> <C-o>
inoremap <F8> <ESC><C-o>

" Tabs
nnoremap tc :tabnew<Space><CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>



" -----------------------------------------------------------------------------
" --------------------------------- Plugins -----------------------------------
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Cool status bar
Plug 'vim-airline/vim-airline'

" Fugitive to provide branch information to status bar.
Plug 'tpope/vim-fugitive'

" Highlight Git changes.
Plug 'mhinz/vim-signify'



" NerdTree
Plug 'preservim/nerdtree'
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1

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
let g:fzf_buffers_jump = 1

" Easy jump to header file (:A to jump)
Plug 'vim-scripts/a.vim'

" Project specific vimrc
Plug 'https://github.com/thinca/vim-localrc.git'



" Easy alignment
Plug 'godlygeek/tabular'



" Highlighting
Plug 'haradriam/vim_hl'

" Highlight from column 81
Plug 'haradriam/vim_hl_limits'
let g:hl_limits_columns = 80
augroup hl_limits
    autocmd!
    autocmd VimEnter * HlLimitsUpdate
augroup END



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
