" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
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
NeoBundle 'ervandew/supertab'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'christoomey/vim-tmux-navigator'
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
NeoBundle 'tpope/vim-abolish'
NeoBundle 'mattn/gist-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'milkypostman/vim-togglelist'
" SnipMate dependencies
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'nelstrom/vim-visual-star-search'

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
let g:bufferline_echo = 0
let g:airline_theme='dark'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1

" Unite
" use ack in unite grep source
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = "--ackrc=$HOME/.ackrc"
let g:unite_source_rec_async_command = 'ack -g --nofilter --ackrc=$HOME/.ackrc'
let g:unite_source_file_rec_max_cache_files = 9000
let g:unite_source_file_rec_ignore_pattern = '\(/vendor/\|\/dhtml_calendar/\|\/ckeditor/\)'
call unite#custom#source('buffer,file,file_mru,file_rec', 'sorters', 'sorter_rank')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_source_history_yank_enable = 1
noremap <leader>p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
noremap <leader>/ :<C-u>Unite -no-split -buffer-name=grep -start-insert grep:.<cr>
noremap <leader>y :<C-u>Unite -no-split -buffer-name=yank -start-insert history/yank<cr>
noremap <leader>s :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" Cucumber syntastic
let makeprg = 'cc --dry-run --quiet --strict '.shellescape(expand('%'))

" Tmuxify
let g:tmuxify_run = {
      \ 'cucumber': 'cc %',
      \ 'ruby': 'zsp %',
      \}
let g:tmuxify_pane_size = '30'
nnoremap <silent> <leader>cc :TxSetRunCmd 'cc %' <bar> TxKill <bar> TxCreate <bar> TxRun<cr>
nnoremap <silent> <leader>c33 :TxSetRunCmd 'c33 %' <bar> TxKill <bar> TxCreate <bar> TxRun<cr>
nnoremap <silent> <leader>rsp :TxSetRunCmd 'rsp %' <bar> TxKill <bar> TxCreate <bar> TxRun<cr>
" ================ various stuff ====================

set bg=dark
colorscheme solarized
set t_co=256
if $colorterm == 'gnome-terminal'
  set term=xterm-256color
  let g:solarized_termcolors=256
endif

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=1000
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set autoindent
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=t
set et
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " always show status line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set number " line numbers are good
set showmode " show current mode down the bottom
set gcr=a:blinkon0 " disable cursor blink
set visualbell " no sounds
set autoread " reload files changed outside vim
set noesckeys " get rid of the delay when hitting esc!
" this makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set timeoutlen=500

" ================ turn off swap files ==============

set noswapfile
set nobackup
set nowb

" ================ persistent undo ==================
" keep undo history across sessions, by storing in file.
" only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" delete trailing spaces on save
au bufwritepre * :%s/\s\+$//e

set nowrap       "don't wrap lines
set linebreak    "wrap lines at convenient points

" ================ folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ completion =======================

set wildmode=list:longest
"enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*ds_store*
set wildignore+=vendor/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ scrolling ========================

"start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ================ scripts ========================
source ~/.vim/scripts/js.vim
source ~/.vim/scripts/vim.vim

" ================ mappings ========================

" ignore desperate arrow keys
no <up> <nop>
no <down> <nop>
no <left> <nop>
no <right> <nop>
ino <up> <nop>
ino <down> <nop>
ino <left> <nop>
ino <right> <nop>
vno <up> <nop>
vno <down> <nop>
vno <left> <nop>
vno <right> <nop>

imap jj <esc>
map <leader>r :call RenameFile()<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <f6> :gundotoggle<cr>
map <leader>ew :e<space>
map <leader>es :sp<space>
map <leader>ev :vsp<space>

nnoremap <leader>vrc :e $MYVIMRC<cr>
nnoremap <leader>zrc :e ~/.zshrc<cr>
nnoremap <leader>crc :e ~/.custom<cr>
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
nnoremap <leader>gu :Git pull --rebase<cr>
nnoremap <leader>gp :Git push origin HEAD<cr>

" deploy shortcuts
nnoremap <leader>cpl :!cap to_live deploy<cr>
nnoremap <leader>cpm :!cap to_test deploy<cr>

" insert binding tags
autocmd FileType ruby nmap <leader>b obinding.pry<ESC>==
autocmd FileType ruby imap <leader>b binding.pry<ESC>==o

autocmd FileType cucumber nmap <leader>B OWhen I use pry<ESC>==
autocmd FileType cucumber nmap <leader>b oWhen I use pry<ESC>==
autocmd FileType cucumber imap <leader>b When I use pry<ESC>==o

autocmd FileType javascript nmap <leader>B Odebugger;<ESC>==
autocmd FileType javascript nmap <leader>b odebugger;<ESC>==
autocmd FileType javascript imap <leader>b debugger;<ESC>==o

autocmd FileType eruby nmap <leader>B O<% binding.pry %><ESC>==
autocmd FileType ruby vmap <leader>b $A<cr>end<ESC>gv`<IPry.rescue do<cr><ESC>

autocmd FileType cucumber nmap <leader>nS OThen I will write new steps<ESC>==
autocmd FileType cucumber nmap <leader>ns oThen I will write new steps<ESC>==
autocmd FileType cucumber nmap <leader>jq oAnd I wait for jQuery<ESC>==
" remove all binding tags
nmap <leader>rb :g/pry/d <bar> g/debugger/d<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" FORMAT the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nnoremap <leader>u mQviwU`Q
nnoremap <leader>l mQviwu`Q

" upper/lower First char of word
nnoremap <leader>U mQgewvU`Q
nnoremap <leader>L mQgewvu`Q

" split lines
nnoremap K i<CR><Esc>

" toggle hlsearch
nmap <leader>hl :set hlsearch! hlsearch?<CR>
