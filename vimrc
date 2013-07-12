" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before neobundle starts loading all
" the plugins.
let mapleader=","

" ================ Plugin stuff ====================

filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" main bundles
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \   },
  \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'ervandew/supertab'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'mhinz/vim-tmuxify'

" language-specific
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'ap/vim-css-color'

" other stuff
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/gist-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'milkypostman/vim-togglelist'

NeoBundleCheck

" ================ Ruby stuff ====================

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
augroup END

" ================ Plugin settings ====================

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
" set second section to filename
" & empty fourth section
let g:airline_section_c="%f"
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"

" Unite
" use ack in unite grep source
let g:unite_source_grep_command = 'ack'
let g:vendorunite_source_rec_async_command = 'ack -f --nofilter --ackrc=~/.ackrc'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
noremap <leader>p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
noremap <leader>/ :<C-u>Unite -no-split -buffer-name=grep -start-insert grep:.<cr>
let g:unite_source_history_yank_enable = 1
noremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
noremap <leader>s :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" Cucumber syntastic
let makeprg = 'cc --dry-run --quiet --strict '.shellescape(expand('%'))
" ================ Various stuff ====================

set bg=dark
colorscheme solarized
if $COLORTERM == 'gnome-terminal'
  set term=xterm-256color
  let g:solarized_termcolors=256
  set t_Co=256
endif

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=1000
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set autoindent
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set number " Line numbers are good
set showmode " Show current mode down the bottom
set gcr=a:blinkon0 " Disable cursor blink
set visualbell " No sounds
set autoread " Reload files changed outside vim
set noesckeys " Get rid of the delay when hitting esc!
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set timeoutlen=500

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" delete trailing spaces on save
au BufWritePre * :%s/\s\+$//e

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Scripts ========================
source ~/.vim/scripts/js.vim
source ~/.vim/scripts/vim.vim

" ================ Mappings ========================

" ignore desperate arrow keys
no <Up> <NOP>
no <Down> <NOP>
no <Left> <NOP>
no <Right> <NOP>
ino <Up> <NOP>
ino <Down> <NOP>
ino <Left> <NOP>
ino <Right> <NOP>
vno <Up> <NOP>
vno <Down> <NOP>
vno <Left> <NOP>
vno <Right> <NOP>

map <Leader>r :call RenameFile()<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <F6> :GundoToggle<CR>
map <leader>ew :e<space>
map <leader>es :sp<space>
map <leader>ev :vsp<space>

nnoremap <leader>vrc :e $MYVIMRC<cr>
nnoremap <leader>zsh :e ~/.zshrc<cr>
nnoremap <leader>cst :e ~/.custom<cr>
nnoremap <leader>tmx :e ~/.tmux.conf<cr>
nnoremap <leader>muxss :e ~/.tmuxinator/ss.yml<cr>
nnoremap <leader>arc :e ~/.ackrc<cr>

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {  }<ESC>hi

" git shortcuts
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

" insert binding tags
autocmd FileType ruby imap <leader>b binding.pry<ESC>==o
autocmd FileType cucumber imap <leader>b When I use pry<ESC>==o
autocmd FileType javascript imap <leader>b debugger;<ESC>==o
autocmd FileType ruby nmap <leader>b obinding.pry<ESC>==
autocmd FileType cucumber nmap <leader>b oWhen I use pry<ESC>==
autocmd FileType javascript nmap <leader>b odebugger;<ESC>==
autocmd FileType ruby nmap <leader>B Obinding.pry<ESC>==
autocmd FileType cucumber nmap <leader>B OWhen I use pry<ESC>==
autocmd FileType javascript nmap <leader>B Odebugger;<ESC>==
autocmd FileType cucumber nmap <leader>ns oThen I will write new steps<ESC>==
autocmd FileType cucumber nmap <leader>nS OThen I will write new steps<ESC>==

" test suite shortcuts
nnoremap <leader>zsp :Dispatch zsh -i -c 'zsp %:p'<cr>
nnoremap <leader>cc :Dispatch zsh -i -c 'cc %:p'<cr>
