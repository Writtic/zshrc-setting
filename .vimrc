" Basic d while processing /Users/johan/.vim/bundle/newL9/plugin/l9.vim:ettings
if has("syntax")
  syntax on
endif
set number
set incsearch
set hlsearch
set ignorecase
set nobackup
set backspace=eol,start,indent " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set clipboard=unnamed
set tabstop=4 " 하나의 텝을 몇칸으로 할 것인가?
set softtabstop=4 " TAB키를 눌렀을 때 몇칸을 이동할 것인가?
set shiftwidth=4 " <<, >>을 눌렀을 때 몇칸을 이동할 것인가?
set expandtab " 모든 TAB문자를 스페이스로 변경한다.
set cindent " C언어 자동 들여쓰기
set history=256
set showmatch
set timeoutlen=1000 ttimeoutlen=0
set nocompatible            " be iMproved, required
au BufReadPost *            " 마지막에서 수정된 곳에서 커서를 위치함
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'altercation/vim-colors-solarized'
Plugin 'The-NERD-Tree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vim-flake8
autocmd FileType python map <buffer> <F10> :call Flake8()<CR>
autocmd FileType make setlocal noexpandtab
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_contrast = "low"
" YouCompleteMe Fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:flake8_show_in_file=1     " show
let g:flake8_max_markers=500    " maximum # of markers to show(500 is default)

" Key Settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
let mapleader = ","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme = 'solarized'
set laststatus=2 " turn on bottom bar
" set noshowmode

" devicons
set encoding=utf8
set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline\ Nerd\ Font\ Complete\:h18
let g:airline_powerline_fonts = 1

" NERDTree On shortcut
nnoremap <leader>nt <ESC>:NERDTree<CR>
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" Clipboard copy/paste
map <F3> "+Y<CR>
map <F4> "+gP<CR>
vmap <F3> "+Y<CR>
vmap <F4> "+gP<CR>
vnoremap <C-c> "*y<CR>
imap <F4> <ESC>"+gP<CR>
imap <C-D> <C-0>x

" Key Setting - resize windows
nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>

nnoremap <silent> <Leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>

" Vim search highlighting
nnoremap <C-l> :nohlsearch<CR><C-l>
nnoremap <leader>i :set incsearch!<CR>
nnoremap <leader>h :set hlsearch!<CR>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" YouCompleteMe
let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion=1

nnoremap <leader>g:YcmCompleter GoTo<CR>
nnoremap <leader>gg:YcmCompleter GoToImprecise<CR>
nnoremap <leader>d:YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t:YcmCompleter GetType<CR>
nnoremap <leader>p:YcmCompleter GetParent<CR>

