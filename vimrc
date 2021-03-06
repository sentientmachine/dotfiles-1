"  ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n |||s ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)

call plug#begin('~/.vim/bundle')

" === colorscheme(s) do not change or I will jack you in the face, devin ===
Plug 'roosta/vim-srcery'
Plug 'xero/sourcerer.vim'

" === completion ===
Plug 'calebeby/ncm-css'
Plug 'roxma/ncm-flow', {'do': 'npm i -g flow-bin'}
Plug 'roxma/ncm-rct-complete'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/nvim-completion-manager', { 'do' : 'pip3 install neovim psutil setproctitle' }

" === experiments ===

" === git ===
Plug 'airblade/vim-gitgutter'

" === language plugins ===
function! BuildComposer(info)
  if a:info.status !=? 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'Keithbsmiley/rspec.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" === linting ===
Plug 'w0rp/ale'

" === make editing nicer ===
Plug 'cohama/lexima.vim'
Plug 'derekprior/vim-trimmer'
Plug 'janko-m/vim-test'
Plug 'justinmk/vim-highlightedyank'
Plug 'pbrisbin/vim-mkdir'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" === move ===
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

" === other ===
Plug 'alvan/vim-closetag'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'jungomi/vim-mdnquery'

" === search ===
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'

call plug#end()

"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

let s:darwin = has('mac')

set autoread " Automatically read file if it has been changed outside of vim
set autowrite " Automatically :write before running commands
set backspace=2 " Backspace deletes like most programs in insert mode
set background=dark " Use colors that look good on a dark background
set clipboard=unnamed " copy paste to system clipboard
set colorcolumn=+1 " highlight column after 'textwidth'
colorscheme sourcerer
set complete+=kspell " Set the matches for Insert mode completion.
set diffopt+=vertical " Start diff mode with vertical splits
set expandtab " Use the appropriate number of spaces to insert a <Tab>.
filetype plugin indent on " load indent file for language
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
set gdefault " Replace all matches on a line instead of just the first
set guicursor+=a:blinkon0 " Disable blinking cursor on nvim
set history=50 " remember the last 50 command-lines in the history table
set hlsearch " highlight search results
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
set incsearch " do incremental searching
set ignorecase " case insensitive pattern matching
set inccommand=split " this is necessary for using this %s with a quickfix window in nvim
" set termguicolors " nvim gui colors
let g:is_posix=1 " When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.
set laststatus=2 " Always display the status line
let g:python_host_prog = $HOME.'/.asdf/shims/python2'
let g:python3_host_prog = $HOME.'/.asdf/shims/python3'
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
let g:mapleader = ' ' " Set Leader key to <Space> bar
set matchtime=0 " Speed up escape after (){} chars
set mouse=a " Turn mouse on
set nobackup " Don't make a backup before overwriting a file
set nofoldenable " Leave open all folds
set nojoinspaces " Insert one space after a '.', '?' and '!' with a join command.
set noshowmode " If in Insert, Replace or Visual mode don't put a message on the last line.
set noswapfile " Do not create a swapfile for a new buffer.
set nowrap " Don't wrap lines longer than the width of the window
set nowritebackup " Don't make a backup before overwriting a file.
set number " Turn on line numbers
set numberwidth=5 " Minimal number of columns to use for the line number.
set redrawtime=1000 " Stop highlighting if it takes more than a second
set relativenumber " Show the line number relative to the line with the cursor in front of each line.
augroup numbers " Get the best of both worlds with set number and relativenumber
  autocmd!
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END
set ruler " show the cursor position all the time
runtime! macros/matchit.vim " Extended matching with '%'. See :help matchit
set scrolloff=3 " show 5 lines above and below cursor
scriptencoding utf-8 " Specify the character encoding used in the script.
set shiftround " Round indent to multiple of 'shiftwidth'.
set shiftwidth=2 " Returns the effective value of 'shiftwidth'
set showcmd " display incomplete commands
set showtabline=2
set smartcase " overrides ignorecase if pattern contains upcase
set spellfile=$HOME/.vim-spell-en.utf-8.add " Name of the word list file where words are added for the |zg| and |zw| commands.
set spelllang=en_us " Set region to US English
set splitbelow " When on, splitting a window will put the new window below the current one.
set splitright " When on, splitting a window will put the new window right of the current one.
syntax on " Turn on syntax highlighting.
set tabstop=2 " Number of spaces that a <Tab> in the file counts for.
set textwidth=100 " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
set ttimeout " determine the behavior when part of a key code sequence has been received by the terminal UI.
set undodir=$HOME/.undodir " directory name for undo file.
set undofile " Automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
set wildignore+=tmp/** " Ignore stuff that can't be opened
set wildmenu " Enables a menu at the bottom of the vim window.
set wildmode=list:longest,list:full
set winwidth=84 " Window size
set winheight=10
set winminheight=5

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler.
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

"  ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n ||
" ||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|
"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" === ale ===
let g:ale_linters = {
      \ 'javascript': ['flow', 'eslint', 'standard'],
      \ 'jsx': ['stylelint', 'eslint', 'standard'],
      \ 'html': ['eslint', 'tidy', 'htmlhint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'ruby': ['rubocop', 'reek', 'rails_best_practices'],
      \ 'text': ['vale']
      \ }

let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'html': ['prettier'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier']
      \ }

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --tab-width 2 --print-width 100 --parser flow'
let g:ale_javascript_standard_executable = 'special-standard'
let g:ale_javascript_standard_use_global = 0
let g:ale_set_quickfix = 0
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✕'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s'
highlight clear ALEWarningSign
set updatetime=1000
let g:ale_lint_on_text_changed = 0
augroup ALEExecute
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
augroup end

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

nnoremap <Leader>fix :ALEFix<CR>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

" === vim-closetag ===
let g:closetag_filenames = '*.html,*.erb,*.jsx,*.js'

" === colorizer ===
let g:colorizer_auto_filetype='sass,scss,css,html,slim,haml'

" === dispatch.vim ===
let g:rspec_command = 'Dispatch rspec {spec}'

" === easymotion ===
map <F9> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

" === fugitive ===
nnoremap <Leader>g :Git<SPACE>

" === fzf.vim ===
nnoremap <C-p> :wa<CR>:Files<CR>
nnoremap <C-b> :wa<CR>:Buffers<CR>
nnoremap <C-t> :wa<CR>:Tags<CR>
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>c :wa<CR>:Commits<CR>
nnoremap <Leader>old :wa<CR>:History<CR>
" grep the word under the cursor, select it, and then drop it into a quickfix window
nnoremap \\ :Ag <C-r><C-w><CR><C-a><CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -nargs=+ -complete=file A call fzf#vim#ag_raw(<q-args>)?

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
  if !exists(':Ag')
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Search neighboring files
function! s:fzf_neighbouring_files()
  let l:current_file =expand('%')
  let l:cwd = fnamemodify(l:current_file, ':p:h')
  let l:command = 'ag -g "" -f ' . l:cwd . ' --depth 0'

  call fzf#run({
        \ 'source': l:command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

let g:fzf_colors =
      \ { 'hl': ['fg', 'Exception'] }
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-x><C-i> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')

" === vim-gitgutter ===
let g:gitgutter_signs = 0
let g:gitgutter_sign_added = "\u271a"
let g:gitgutter_sign_modified = "\u279c"
let g:gitgutter_sign_removed = "\u2718"

" === vim-jsx ===
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" === lightline.vim ===
" sourcer lightline colorscheme by @xero
let s:base03 =  [ '#151513', 233 ]
let s:base02 =  [ '#222222', 0   ]
let s:base01 =  [ '#4e4e43', 239 ]
let s:base00 =  [ '#666656', 242 ]
let s:base0 =   [ '#808070', 244 ]
let s:base1 =   [ '#949484', 246 ]
let s:base2 =   [ '#a8a897', 248 ]
let s:base3 =   [ '#e8e8d3', 253 ]
let s:yellow =  [ '#7A7A57', 11  ]
let s:orange =  [ '#7A7A57', 3   ]
let s:red =     [ '#5F8787', 1   ]
let s:magenta = [ '#8181A6', 13  ]
let s:cyan =    [ '#87ceeb', 12  ]
let s:green =   [ '#7A7A57', 3   ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:cyan ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base0, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base02, s:yellow ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]
let g:lightline#colorscheme#sourcerer#palette = lightline#colorscheme#flatten(s:p)

let g:lightline = {
      \ 'colorscheme': 'sourcerer',
      \ 'active': {
      \   'left': [ [ 'filename' ],
      \             [ 'linter',  'gitbranch', 'gitgutter' ] ],
      \   'right': [ [ 'percent', 'lineinfo' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'WizMod',
      \   'readonly': 'WizRO',
      \   'gitbranch': 'WizGit',
      \   'filename': 'WizName',
      \   'filetype': 'WizType',
      \   'fileencoding': 'WizEncoding',
      \   'mode': 'WizMode',
      \   'gitgutter': 'MyGitGutter',
      \ },
      \ 'component_expand': {
      \   'linter': 'WizErrors',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter': 'error'
      \ },
      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
      \ 'subseparator': { 'left': '▒', 'right': '░' }
      \ }
      " \ 'separator': { 'left': '▊▋▌▍▎', 'right': '▎▍▌▋▊' },

function! WizMod()
  return &filetype =~? '' ? '' : &modified ? '» ' : &modifiable ? '' : ''
endfunction

function! WizRO()
  return &filetype !~? '' && &readonly ? '× ' : ''
endfunction

function! WizGit()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! WizName()
  let l:name = expand('%:t')
  if l:name =~? 'NetrwTreeListing'
    return ''
  endif
  return ('' !=? WizRO() ? WizRO() : WizMod()) .
        \ ('' !=? expand('%:t') ? expand('%:t') : '[none]')
endfunction

function! WizType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! WizEncoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &encoding : &encoding) : ''
endfunction

function! WizErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '' : printf('✕ %d', l:counts.total)
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let l:symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let l:hunks = GitGutterGetHunkSummary()
  let l:ret = []
  for l:i in [0, 1, 2]
    if l:hunks[l:i] > 0
      call add(l:ret, l:symbols[l:i] . l:hunks[l:i])
    endif
  endfor
  return join(l:ret, ' ')
endfunction

augroup alestatus
  au!
  autocmd User ALELint call lightline#update()
augroup end

" === netrw ===
" let g:loaded_netrwPlugin = 1
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_dirhistmax = 0
nnoremap _ :Lexplore<CR>
nnoremap - :Sexplore<CR>
nnoremap <F10> :q<CR>

" === nvim-completion-manager ===
let g:cm_refresh_length = 2
set pumheight=5
set shortmess+=c

" === omnicompletion ===
filetype plugin on
set completeopt=menu,preview " Shows menu and any additional tips

" === vim-test ===
let g:test#strategy = 'dispatch'
" this rspec command is SpreeCommerce specific. Don't copy unless you need to
let g:test#ruby#rspec#executable = 'SPEC_ALL=true bundle exec rspec'
" update jest snapshots with vim-test
let g:test#runner_commands = ['Jest']
nnoremap <Leader>u :Jest <C-r>=escape(expand("%"), ' ') . ' ' . '--updateSnapshot'<CR><CR>

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" === vim-tmux-navigator ===
" To use c-h in neovim on OS X
" (https://github.com/neovim/neovim/issues/2048#issuecomment-78045837):
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
nnoremap <silent> <c-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <c-j> :TmuxNavigateDown<CR>
nnoremap <silent> <c-k> :TmuxNavigateUp<CR>
nnoremap <silent> <c-l> :TmuxNavigateRight<CR>
let g:tmux_navigator_no_mappings = 1 " do nay let the plugin set the mappings
let g:tmux_navigator_save_on_switch = 2 " Save on switch

"  ____ ____ ____ ____
" ||m |||a |||p |||s ||
" ||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|

" === Switch between the last two files ===
nnoremap <leader><leader> <c-^>

" === automatically rebalance windows on vim resize ===
augroup resize
  autocmd VimResized * :wincmd =
augroup END

" === zoom a vim pane, <C-w>= to re-balance ===
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>

" === Get dot command repeatability in visual mode (from @geoffharcourt) ===
xnoremap . :normal.<CR>

" === Toggle spell checking on and off ===
nnoremap <silent> <Leader>, :set spell!<CR>

" === Comment/un-comment like Sublime (from @geoffharcourt) ===
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

" === Use C-Space to Esc out of any mode (from @christoomey) ===
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^
if s:darwin
  " oTerminal sees <C-@> as <C-space> WTF, but ok
  nnoremap <C-@> <Esc>:noh<CR>
  vnoremap <C-@> <Esc>gV
  onoremap <C-@> <Esc>
  cnoremap <C-@> <C-c>
  inoremap <C-@> <Esc>`^
endif

" === make tab completion travel in a reasonable direction ===
function! InsertTabWrapper()
  let l:col = col('.') - 1
  if !l:col || getline('.')[l:col - 1] !~? '\k'
    return "\<Tab>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-P>

" === Emacs-like. Experimental, breaks things you might be using. ===
nnoremap <C-a> ^
nnoremap <C-e> $
xnoremap <C-a> ^
xnoremap <C-e> $
imap <C-a> <Home>
imap <C-e> <End>
nnoremap <C-w> db
imap <C-n> <Down>
imap <C-p> <Up>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-k> <C-o>D
imap <C-x> <Bs>

" === Require pry (from @christoomey) ===
nnoremap <Leader>b orequire 'pry'; binding.pry<esc>^

" === Let's stop typing ':Bundle' ===
nnoremap <Leader>bu :Bundle<CR>

" === map <ctrl>c to quit ===
nnoremap <C-c> :x<CR>

" === Copy the entire buffer into the system register (from @R00k) ===
nnoremap <Leader>co mmggVG"*y`m

" === add debugger anywhere ===
nnoremap <Leader>d odebugger;<esc>^

" === Run them migrations ===
nnoremap <Leader>dm :! rails db:migrate<CR>

" === Try for a better gJ ===
nnoremap gj gJ

" === Convert Ruby 1.8 to 1.9 Hash Syntax ===
nnoremap <Leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" === Open .html pages from vim in browser ===
nnoremap <Leader>ht :!open '%'<CR>

" === Neovim terminal mappings for easy navigation ===
augroup neoterm
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap kj <C-\><C-n>
tnoremap <C-d> <C-\><C-n>:bd!<CR>

" === Indent the whole file ===
nnoremap <Leader>i mmgg=G`m

" === Move up and down by visible lines if current line is wrapped ===
nnoremap j gj
nnoremap k gk

" === Mappings to move lines. Symbols represent 'alt' because macs are insane ===
" 'j' = '∆' and 'k' = '˚'
" http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
if s:darwin
  nnoremap ˚ :m .-2<CR>==
  nnoremap ∆ :m .+1<CR>==
  inoremap ˚ <Esc>:m .-2<CR>==gi
  inoremap ∆ <Esc>:m .+1<CR>==gi
  vnoremap ˚ :m '>-2<CR>gv=gv
  vnoremap ∆ :m '<+1<CR>gv=gv
endif
" For Linux
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-k> :m '>-2<CR>gv=gv
vnoremap <A-j> :m '<+1<CR>gv=gv

" === Make esc more user friendly ===
inoremap jk <Esc>
xnoremap jk <Esc>

" === Toggle relative line number for yanking, i.e. :6y ===
nnoremap <Leader>ln :set relativenumber!<CR>

" === paste flow when I need it ===
nnoremap <Leader>flo O// @flow<Esc>^

" === sed it up ===
nnoremap <Leader>n :%s/\(<c-r>=expand("<cword>")<CR>\)/

" === Make it easier to run js files inside vim ===
nnoremap <Leader>js :!node %<CR>

" === open and close location list ===
nnoremap <Leader>o :lopen<CR>
nnoremap <Leader>oo :lclose<CR>

" === open and close quickfix ===
nnoremap <Leader>q :copen<CR>
nnoremap <Leader>qq :cclose<CR>

" === Set paste so paste works properly ===
nnoremap <Leader>p "*p

" === qq to record, Q to replay (recursive map due to peekaboo) ===
nmap Q @q

" run commands through neovim term instead of :!
nnoremap <Leader>r :sp<CR> :te<SPACE>

" === Source (reload) your vimrc ===
command! ReloadVimrc source $MYVIMRC

" === Make it easier to run ruby files inside vim ===
nnoremap <Leader>ru :!ruby -w %<CR>

" === Edit the db/schema.rb Rails file in a split ===
nnoremap <Leader>sc :split db/schema.rb<CR>

" === Show syntax highlighting groups for word under cursor, useful for editing
" colorschemes (from @drewneil) ===
nnoremap <Leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), "synIDattr(v:val, 'name')")
endfunc

" === map visual-block to v ===
nnoremap v <c-v>e

" === Pre-populate a split command with the current directory ===
nnoremap <Leader>v :new <C-r>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <Leader>vn :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<CR>

" === Open vimrc in new tab ===
nnoremap <Leader>vi :tabe ~/dotfiles/vimrc<CR>

" === Code notes ===
nnoremap <Leader>ww :Files ~/dotfiles/laptop/vim_notes/<CR>
nnoremap <Leader>wt :Sexplore ~/dotfiles/laptop/vim_notes/<CR>

" === New Split Windows ===
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wh :split<CR>

" === Run vimscript functions ===
nnoremap <Leader>x :exec getline(".")<CR>

" === Yank to end of line instead of whole line (from @geoffharcourt) ===
nnoremap Y y$

" === Make yank behave like yank should ===
vnoremap <expr>y "my\"" . v:register . "y`y"

" === Open folds easily ===
nnoremap , za

" === Get z commands in visual mode
xnoremap zz :normal zz<CR>
xnoremap zt :normal zt<CR>
xnoremap zb :normal zb<CR>

" === this has to come late in order to work (from @geoffharcourt) ===
highlight Comment cterm=italic gui=italic
