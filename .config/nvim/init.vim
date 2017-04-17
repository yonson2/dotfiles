" auto-install vim-plug
"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'rakr/vim-one' " Atom theme, dark and light variant
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder.
Plug 'vim-airline/vim-airline' " Status bar
Plug 'sheerun/vim-polyglot' " Syntax highlightning for multiple languages
Plug 'jremmen/vim-ripgrep' " Like ag but with ripgrep
Plug 'jiangmiao/auto-pairs' " Inserts matching pairs, probably only useful for coding
Plug 'nathanaelkane/vim-indent-guides' " Indentation visual guides
Plug 'tpope/vim-commentary' " add/remove comments, gcc for line, gc<motion>
Plug 'w0rp/ale' " Linting
call plug#end()

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" Theme
syntax enable
set background=dark
colorscheme one
let g:airline_theme='one' " zenburn is pretty good with gruvbox

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
set autoread            " Auto reload changed files
set showbreak=↪         " Display character indicating new line
set wildmenu            " visual autocomplete for command menu
set colorcolumn=120     " vertical indicator

" Make CtrlP fast https://github.com/kien/ctrlp.vim/issues/174
set wildignore+=*/.git/*,*/tmp/*,*.swp
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Needs ripgrep
if executable('rg')
  set grepprg=rg
  let g:ctrlp_user_command = ['.git', 'cd %s && rg --files-with-matches ".*"', 'find %s -type f']
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

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
nnoremap <Leader>d :bp\|bd #<CR>
" Jump between linting errors
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
" Move lines around easily
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

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
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

" unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_powerline_fonts = 1 " Use powerline fonts
let g:airline_section_error = '%{ALEGetStatusLine()}' " use ALE statusline errors

" Ale settings
let g:ale_statusline_format    = ['✗ %d', '⚠ %d', '◈ ok']
let g:ale_echo_msg_format      = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save         = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_column_always   = 1
let g:ale_sign_error           = '✗'
let g:ale_sign_warning         = '⚠'

" javascript
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"') "Prefer local eslint
let g:javascript_plugin_jsdoc = 1

" Rust
let g:rustfmt_autosave = 1
