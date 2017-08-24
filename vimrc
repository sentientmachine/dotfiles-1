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

" === colorscheme(s) ===
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'

" === completion ===
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'fishbullet/deoplete-ruby'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-vim'
Plug 'ternjs/tern_for_vim'
Plug 'ujihisa/neco-look'
Plug 'wokalski/autocomplete-flow'
Plug 'zchee/deoplete-zsh'

" === experiments ===
if has('nvim')
  Plug 'floobits/floobits-neovim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'scrooloose/nerdtree'

" === git ===
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" === language plugins ===
Plug 'c-brenn/phoenix.vim'

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
Plug 'elixir-lang/vim-elixir'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'wlangstroth/vim-racket'

" === linting ===
Plug 'w0rp/ale'

" === make editing nicer ===
Plug 'derekprior/vim-trimmer'
Plug 'janko-m/vim-test'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'pbrisbin/vim-mkdir'
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
Plug 'vim-scripts/tComment'
Plug 'mbbill/undotree'

" === move ===
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'
Plug 'yuttie/comfortable-motion.vim'

" === other ===
Plug 'alvan/vim-closetag'
Plug 'beloglazov/vim-online-thesaurus'
UnPlug 'chrisbra/Colorizer'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

" === search ===
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'

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
colorscheme base16-ashes
set complete+=kspell " Set the matches for Insert mode completion.
set diffopt+=vertical " Start diff mode with vertical splits
set expandtab " Use the appropriate number of spaces to insert a <Tab>.
filetype plugin indent on " load indent file for language
set gdefault " Replace all matches on a line instead of just the first
set guicursor+=a:blinkon0 " Disable blinking cursor on nvim
set history=50 " remember the last 50 command-lines in the history table
set hlsearch " highlight search results
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
set incsearch " do incremental searching
set ignorecase " case insensitive pattern matching
if has('nvim')
  set inccommand=split " this is necessary for using this %s with a quickfix window in nvim
  set termguicolors " nvim gui colors / disabled for now cause Gruvbox looks better without it
endif
let g:is_posix=1 " When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.
set laststatus=2 " Always display the status line
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
set relativenumber " Show the line number relative to the line with the cursor in front of each line.
augroup numbers " Get the best of both worlds with set number and relativenumber
  autocmd!
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END
set ruler " show the cursor position all the time
runtime! macros/matchit.vim " Extended matching with '%'. See :help matchit
set scrolloff=5 " show 5 lines above and below cursor
scriptencoding utf-8 " Specify the character encoding used in the script.
set shiftround " Round indent to multiple of 'shiftwidth'.
set shiftwidth=2 " Returns the effective value of 'shiftwidth'
set showcmd " display incomplete commands
set smartcase " overrides ignorecase if pattern contains upcase
set spellfile=$HOME/.vim-spell-en.utf-8.add " Name of the word list file where words are added for the |zg| and |zw| commands.
set spelllang=en_us " Set region to US English
set splitbelow " When on, splitting a window will put the new window below the current one.
set splitright " When on, splitting a window will put the new window right of the current one.
syntax on " Turn on syntax highlighting.
set tabstop=2 " Number of spaces that a <Tab> in the file counts for.
set textwidth=80 " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
set ttimeout " determine the behavior when part of a key code sequence has been received by the terminal UI.
set undodir=$HOME/.undodir " directory name for undo file.
set undofile " Automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
set wildignore+=tmp/** " Ignore stuff that can't be opened
set wildmenu " Enables a menu at the bottom of the vim window.
set wildmode=list:longest,list:full
set winwidth=84 " Window size
set winheight=10
set winminheight=5

" checks if a file was updated elsewhere like package.json/Gemfile.lock and
" reflects changes automatically while viewing file
augroup checkt
  autocmd!
  autocmd CursorHold * call Timer()
  function! Timer()
    checktime
    call feedkeys("f\e")
  endfunction
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
  if !exists(':Ag')
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

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

" === vim-airline ===
" let g:airline_theme = 'gotham'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_error = '%{ale#statusline#Status()}'
let g:airline_section_z = '%#__accent_bold#%l%#__restore__#:%c'

" === ale ===
let g:ale_linters = {
      \ 'javascript': ['flow', 'eslint', 'prettier-eslint', 'standard'],
      \ 'html': ['eslint', 'prettier-eslint', 'flow', 'tidy', 'htmlhint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'ruby': ['rubocop', 'reek'],
      \ 'text': ['vale']
      \ }

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --tab-width 2 --print-width 120 --parser flow'
nnoremap <Leader>fix :ALEFix<CR>

let g:ale_set_quickfix = 0
let g:ale_statusline_format = ['✕ %d', '△ %d', '=_=']
let g:ale_sign_warning = '△'
let g:ale_sign_error = '✕'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s'
augroup alesettings
  autocmd!
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd BufEnter * set conceallevel=0
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
  autocmd TextChanged * call ale#Lint()
augroup END

" === auto-pairs ===
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap ( ()<Esc>i

" === vim-closetag ===
let g:closetag_filenames = '*.html,*.erb,*.jsx,*.js'

" === colorizer ===
let g:colorizer_auto_filetype='sass,scss,css,html,slim,haml'

" === comfortable-motion.vim ===
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" === deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#disable_auto_complete = 1 " only show comp menu on <tab>
let g:deoplete#max_list = 5

" === deoplete ternjs/tern_for_vim ===
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [
                \ 'js',
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'html'
                \ ]

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" === dispatch.vim ===
let g:rspec_command = 'Dispatch rspec {spec}'

" === fugitive ===
nnoremap <Leader>g :Git<SPACE>

" === fzf.vim ===
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-t> :Tags<CR>
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>c :Commits<CR>
nnoremap <Leader>old :History<CR>
" grep the word under the cursor, select it, and then drop it into a quickfix window
nnoremap \\ :Ag <C-r><C-w><CR><C-a><CR>

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

" Narrow ag results within vim; CTRL-A to select all matches and list them in quickfix window
function! s:ag_to_qf(line)
  let l:parts = split(a:line, ':')
  return {'filename': l:parts[0], 'lnum': l:parts[1], 'col': l:parts[2],
        \ 'text': join(l:parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let l:cmd = get({'ctrl-x': 'split',
        \ 'ctrl-v': 'vertical split',
        \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let l:list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let l:first = l:list[0]
  execute l:cmd escape(l:first.filename, ' %#\')
  execute l:first.lnum
  execute 'normal!' l:first.col.'|zz'

  if len(l:list) > 1
    call setqflist(l:list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
      \ 'source':  printf('ag --nogroup --column --color "%s"',
      \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
      \ 'sink*':    function('<sid>ag_handler'),
      \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
      \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
      \            '--color hl:68,hl+:110',
      \ 'down':    '50%'
      \ })

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-x><C-i> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')

" Ripgrep
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" === vim-gitgutter ===
let g:gitgutter_signs = 0

" === goyo.vim/limelight.vim ===
augroup goyolimelight " Integrate limelight and goyo
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" === vim-jsx ===
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" === LanguageClient-neovim ===
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript.jsx': ['/usr/local/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

let g:LanguageClient_autoStart = 1 " Automatically start language servers.

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" === vim-markdown ===
let g:markdown_fenced_languages = ['html', 'ruby', 'bash=sh', 'javascript', 'css', 'sql', 'vim']

" === nerdtreee ===
let g:NERDTreeWinSize=20
function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
        execute ':NERDTreeFind'
    endif
endfunction
nnoremap - :call ToggleNERDTreeFind()<CR>^

" === netrw ===
let g:loaded_netrwPlugin = 1
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_dirhistmax = 0
" nnoremap - :Lexplore<CR>
" nnoremap _ :Lexplore!<CR>

" === omnicompletion ===
filetype plugin on
set completeopt=menu,preview " Shows menu and any additional tips

" === rainbow_parentheses ===
augroup rainbow
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup END
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#max_level = 16

" === vim-seeing-is-believing ===
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END

" === vim-sneak ===
let g:sneak#s_next = 1
let g:sneak#label = 1

" === vim-test ===
let g:test#strategy = 'dispatch'
" this rspec command is SpreeCommerce specific. Don't copy unless you need to
let g:test#ruby#rspec#executable = 'SPEC_ALL=true bundle exec rspec'
if has('nvim')
  let g:test#strategy = 'neovim' " open vim-test in neovim terminal if using neovim
endif

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
" nnoremap <silent> <c-\> :TmuxNavigatePrevious<CR> TODO: fix this
let g:tmux_navigator_no_mappings = 1 " do nay let the plugin set the mappings
let g:tmux_navigator_save_on_switch = 2 " Save on switch

" === undotree===
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

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
imap <C-a> <Home>
imap <C-e> <End>
nnoremap <C-w> db
imap <C-n> <Down>
imap <C-p> <Up>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-k> <C-o>D

" === Require pry (from @christoomey) ===
nnoremap <Leader>b orequire 'pry'; binding.pry<esc>^

" === Let's stop typing ':Bundle' ===
nnoremap <Leader>bu :Bundle<CR>

" === map <ctrl>c to quit ===
nnoremap <C-c> :x<CR>

" === Copy the entire buffer into the system register (from @R00k) ===
nnoremap <Leader>co mmggVG"*y`m

" === Run them migrations ===
nnoremap <Leader>dm :! rails db:migrate<CR>

" === Try for a better gJ ===
nnoremap gj gJ<BS>

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
tnoremap jk <C-\><C-n>
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
nnoremap <Leader>low O// @flow<Esc>^

" === make n N nicer ===
function! s:nice_next(cmd)
  let l:view = winsaveview()
  execute 'normal! ' . a:cmd
  if l:view.topline != winsaveview().topline
    normal! zz
  endif
endfunction
nnoremap <silent> n :call <SID>nice_next('n')<CR>
nnoremap <silent> N :call <SID>nice_next('N')<CR>

" === sed it up ===
nnoremap <Leader>n :%s/\(<c-r>=expand("<cword>")<CR>\)/

" === open and close location list ===
nnoremap <Leader>o :lopen<CR>
nnoremap <Leader>oo :lclose<CR>

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

" === Get z commands in visual mode
xnoremap zz :normal zz<CR>
xnoremap zt :normal zt<CR>
xnoremap zb :normal zb<CR>

" === this has to come late in order to work (from @geoffharcourt) ===
highlight Comment cterm=italic gui=italic
