
" Set leader to ',' (comma)
let mapleader=','

" Prior-to-loading plugin setups
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" ALE
let g:ale_enabled = 1
" Show in quickfix window instead of location list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" Frequency of checking
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
" Linting options
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_warn_about_trailing_blank_lines = 0
" Python
let g:ale_python_flake8_options="--ignore=E111,E114,E121,E126,E127,E201,E202,E221,E222,E225,E226,E241,E266,E302,E303,E305,E306,E501"
let g:ale_python_pylint_options="--disable=trailing-newlines,fixme,line-too-long,invalid-name,missing-docstring --indent-string='  ' --indent-after-paren='  '"
" C++
let g:ale_cpp_cc_options="-W -Wall -Wextra -Wpedantic -fconcepts -pthread -std=c++2a -I. -Isrc"
let g:ale_cpp_gcc_options="-W -Wall -Wextra -Wpedantic -fconcepts -pthread -std=c++2a -I. -Isrc"
" Shell
" Ignore SC2006="$(...) instead of `...`"
let g:ale_sh_shellcheck_options="-e SC2006"
" Manual linting
nnoremap <leader>a :ALELint<CR>
nnoremap <leader>aa :ALEToggle<CR>
" Navigate to ALE error/warning lines
"nnoremap <leader>an :ALENextWrap<CR>
"nnoremap <leader>ap :ALEPreviousWrap<CR>
" ALE linters per filetype
let b:ale_linters = {'cpp': ['gcc'], 'py': ['flake8', 'pylint'], 'sh': ['shellcheck'], 'cuda': ['nvcc'], 'rust': ['rls']}


" PLUGINS
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  let haveVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  " Setting up Vundle - the VIM plugin bundler
  " This will auto-install Vundle and all listed plugins
  if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let haveVundle=0
  endif

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Plugin 'gmarik/vundle'
  " Solarized color scheme
  Plugin 'altercation/vim-colors-solarized'
  " Syntax highlighter
  "Plugin 'Syntastic'
  " Syntax checker and linter
  Plugin 'dense-analysis/ale'
  " Ctags 
  Plugin 'majutsushi/tagbar'
  " File system tree
  "Plugin 'scrooloose/nerdtree'
  "Plugin 'jistr/vim-nerdtree-tabs'
  "Plugin 'fholgado/minibufexpl.vim'
  " Add, delete, change surrounding ',",(,[,{,< and HTML-tags
  Plugin 'tpope/vim-surround'
  " Session management
  "Plugin 'tpope/vim-obsession'
  " Extend repeating per '.' to non-native commands
  Plugin 'vim-scripts/repeat.vim'
  " Highlight words
  Plugin 't9md/vim-quickhl'
  " Toggle, display and navigate marks
  Plugin 'kshenoy/vim-signature'
  " Search for the current visual mode selection using <*> or <#>
  Plugin 'nelstrom/vim-visual-star-search'
  " Status/tabline
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  " TODO tags etc
  Plugin 'TaskList.vim'
  " Gundo (undo tree helper)
  "Plugin 'sjl/gundo.vim'
  Plugin 'mbbill/undotree'
  " JSON tools
  "Plugin 'elzr/vim-json'
  " Work with GPG encrypted files
  Plugin 'jamessan/vim-gnupg'
  " Run Async shell commands
  Plugin 'skywind3000/asyncrun.vim'
  " Multiple selections
  "Plugin 'terryma/vim-multiple-cursors'
  " Align by patterns using :Tabularize 
  Plugin 'godlygeek/tabular'
  " Python code folding
  "Plugin 'tmhedberg/simpylfold'
  " Only recompute folds when file write happens
  "Plugin 'konfekt/fastfold'
  " Git diffs in the gutter
  Plugin 'airblade/vim-gitgutter'
  " Indentation guides
  Plugin 'yggdroot/indentline'
  " Commenting
  "Plugin 'scrooloose/nerdcommenter'
  " LaTeX / Zathura
  "Plugin 'lervag/vimtex'
  " LaTeX concealing
  "Plugin 'KeitaNakamura/tex-conceal.vim'
  " Code completion engine
  "Plugin 'Valloric/YouCompleteMe'
  " CtrlP
  "Plugin 'kien/ctrlp.vim'
  " Increment lists of numbers etc
  "Plugin 'triglav/vim-visual-increment'
  " Grow/shrink visual regions
  "Plugin 'terryma/vim-expand-region'
  " Rust integration
  Plugin 'rust-lang/rust.vim'


  " Directly send scripts to Blender
  "Plugin 'mipmip/vim-run-in-blender'
  
  if haveVundle == 0
    echo "Installing plugins via vundle, please ignore key map error messages"
    echo ""
    :PluginInstall
  endif
"/////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////


" Post-loading plugin setups
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" Syntastic (enable C++11)
"let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Tagbar (find the CTags bin first)
let tagbar_ctags_bin='~/.vim/exuberant-ctags/build/bin/ctags'
nnoremap <F7> :TagbarToggle<CR>

" NERDtree and NERDtree-Tabs
"nnoremap <F5> :NERDTreeTabsToggle<CR>

" MiniBufExplorer
"nnoremap <F4> :MBEToggle<CR>

" QuickHL
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)
nmap <leader>j <Plug>(quickhl-cword-toggle)

" Airline
" Get powerline fonts from https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = '%{ObsessionStatus()} BN:%{bufnr("%")}'
let g:airline_section_y = 'BN:%{bufnr("%")}'
let g:airline_theme = 'solarized'

" undotree
"nnoremap <F4> :GundoToggle<CR>
"let g:gundo_right = 1
"let g:gundo_preview_bottom = 1
"let g:gundo_auto_preview = 0
nnoremap <F4> :UndotreeToggle<CR>

" JSON.vim
" Do not hide quotes
"let g:vim_json_syntax_conceal = 0

" Multiple selections
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-l>'
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Signature (text marks are colored if there is a GitGutter sign in the gutter)
let g:SignatureMarkTextHLDynamic = 1

" Indentation guides
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0
let g:indentLine_setColors = 0

"" vimtex
"let g:vimtex_mappings_enabled = 0
"let g:tex_flavor = 'latex'
"let g:vimtex_view_method = 'zathura'
"let g:vimtex_quickfix_enabled = 0
"let g:vimtex_view_forward_search_on_start = 0
"let g:vimtex_compiler_method = 'latexmk'
""let g:tex_conceal='abdmg' 
"nmap <leader>la <plug>(vimtex-compile)<CR>

" expand-region
"map + <Plug>(expand_region_expand)
"map - <Plug>(expand_region_shrink)

" YouCompleteMe
"let g:ycm_autoclose_preview_window_after_completion = 1
set splitbelow

"/////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////



" Don't wait when leaving a mode
"set ttimeoutlen=50

" UTF-8
set encoding=utf-8
set fileencoding=utf-8

syntax on
syntax enable
filetype indent on
filetype plugin on

" Invisible characters
"(set list)  " <- uncomment for default listchars
set listchars=tab:▸\ ,eol:¬
" Toggle invisible characters with <leader><l>
nnoremap <leader>l :set list!<CR> :call TYShowBreak()<CR> :IndentLinesToggle<CR>
" Quick buffer switch with <leader><leader>
"nmap <leader><leader> :b#<CR>
" Clear search highlighting with <leader><space>
nnoremap <leader><space> :nohlsearch<CR>

" Show linewraps
set showbreak=…
" Toggle showbreak
function! TYShowBreak()
  if &showbreak == ' '
    set showbreak=…
  else
    set showbreak=\ 
  endif
endfunction
set whichwrap+=<,>,h,l,[,]

set nocompatible
set wrap
set wrapmargin=0
set tabstop=2
set softtabstop=2
set shiftwidth=2
set formatoptions=qrn1
set expandtab
set smarttab
set autoindent
set incsearch         " Begin search while still typing
set ignorecase        " Lower-case search is case-insensitive...
set smartcase         " ...but case with upper-case characters isn't
set hlsearch          " Highlight current search
set autoread
set number            " Line numbers
set showcmd
" Fix backspace key
set backspace=2
" Activate mouse support (visual)
set mouse=a
set ttymouse=xterm2
" <tab> when autocompleting in command mode shows options
set wildmenu
" Complete only up to the point of ambiguity
set wildmode=list:longest
" Mark lines longer than 80 characters
set colorcolumn=80
hi ColorColumn ctermbg=0
" Mark current cursor line
set cursorline
hi CursorLine term=reverse ctermbg=0 cterm=NONE

" Current buffer can be put to the background without writing to disk 
" and when a background buffer becomes current again, marks and 
" undo-history are remembered
set hidden

" Persistent undo/redo history
if $VIM_CLEAN_MODE != 1
  set undofile
endif
"set undodir=~/.vim/undodir/

" <%> can switch if/elsif/else/end, XML tags etc.
runtime macros/matchit.vim

" Solarized color scheme
set t_Co=256  "choose the right color palette
set background=light
colorscheme solarized

" Set gutter background color to match the line number col
highlight SignColumn ctermbg=lightgrey

" Status line
set laststatus=2

" Try to keep current line off window borders
set scrolloff=5
set sidescrolloff=5

" Intuitive cursor movement in wrapped lines (goto next/previous 
" displayed line instead of physical line)
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
nnoremap j gj
nnoremap k gk

" Editing/sourcing .vimrc
map <F6> :so $HOME/.vimrc<CR>
map <F9> :e $HOME/.vimrc<CR>
" And .bashrc
map <F8> :e $HOME/.bashrc<CR>

" Async make
nmap <leader>mc :AsyncRun make clean<CR>
nmap <leader>md :AsyncRun make debug -j12 -l12<CR>
nmap <leader>mm :AsyncRun make -j12 -l12<CR>
nmap <leader>ms :AsyncStop<CR>
" Toggle quickfix window
function! QFixToggle()
  if exists("g:qfix_win") 
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nmap <leader>qf :call QFixToggle()<CR>


" Autosave when losing focus
"au FocusLost * :wa

" Cycle through buffers
nnoremap <C-n> gt<CR>
nnoremap <C-p> gT<CR>

" Close buffer with Ctrl-W without losing splits.
" NOTE: This only works if the buffer is not open in multiple splits
"nnoremap <C-w> :bp\|bd#<CR>

" Shift-Tab unindents (command mode and insert mode)
nnoremap <S-Tab> <<
inoremap <S-Tab> <ESC><<i

" Make mappings available for Ctrl+{Del|arrow keys}
"map <ESC>[3;5~ <C-Del>
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
" Ctrl+{arrow keys} -> Navigate splits
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-Right> :wincmd l<CR>


" Folding
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  "" Open documents with all folds open
  set foldlevelstart=99
  set nofoldenable
  "" Set background color of fold marker
  hi Folded ctermbg=0

  "" <space> to toggle folds
  nnoremap <space> za
  vnoremap <space> za

  " "Refocus" folds
  "nnoremap ,z zMzvzz

  " C++
  augroup filetypes
    au!
  "  au FileType cpp    setlocal foldmethod=marker foldmarker={,}
  "  au FileType cuda   setlocal foldmethod=marker foldmarker={,}
  "  au FileType c      setlocal foldmethod=marker foldmarker={,}
  "  " Fix Python indentation
  "  au FileType python setlocal foldmethod=indent
  "  au FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=expr
  "  au FileType xml    setlocal foldmethod=syntax
    au FileType html   setlocal foldmethod=syntax
  "  au FileType css    setlocal foldmethod=syntax
  augroup END


  "let g:xml_syntax_folding=1

  "" Remember folds
  if $VIM_CLEAN_MODE != 1
    set viewoptions=cursor,folds
    augroup remember_folds
      au!
      " view files are about 500 bytes
      " bufleave but not bufwinleave captures closing 2nd tab
      " nested is needed by bufwrite* (if triggered via other autocmd)
      au BufWritePost ?* nested silent! mkview! %:p:h/.%:t.view~
      au BufWinEnter ?* silent! source %:p:h/.%:t.view~
    augroup END
  endif
"//////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////


" Make sure Vim returns to the same line when you reopen a file.
"augroup line_return
"  au!
"  au BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \     execute 'normal! g`"zvzz' |
"        \ endif
"augroup END

" Tree-style directory view
let g:netrw_liststyle=3
" No header in directory view
let g:netrw_banner=0

