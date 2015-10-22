set nocompatible                " Be iMproved
filetype off                    " Begin Vundle

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'Chiel92/vim-autoformat'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'godlygeek/tabular'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mbbill/undotree'
Plugin 'moll/vim-bbye'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'vim-latex/vim-latex'

" Unix Plugins
if has("unix")
    if has("python")
        Plugin 'valloric/youcompleteme'
    endif
endif

" Color Schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()               " End Vundle

filetype plugin indent on       " Enable file type detection & plugins
set hidden                      " Hide buffers
set showcmd                     " Show current command
set showmode                    " Show current mode
set encoding=utf-8              " UTF-8 encoding
set ruler                       " Show ruler
set autoread                    " Auto reload
set ttyfast                     " Fast terminal

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file

" Undo
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/undo     " Location to store undo history
    set undolevels=1000         " Maximum number of changes
    set undoreload=10000        " Maximum lines to save for undo on a buffer reload
endif

" Line Numbers
set nu                          " Show line numbers

" Scrolling
set scrolloff=5                 " Keep at least 5 lines above/below
set sidescrolloff=5             " Keep at least 5 lines left/right

" Searching
set incsearch                   " Incremental search
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search
set smartcase                   " Unless search contains uppercase letter
set showmatch                   " Show matching bracket

" Indentation
set smarttab                    " Better tabs
set smartindent                 " Inserts new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=4                   " Columns a tab counts for
set softtabstop=4               " Columns a tab inserts in insert mode
set shiftwidth=4                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shift width
set expandtab                   " Always use spaces instead of tabs

" Joining
set nojoinspaces                " Only one space when joining lines
if has('patch-7.3.541')
    set formatoptions+=j        " Remove comment leader when joining lines
endif

" Key sequence timeout
set ttimeout                    " Enable time out
set ttimeoutlen=100             " Set timeout time to 100 ms

" Backspace
set backspace=indent,eol,start  " Delete over line breaks

" Mouse
set mousehide                   " Hide mouse when typing
set mouse=nicr                  " No visual selection from using mouse

" Typos
cnoreabbrev W w                 " Make :W equivalent to :w
cnoreabbrev Q q                 " Make :Q equivalent to :q

" Colors & Syntax
set t_Co=256                    " Force 256 colors
let g:solarized_termtrans=1     " Support transparent terminal emulators
syntax enable                   " Enable syntax highlighting
set background=dark             " Dark background color
colorscheme solarized           " Set color scheme
highlight clear SignColumn      " Sing column same background as line numbers

" Wrapping
set nowrap                      " No wrapping
set linebreak                   " When wrapping, only at certain characters
set textwidth=0                 " Turn off physical line wrapping
set wrapmargin=0                " Turn off physical line wrapping

" Invisible Characters
nmap <leader>l :set list!<CR>   " Toggle hidden characters
set nolist                      " Hide by default
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:⎵,eol:¬

" Completion Menu
set completeopt=longest,menuone " Inserts the longest common text and
                                " show menu even with only one item

" Paste Toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Spell Checking
set spelllang=en_us             " Default language
set complete+=kspell            " Word completion
nnoremap <silent> <F7> :set spell!<CR>
autocmd BufRead,BufNewFile *.md  setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd FileType gitcommit setlocal spell

" GUI
if has("gui_running")
    set lines=999 columns=999
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline:h12,Source\ Code\ Pro:h12
    elseif has("gui_macvim")
        set guifont=Source\ Code\ Pro\ for\ Powerline:h14,Source\ Code\ Pro:h14
    elseif has("gui_win32")
        set guifont=Source\ Code\ Pro\ for\ Powerline:h11,Source\ Code\ Pro:h11
    endif
endif

" Disable Bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Disable Arrow Keys
nmap  <Up>     <NOP>
nmap  <Down>   <NOP>
nmap  <Left>   <NOP>
nmap  <Right>  <NOP>

" Treat underscore as a word boundary
set iskeyword-=_

" Wrapping Shortcuts
vmap Q gq
nmap Q gqap

" Buffers Navigation
map <silent> <C-Tab> :bnext<CR>
map <silent> <S-Tab> :bprevious<CR>
map <silent> <F4>    :Bdelete<CR>

" Window Navigation
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nnoremap <silent> <F3>  <C-w>q

" Enable Copy/Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Ctags
set tags=.tags;                 " Find .tags recursively

" Remove Trailing Whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Watch $MYVIMRC
augroup reload_myvimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Plugin Configuration

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_checkers = ['cppcheck']

" CTRL-P
let g:ctrlp_max_files = 0       " Index all files
let g:ctrlp_use_caching = 1     " Cache index

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_right = 1
let g:tagbar_width = 35
autocmd FileType * nested :call tagbar#autoopen(0)

" FSwitch
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>

" NERDTree
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 35
let NERDTreeIgnore = ['\.job$', '^CVS$', '\.orig', '\~$']
let g:NERDTreeDirArrows = 0
let g:NERDTreeStatusline = "%f"
nnoremap <F9> :NERDTreeFind<CR>
nnoremap <F10> :NERDTreeToggle<CR>
" Open NERDTree when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_server_keep_logfiles = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger = 1
nnoremap <F12> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-LeftMouse> :YcmCompleter GoTo<CR>

" Airline
set laststatus=2                " Alwasy display statusline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" LaTeX
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Imap_FreezeImap=1         " Disable mappings
let Tex_FoldedSections=''       " Disable folding sections
let Tex_FoldedEnvironments=''   " Disable folding environments
let Tex_FoldedMisc=''           " Disable folding miscellaneous
if has("win32")
    let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance'
endif

" Markdown
let g:vim_markdown_folding_disabled = 1

" Gist
let g:gist_post_private = 1     " Private by default
let g:gist_detect_filetype = 1  " Detect type from the file name
let g:gist_update_on_write = 2  " Only :w! updates a gist
