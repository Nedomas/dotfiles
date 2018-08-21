" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Plugin stuff ====================

filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'danro/rename.vim'
Plug 'tommcdo/vim-exchange'
Plug 'dhruvasagar/vim-vinegar'
Plug 'tpope/vim-eunuch'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-tmuxify'
Plug 'jgdavey/tslime.vim'

" syntax
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

Plug 'lordm/vim-browser-reload-linux'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" CSS
Plug 'vim-scripts/CSSMinister'
" Plug 'hostsamurai/typeredeemer'

Plug 'twe4ked/vim-diff-toggle'

Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-dispatch'

Plug 'mtscout6/syntastic-local-eslint.vim'

call plug#end()

" ================ Ruby stuff ====================

" Enable syntax highlighting
syntax on
" Enable filetype-specific indenting and plugins
filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
augroup END

" ================ Speed ====================
set ttyfast
set ttyscroll=3
set lazyredraw
set synmaxcol=128
set scrolljump=5
" ================ Plugin settings ====================

let NERDTreeShowHidden = 1

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" Ag
let g:ag_prg="ag -p ~/dotfiles/agignore --column"

let makeprg = 'cc --dry-run --quiet --strict '.shellescape(expand('%'))
let g:syntastic_javascript_checkers=['jshint', 'eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:session_autosave = 'no'

let mapleader=","

set bg=dark
colorscheme solarized
set t_Co=256
" if $colorterm == 'gnome-terminal'
set term=xterm-256color
" set term=screen-256color
" let g:solarized_termcolors=256
" endif

" ignore tags for command-t
" set wildignore+=.git,**/vendor,**/dhtml_calendar,**/ckeditor,**/bundle,log,tmp,*.tags
set tags+=app.tags,gem.tags,js.tags
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500
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
set hidden " let buffers exist hidden
set timeoutlen=500
" set cursorline
set cc=80

set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

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

"don't wrap lines
set nowrap
"wrap lines at convenient points
set linebreak

" ================ completion =======================

set wildmode=list:longest
"enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

" ================ scrolling ========================

"start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ================ scripts ========================
source ~/.vim/scripts/vim.vim

" ================ mappings ========================

imap jj <esc>
map <leader>f :Ag<space>
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>bd :bd<cr>

nnoremap <leader>vrc :e $MYVIMRC<cr>
nnoremap <leader>zrc :e ~/.zshrc<cr>
nnoremap <leader>crc :e ~/.custom<cr>
nnoremap <leader>tmx :e ~/.tmux.conf<cr>

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {  }<ESC>hi

nmap <leader>z :silent !thyme -d<cr>:redraw!<cr>
nnoremap <leader>x :silent !thyme -s<cr>:redraw!<cr>
nmap <leader>c :!thyme -b<cr>

command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

nnoremap <leader>w :w<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" split lines
nnoremap K i<CR><Esc>

" toggle hlsearch
nmap <leader>hl :set hlsearch! hlsearch?<CR>

cmap w!! %!sudo tee > /dev/null
nnoremap <leader>n :tab new<CR>

nnoremap <bar><bar> :Tab /<bar><CR>
nnoremap r PjddkY

" cabs - less stupidity
fu! Single_quote(str)
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfu
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), Single_quote(a:value), Single_quote(a:key))
endfu
"}}}

" remove empty lines
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

nnoremap <C-H> <C-W><C-H>

au BufWritePre * call TrimEndLines()

call Cabbrev('E', 'e')
call Cabbrev('qe', 'q')
call Cabbrev('W', 'w')
call Cabbrev('Q', 'q')
call Cabbrev('Bd', 'bd')
call Cabbrev('bD', 'bd')
call Cabbrev('BD', 'bd')
call Cabbrev('Qall', 'qall')
call Cabbrev('QAll', 'qall')

call Cabbrev('hsla', 'ToHSLA')
call Cabbrev('hlsa', 'ToHSLA')
call Cabbrev('hex', 'ToHex')
call Cabbrev('rgb', 'ToRGB')
call Cabbrev('rgba', 'ToRGBA')
call Cabbrev(']', 'TernDef')

call Cabbrev('ss', 'SaveSession')
call Cabbrev('os', 'OpenSession')

:let g:session_autoload = 'no'

" Automatically set paste mode in Vim when pasting in insert mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Copy paste
" set mouse=a
set ttymouse=xterm2

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
imap jj <Esc>

" arrows in INSERT mode
set nocompatible

let g:ctrlp_custom_ignore = 'node_modules'
" autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
