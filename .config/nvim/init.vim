"" auto-install vim-plug
"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Disable the following polyglot languages to use a custom plugin
let g:polyglot_disabled = ['go', 'crystal']

call plug#begin('~/.config/nvim/plugged')
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
" If you want to have icons in your statusline.
Plug 'kyazdani42/nvim-web-devicons'
" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'natecraddock/telescope-zf-native.nvim'
" File tree
" After install run :CHADdeps
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'jiangmiao/auto-pairs' " Inserts matching pairs, probably only useful for coding
Plug 'tpope/vim-commentary' " add/remove comments, gcc for line, gc<motion>
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' " Enable . repeat for things like vim-surround
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kovisoft/paredit' " Common Lisp parenthesis help
Plug 'Yggdroot/indentLine' " displays thin vertical lines at each indentation level
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Better syntax highlightning
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
" Plug 'zxqfl/tabnine-vim' " the all-language auto-completer
if executable('go')
  Plug 'fatih/vim-go', { 'do': ':silent :GoUpdateBinaries' } " Better support fo Go files
  if !executable('golines')
    silent !go install github.com/segmentio/golines@latest
  endif
  if !executable('goimports')
    silent !go install golang.org/x/tools/cmd/goimports@latest
  endif
endif
call plug#end()

" Set shell to bash
set shell=/bin/zsh

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

" " 256 color support
" set t_Co=256

" Theme
syntax enable
set background=dark
highlight Comment cterm=italic
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
lua << EOF
require("catppuccin").setup()
EOF
colorscheme catppuccin

syntax on               " Enable syntax highlightning
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
set updatetime=2000      " Time Vim waits after you stop typing before it triggers stuff. Default=4000
set mouse=a " Enable mouse

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Leader mappings
" Open file menu
nnoremap <Leader>o <cmd>Telescope find_files prompt_prefix=🔍<cr>
" Open file tree
nnoremap <Leader>q <cmd>CHADopen<cr>
" Open buffer menu
" nnoremap <Leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
" Open most recently used files
nnoremap <Leader>f <cmd>Telescope live_grep<CR>
" Find references for word under cursor in project
nnoremap <Leader>g <cmd>Telescope grep_string<CR>
" Save current buffers and settings to ~/today.ses // restore with vim -S ~/today.ses
nnoremap <Leader>s :mksession! ~/.vim_session<CR>
" Restore session
nnoremap <Leader>R :source ~/.vim_session<CR>
" go to next buffer
nnoremap <Leader><Tab> :bn<CR>
" go to previous buffer
nnoremap <Leader><S-Tab> :bp<CR>
" go to last buffer
nnoremap <Leader>pp :b#<CR>
" Kill buffer without closing split
nnoremap <Leader>d :bp\|bd #<CR>
" Jump between linting errors
" go to current error.
nnoremap <Leader><Leader> :ll<CR>
"go to next error
" nnoremap <Leader>n :lnext<CR>
" go to previous error
" nnoremap <Leader>p :lprev<CR>
" Toggle highlights
nnoremap <Leader>t :noh<CR>
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
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:▷▷⋮
  endif
set list                " Show problematic characters.

" Enable folding
set foldmethod=syntax
" Unfolded by default
set foldlevel=99
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
hi SpecialKey ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+$\|\t/
match ExtraWhitespace /\s\+$/

" Search
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" center search
nmap n nzz
nmap N Nzz

" javascript
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"') "Prefer local eslint
let g:javascript_plugin_jsdoc = 1
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" nim
" fix for commentary
autocmd FileType nim setlocal commentstring=#\ %s

" Common Lisp Rainbow
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,php,javascript,crystal,go RainbowParentheses
augroup END

" Go
" fmt buffer when saving
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
"" The following commands impact performance, disable if vim becomes slow:
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" Golines
" let g:go_fmt_command = "golines"
" let g:go_fmt_options = {
"     \ 'golines': '-m 128',
"     \ }

" COC
" Use <tab> and <S-tab> to navigate completion list: >
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
:hi CocCodeLens guifg=White
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
let g:coc_global_extensions = ['coc-json']

" Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" go to next error
nmap <Leader>n <Plug>(coc-diagnostic-next)
" go to previous error
nmap <Leader>p <Plug>(coc-diagnostic-prev)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" END COC

" Lualine, treesitter, bufferline
lua <<EOF
require('bufferline').setup{
options = {
  show_close_icon = false,
  show_buffer_close_icons = false,
  }
}

require('lualine').setup{
  options = { theme  = 'catppuccin' },
}

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<esc>"] = "close",
      }
    },
  },
}
require("telescope").load_extension("zf-native")
EOF
