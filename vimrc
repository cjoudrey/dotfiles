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

autocmd FileType php set tabstop=4|set shiftwidth=4|set noexpandtab

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

" Fix to escape from CommandT using <ESC>
let g:CommandTCancelMap=['<ESC>','<C-c>']

" CommandT custom jumps
nnoremap <silent> <Leader>gc :CommandT <c-r>=FindProjectRoot('.git') . '/app/controllers'<CR><CR>
nnoremap <silent> <Leader>gh :CommandT <c-r>=FindProjectRoot('.git') . '/app/helpers'<CR><CR>
nnoremap <silent> <Leader>gl :CommandT <c-r>=FindProjectRoot('.git') . '/lib'<CR><CR>
nnoremap <silent> <Leader>gm :CommandT <c-r>=FindProjectRoot('.git') . '/app/models'<CR><CR>
nnoremap <silent> <Leader>gp :CommandT <c-r>=FindProjectRoot('.git') . '/public'<CR><CR>
nnoremap <silent> <Leader>gv :CommandT <c-r>=FindProjectRoot('.git') . '/app/views'<CR><CR>
nnoremap <silent> <Leader>f :CommandTFlush<cr>\|:CommandT <c-r>=FindProjectRoot('.git')<CR><CR>

" Open Gemfile
nnoremap <silent> <Leader>gg :topleft 100 :split <c-r>=FindProjectRoot('.git') . '/Gemfile'<CR><CR>

" Powerline settings
set laststatus=2
"let g:Powerline_symbols = 'fancy'
