" auto-install vim-plug
"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox' " Syntax theme. colorscheme gruvbox
Plug 'joshdick/onedark.vim' " Syntax theme inspired by atom's one dark, with airline support. colorscheme onedark
" Plug 'whatyouhide/vim-gotham' " Darker syntax theme, with airline support. colorscheme gotham
" Plug 'junegunn/seoul256.vim' " Low contrast theme. colorscheme seoul256.
Plug 'KeitaNakamura/neodark.vim' " Inspired by onedark, let g:neodark#background=black|gray|brown before colorscheme neodark
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder.
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' " Syntax highlightning for multiple languages
Plug 'neomake/neomake' "Async linter
Plug 'numkil/ag.nvim' " Needs ag (the_silver_searcher) to be installed on system :S
Plug 'jiangmiao/auto-pairs' " Inserts matching pairs, probably only useful for coding
call plug#end()

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" Theme
syntax enable
set background=dark
let g:neodark#background='black'
colorscheme onedark
" let g:seoul256_background = 234 " Just for seoul256.
" let g:neodark#background='gray'
let g:airline_theme= 'onedark' " zenburn is pretty good with gruvbox

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set relativenumber      " Relative numbers
set hidden              " Hidden buffers are still loaded into memory.

" Make CtrlP fast https://github.com/kien/ctrlp.vim/issues/174#issuecomment-218866242
" Temporarily commenting this line as I'm not sure it improves performance on
" my machine
" if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  " set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
" else
  "ctrl+p ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" endif

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Leader mappings
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" Save current buffers and settings to ~/today.ses // restore with vim -S ~/today.ses
nnoremap <Leader>s :mksession! ~/.vim_session<CR>
" Restore session
nnoremap <Leader>r :source ~/.vim_session<CR>
" Go to next buffer
nnoremap <Leader><Tab> :bn<CR>
" Go to previous buffer
nnoremap <Leader><S-Tab> :bp<CR>
" Kill buffer without closing split
nnoremap <Leader>k :bp\|bd #<CR>
" Jump between neomake errors
" Go to current error.
nnoremap <Leader><Leader> :ll<CR>
"Go to next error
nnoremap <Leader>n :lnext<CR>
" Go to previous error
nnoremap <Leader>p :lprev<CR>
" Toggle highlights
nnoremap <Leader>t :noh<CR>
" Map <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>
" Select contents of a whole file
nnoremap <Leader>a ggVG

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Enable folding
set foldmethod=syntax
" Unfolded by default
set foldlevel=99
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Search
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" center search
nmap n nzz
nmap N Nzz

" ag.nvim config
let g:ag_working_path_mode="r" " Start searching from project root.

" Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
" http://nerditya.com/code/guide-to-neovim/

" Run neomake on every write
autocmd! BufWritePost * Neomake

" javascript
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"') "Prefer local eslint
let g:javascript_plugin_jsdoc = 1
