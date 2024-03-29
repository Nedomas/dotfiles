" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

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
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/CSSMinister'
" Plug 'w0rp/ale'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = [
"   \ 'coc-tsserver'
"   \ ]
"
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif
"
" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif

" syntax
" Plug 'mxw/vim-jsx'
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'jxnblk/vim-mdx-js'

call plug#end()

" rehighlight big files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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
let g:ag_prg="ag -p ~/Developer/dotfiles/agignore --column"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" let g:ale_linters = {
" \  'markdown': ['alex', 'markdownlint', 'writegood']
" \}
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_echo_msg_format = '%linter%: %s'
" let g:ale_open_list = 0
" autocmd BufEnter plan.md ALEDisable

autocmd FileType qf setlocal wrap
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" nnoremap <leader>an :ALENextWrap<cr>
" nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:session_autosave = 'no'
let mapleader=","

set bg=light
" set bg=dark
colorscheme solarized
set t_Co=256
set term=xterm-256color

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
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
set shiftround

" Enable syntax highlighting
syntax on
" Enable filetype-specific indenting and plugins
filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
augroup END

" display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
" delete trailing spaces on save
au bufwritepre * :%s/\s\+$//e

" don't wrap lines
set nowrap
" wrap lines at convenient points
set linebreak

" ================ completion =======================

set wildmode=list:longest
" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

" ================ scrolling ========================

" start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=20
set sidescroll=1

" ================ mappings ========================

map <leader>f :Ag<space>
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>n :tab new<CR>
nnoremap <leader>bd :bd<cr>

nnoremap <leader>vrc :e $MYVIMRC<cr>
nnoremap <leader>brc :e ~/.bashrc<cr>
nnoremap <leader>tmx :e ~/.tmux.conf<cr>

command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" split lines
nnoremap K i<CR><Esc>

cmap w!! %!sudo tee > /dev/null

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
au BufWritePre * call TrimEndLines()

nnoremap <Left> <C-W><C-H>
nnoremap <Right> <C-W><C-L>
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>

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

set mouse=a
set ttymouse=xterm2

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
nnoremap <leader>gb :Gblame<cr>
map <leader>ev :vsp<cr>

let g:ctrlp_custom_ignore = 'node_modules'
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
