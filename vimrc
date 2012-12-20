"pathogen
call pathogen#runtime_append_all_bundles()
filetype off
syntax on
filetype plugin indent on

"set leader key to ,
let mapleader=","

"soft tabs
set shiftwidth=2
set tabstop=2
set expandtab

map <Leader>1 :tabn 1<CR>
map <Leader>2 :tabn 2<CR>
map <Leader>3 :tabn 3<CR>
map <Leader>4 :tabn 4<CR>
map <Leader>5 :tabn 5<CR>
map <Leader>6 :tabn 6<CR>
map <Leader>7 :tabn 7<CR>
map <Leader>8 :tabn 8<CR>
map <Leader>9 :tabn 9<CR>
map <Leader>0 :tabnew<CR>

"set hidden        " hide buffers instead of closing them

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" theme
set t_Co=256
colorscheme mustang
syntax on

" highlight whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" safe paste
map <Leader>p :set invpaste<CR>i

" disable paste when leaving insert mode
au InsertLeave * set nopaste

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" disable highlight for html,xml files
autocmd filetype html,xml set listchars-=tab:>.
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Guardfile set filetype=ruby

" properly highlight .coffee.erb files
autocmd BufNewFile,BufRead *.coffee.erb set filetype=coffee
" Two-space indentation for CoffeeScript files
autocmd FileType coffee setl shiftwidth=2 expandtab

" automatically cd to current buff dir
au   BufEnter *   execute ":lcd " . expand("%:p:h")

" disable arrows navigation in insert mode
map <Left>  <NOP>
map <Right> <NOP>
map <Up>    <NOP>
map <Down>  <NOP>

" highlight current line
set cursorline
hi CursorLine term=none cterm=none

" highlight search terms
set hlsearch
hi Search guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" auto complete
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

" Per-project vimrc
set exrc" enable per-directory .vimrc files
set secure" disable unsafe commands in local .vimrc files

" Find project root
function! FindProjectRoot(lookFor)
    let pathMaker='%:p'
    while(len(expand(pathMaker))>1)
        let pathMaker=pathMaker.':h'
        let fileToCheck=expand(pathMaker).'/'.a:lookFor
        if filereadable(fileToCheck)||isdirectory(fileToCheck)
            return expand(pathMaker)
        endif
    endwhile
    return 0
endfunction

" CtrlP
nnoremap <silent> <Leader>t :CtrlP <c-r>=FindProjectRoot('.git')<CR><CR>

" CtrlP + Matcher
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")
endfunction

" Fix write typos
command W w
command Q q
command Wq wq
command WQ wq

" Powerline settings
set laststatus=2
"let g:Powerline_symbols = 'fancy'
