"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugins with Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'elixir-editors/vim-elixir'
Plugin 'tpope/vim-sleuth'
Plugin 'scrooloose/nerdcommenter'
Plugin 'slashmili/alchemist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'milkypostman/vim-togglelist'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'machakann/vim-highlightedyank'
Plugin 'prettier/vim-prettier'
Plugin 'easymotion/vim-easymotion'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-scripts/Tabmerge'
Plugin 'Chiel92/vim-autoformat'
Plugin 'rhysd/vim-grammarous'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-clang'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-obsession'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent x11-clipboard from changing its content when leaving from the vim
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

":s replace preview
set inccommand=nosplit

"fast copy/paste from system clibboard
nmap <S-p> "+p
vmap <S-y> "+y
vmap <S-d> "+d
nmap <S-d> "+dd
nmap <S-y> "+yy

" Fast saving
nmap <leader>w :w!<cr>


" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"check for changes after CursorHold event
:au CursorHold * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" open NERDTree with Ctrl+b
map <C-b> :NERDTreeTabsToggle<CR>
map <leader>nf :NERDTreeFind<CR>
let NERDTreeIgnore=['\.o$', '\.so$','\~$']


" toggle line numbers
map <C-n> :set invnumber<CR>

"toggle gitgutter
map <leader>m :GitGutterToggle<CR>
map <leader>hc :pclose<CR>
set updatetime=500

"toggle syntastic
map <C-g> :SyntasticToggleMode<CR>
noremap <leader>g :SyntasticReset<CR>

"search for visually selected text
vnoremap // y/<C-R>"<CR>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" insert newline without entering insert mode or loosing indentation
nmap <CR> oa<Esc>x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

nmap <leader>to :tabonly<CR>
" toggle neovim terminal buffer like nerdtree plugin
let g:term_buf = 0
function! Term_toggle()
  10wincmd l
  if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  else
    botright vnew
    try
      exec "buffer ".g:term_buf
    catch
      call termopen("zsh", {"detach": 0})
      let g:term_buf = bufnr("")
    endtry
    startinsert!
  endif
endfunction
nnoremap <f4> :call Term_toggle()<cr>

function! Term_close()
  10wincmd l
  if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  endif
endfunction

" automatically resize split windows when host window is resized
autocmd VimResized * wincmd =

""""""""""""""""""""""""""""""
" => Terminal mode related
""""""""""""""""""""""""""""""
" exit from the terminal mode with Esc
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-W>h

" exit and hide split with f4
tnoremap <f4> <C-\><C-n>:call Term_toggle()<cr>

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Easymotion custom mappings
map  f <Plug>(easymotion-f)
map  F <Plug>(easymotion-F)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using SHIFT+[jk]
" nmap J mz:m+<cr>`z
" nmap K mz:m-2<cr>`z
vmap J :m'>+<cr>`<my`>mzgv`yo`z
vmap K :m'<-2<cr>`>my`<mzgv`yo`z


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.swift :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.ex :call DeleteTrailingWS()
autocmd BufWrite *.cu :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


" disable folding
set nofoldenable

" Nerd commenter -  set leader for nerdcommenter and it's timeout
let mapleader=","
set timeout timeoutlen=1500


" enable mouse support
set mouse=a

" fzf configuration

nnoremap <silent> <C-p> :FZF<CR>

" So that we also search through hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <silent> <leader>p :Ag<cr>

" describes how to open files from fzf
command! -nargs=1 CopyPath let @+ = <q-args>
let g:fzf_action = {
  \ 'ctrl-o': 'edit',
  \ 'enter': 'tab drop',
  \ 'ctrl-s': 'split',
  \ 'ctrl-c': 'CopyPath',
  \ 'ctrl-v': 'vsplit' }

" Make ESC always quit the fzf prompt and not just enter normal mode
autocmd! FileType fzf tnoremap <buffer> <Esc> <c-q>

" vim session setup
let g:session_autosave = 'no'

" Syntastic setup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_cuda_nvcc_args = '-std=c++11'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Prettier config [JS]
source ~/.config/nvim/prettier.vim

" Formatter
nnoremap <leader>f :Autoformat<CR>
vnoremap <leader>f :Autoformat<CR>

" Gitdiff
nnoremap <leader>dr :diffg RE<CR>:diffupdate<CR>
nnoremap <leader>db :diffg BA<CR>:diffupdate<CR>
nnoremap <leader>dl :diffg LO<CR>:diffupdate<CR>
nnoremap <leader>du :diffupdate<CR>

" deoplete
let g:deoplete#enable_at_startup = 1 
let g:deoplete#sources#clang#clang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/lib/clang/8.0.0/include'
set completeopt-=preview

" snippets
nnoremap <leader>scmain :-1read $HOME/.config/nvim/cmain.snippet<CR>o
nnoremap <leader>plug oPlugin ''<Esc>h
