" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vundle install {{{
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" vundle
Plugin 'gmarik/vundle'

" Other plugins from github
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate.git'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'bling/vim-airline'

Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-startify'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tacahiroy/ctrlp-funky'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'chase/vim-ansible-yaml'
" Plugin 'groenewege/vim-less'

" After installing tern_for_vim one must run `npm install` 
" in ~/.vim/bundle/tern_for_vim for it to properly work
Plugin 'marijnh/tern_for_vim'

" YouCompleteMe requires its libraries to be compiled before use,
" see https://github.com/Valloric/YouCompleteMe#full-installation-guide
Plugin 'Valloric/YouCompleteMe'

" Ultisnips and its snippet repository
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Enable file type detection.
filetype plugin indent on

" }}} End vundle install


syntax on						" make pretty colors
set shortmess+=I				" hide start screen
set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set t_Co=256					" use 256 colors
set backup						" keep a backup file
set history=200					" keep 200 lines of command line history
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set incsearch					" do incremental searching
set mouse=a						" enable mouse for all modes
set hlsearch					" highlight search results
set tabstop=4					" number of spaces a tab counts for
set noexpandtab					" don't handle tab as spaces
set shiftwidth=4				" number of spaces for (auto)indent
set nowrap						" don't wrap long lines
set ignorecase smartcase 		" ignore case on lowcase-searches
set scrolloff=5 				" always +- 5 rows in sight
set sidescrolloff=5				" always +- 5 columns
set linebreak
set showbreak=\ -->\ 
set number
set relativenumber				" use relative numbers by default
set tw=0
set ch=1
let loaded_matchparen = 1
set completeopt-=preview

set clipboard=autoselect,unnamedplus

set listchars=extends:>,precedes:<

set wildignore=bower_components,node_modules/**,*.png,*.gif,*.jpg,*.tmp

" foldingmethods for gvim are specified in .gvimrc (they differ a bit)
set foldcolumn=0
set foldmethod=indent
set foldnestmax=4
set foldminlines=1
set foldlevel=99

set showtabline=1
set laststatus=2

let mapleader = "ö"
let g:is_bash=1

" commandline mappings
cnoreabbrev vhelp belowright vert help
" make ctrl-p and ctrl-n behave like Up/Down-keys on command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" add helpful path expander - command on active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" map [[ and ]] to look for { anywhere instead of default 'start/end of line' 
 :map [[ ?{<CR>w99[{
 :map ][ /}<CR>b99]}
 :map ]] j0[[%/{<CR>
 :map [] k$][%?}<CR>

""" normal mode mappings


" use <space> as :
nnoremap <Space> :

" quick save
nnoremap K :w<CR>

" clear search highlight
nnoremap <silent> <Leader>ä :nohl<CR>

" create empty lines and return to normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader><Leader>o o<ESC>kO<ESC>j

" delete row's contents with leader-d
nnoremap <Leader>d ^D

" treat c-h as real backspace also in normal mode
nnoremap <C-H> "_X

" use | to indent the lint
nnoremap \| =
nnoremap \|\| ==
nnoremap <Leader>\| \|

" also delete always to void with x/X
nnoremap x "_x
nnoremap X "_X

" make Y behave like C and D (yank to the end of line)
nnoremap Y y$

" easier jumping between windows and tabs
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nnoremap <C-h> gT
nnoremap <C-l> gt

" entering insert mode hides hlsearch, but we want to get it back with n and N
nnoremap n :set hlsearch<CR>n
nnoremap N :set hlsearch<CR>N

" use <c-p> to jump immediately to the command line
nnoremap <C-p> :<C-p>

" make some use for 'ä'
nnoremap ä `
nnoremap ää ``
vnoremap ä `
vnoremap ää ``

" use - as backwards search
nnoremap - ?
vnoremap - ?

" move only linewise
nnoremap j gj
nnoremap k gk

" prepare the accidents
nnoremap q: :q

" autocomplete { and newline, move cursor to middle
inoremap {<CR> {<CR>}<Esc>O

" by default, brackets are autocompleted, we can skip this with leader-key
inoremap <Leader>[ [
inoremap <Leader>( (
inoremap <Leader>{ {
inoremap <Leader>< <
inoremap <Leader>" "
inoremap <Leader>' '

" also, we'll add << to an exception (useful in cpp)
inoremap << <<

" since we use ö also as a <leader>, we define 'öö' as a simple 'ö'
inoremap <Leader>ö ö
" make C-p into <esc> until I figure out something better
inoremap <C-p> <Esc>

" define motion 'numbers' in external file
source ~/.vim/numbermaps.vim

" add quick way to toggle between normal and relative line numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

" call numbertoggle through <c-n>
nnoremap <C-n> :call NumberToggle()<cr>


""" Plugins {{{

" Fugitive
nnoremap <Leader>s :Gstatus<CR>

" Tagbar
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_autoclose = 1
nnoremap <Leader>t :TagbarToggle<CR>

" ctrlp
let g:ctlp_extensions = ['funky']
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_max_height = 25
let g:ctrlp_working_path_mode = ''
let g:ctrlp_use_caching = 25
let g:ctrlp_switch_buffer = 't'
let g:ctrlp_open_multiple_files = '2vjr'
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](bundle|node_modules|bower_components)$',
  \ 'file': '\v\.(ps|png|gif|exe|so|jpg|svg|ttf|pdf|zip)$',
  \ 'link': '',
  \ }

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>g :CtrlPBufTag<CR>
nnoremap <Leader>G :CtrlPBufTagAll<CR>
nnoremap <Leader>F :CtrlP %:h<CR>

" delimitMate
" use <C-l> in insert mode for escaping brackets
imap <C-l> <Plug>delimitMateS-Tab
imap <Leader><C-l> <Plug>delimitMateJumpMany
let delimitMate_matchpairs = "(:),[:],{:}"

" Syntastic

" Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme="jellybeans"

" tComment
nnoremap <Leader>C :TCommentBlock<CR>
vnoremap <Leader>C :TCommentBlock<CR>
nnoremap <Leader>c :TComment<CR>
vnoremap <Leader>c :TComment<CR>

" dbgPaVim
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0
nnoremap <Leader>p :Bp<CR>

" ultiSnips
let g:UltiSnipsExpandTrigger="<C-j>" " We use c-j as key since <tab> conflicts with YCM
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_use_ultisnips_completer = 1

" vim-startify
let g:startify_session_persistence = 1

""" }}} End Plugins

set directory=~/.vim/tmp/
set backupdir=~/.vim/tmp/

" don't save basic options or folds with the session
set ssop-=options
" set ssop-=folds

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?\(\:\)\?$"
  hi def link cppFuncDef Special
endfunction

if has("gui_running")
	set guioptions=agit
	set guicursor+=a:blinkon0
	set mousehide		" Hide the mouse when typing text
	set guifont=Dina\ 9
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " hide search highlighting when entering insert mode
  " new search through / or ? returns hls, as do letters n and N
  autocmd InsertEnter * :set nohlsearch
  autocmd BufRead,BufNewFile *.less set filetype=less
  autocmd BufRead,BufNewFile *.coffee setfiletype coffee
  autocmd BufRead,BufNewFile *.txt set foldmethod=manual

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " enhance highlighting some functions
  autocmd Syntax cpp call EnhanceCppSyntax()

  " don't automatically add commentmark when creating newline with o/O
  autocmd FileType cpp set fo-=o
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Source local additions if they exists
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif
