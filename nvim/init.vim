if !1 | finish | endif

augroup vimrc
    autocmd!
augroup END

" +------------------+
" |    leader key    |
" +------------------+

nnoremap <SPACE> <Nop>
let mapleader = " "

set termguicolors

" +------------------+
" |  install plugin  |
" +------------------+

" Source plugin definition file
source $XDG_CONFIG_HOME/nvim/init_plugins.vim

" source every plugin configs
for file in split(glob('$XDG_DATA_HOME/nvim/pluggedconf/*.nvimrc'), '\n')
    execute 'source' file
endfor

" +------------------+
" |       lua        |
" +------------------+

" lua require('basic')

" Visual
let g:tokyonight_enable_italic = 1
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1
colorscheme tokyonight

" +------------------+
" |      mappings    |
" +------------------+

" Escape
inoremap jk <Esc>
tnoremap jk <C-\><C-n>
" Word wrap
nnoremap <leader>ww :set wrap!<CR>
" Open term in new window
nnoremap <Leader>te <C-w>s :term<cr>

" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tl :tablast<CR>

" Windows
nnoremap <leader>w <C-w>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <left> :vertical resize -1<cr>
nnoremap <right> :vertical resize +1<cr>
nnoremap <up> :resize +1<cr>
nnoremap <down> :resize -1<cr>

" Autoclose 
inoremap {<cr> {<cr>}<C-o>O

" FZF
nnoremap <leader>f :FZF<cr>

" CP
nnoremap <leader>bs :Submit<cr>
nnoremap <leader>bt :Test<cr>
nnoremap <leader>bd :Debug<cr>
nnoremap <leader>ba :Addtc<cr>

" +------------------+
" |    competitive   |
" |    programming   |
" +------------------+

noremap <F1> <ESC>:tabprev <CR>
vnoremap <F1> <ESC>:tabprev <CR>
 
noremap <F3> <ESC> :w <CR> :make <CR>
inoremap <F3> <ESC> :w <CR> :make <CR>
 
noremap <F6> <ESC> :w !python3 <CR>
 
noremap <F7> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -O2 -o %<.out % && ./%<.out < %<.in<CR>
inoremap <F7> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -O2 -o "%<.out" "%" && "./%<.out" < %<.in<CR>
 
noremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -O2 -o %< % && ./%< < inp<CR>
inoremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -O2 -o "%<" "%" && "./%<" < inp<CR>
 
noremap <F9> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -Wall -Wextra -Wshadow -DDEBUG -O3 -o %< % && ./%< <CR>
inoremap <F9> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -Wall -Wextra -Wshadow -DDEBUG -O3 -o %< % && ./%< <CR>
 
noremap <F10> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -Wall -Wextra -Wshadow -DDEBUG -O3 -o %< % && ./%< < inp<CR>
inoremap <F10> <ESC> :w <CR> :!g++ -std=c++17 -fsanitize=address -Wall -Wextra -Wshadow -DDEBUG -O3 -o "%<" "%" && "./%<" < inp<CR>

" +------------------+
" |      autocmd     |
" +------------------+
" restore the position of the last cursor when you open a file
" autocmd vimrc BufReadPost * call general#RestorePosition()
" delete trailing space when saving files
" autocmd vimrc BufWrite *.md,*.cpp,*.py,*.html,*.css,*.js,*.jsx,*.vue,*.twig,*.sh,*.yaml,*.yml,*.vim,*.lua call general#DeleteTrailingWS()
" Toggle relative number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" configure tab spaces for html
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" support for jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=0
endif

" +------------------+
" |     commands     |
" +------------------+

command CDC cd %:p:h " change directory to current file

" +------------------+
" |       CoC        |
" +------------------+

 let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-emmet', 'coc-jedi', 'coc-webview', 'coc-markdown-preview-enhanced']
 
 Use tab for trigger completion with characters ahead and navigate.
 inoremap <silent><expr> <TAB>
       \ coc#pum#visible() ? coc#pum#next(1) :
       \ CheckBackspace() ? "\<Tab>" :
       \ coc#refresh()
 inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
 
 inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"
 inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 GoTo code navigation.
 nnoremap <silent> gd <Plug>(coc-definition)
 nnoremap <silent> gD <Plug>(coc-type-definition)
 nnoremap <silent> gi <Plug>(coc-implementation)
 nnoremap <silent> gr <Plug>(coc-references)

 Use K to show documentation in preview window.
 nnoremap <silent> K :call ShowDocumentation()<CR>

 Highlight the symbol and its references when holding the cursor.
 autocmd CursorHold * silent call CocActionAsync('highlight')

 Symbol renaming.
 nmap <leader>rn <Plug>(coc-rename)
 
 function! ShowDocumentation()
   if CocAction('hasProvider', 'hover')
     call CocActionAsync('doHover')
   else
     call feedkeys('K', 'in')
   endif
 endfunction

 Highlight the symbol and its references when holding the cursor.
 autocmd CursorHold * silent call CocActionAsync('highlight')

 use <tab> for trigger completion and navigate to the next complete item
 function! CheckBackspace() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

 inoremap <silent><expr> <C-n><Tab>
       \ coc#pum#visible() ? coc#pum#next(1) :
       \ CheckBackspace() ? "\<C-n><Tab>" :
       \ coc#refresh()
 
 " Mappings for CoCList
 " Show all diagnostics.
 nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
 " Manage extensions.
 nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
 " Show commands.
 nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
 " Find symbol of current document.
 nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
 " Search workspace symbols.
 nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
 " Do default action for next item.
 nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
 " Do default action for previous item.
 nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
 " Resume latest coc list.
 nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

" +------------------+
" |     prettier     |
" +------------------+

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

" +------------------+
" |     supertab     |
" +------------------+

let g:SuperTabDefaultCompletionType = "<c-n>"

" +------------------+
" |     snippets     |
" +------------------+

" ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit='vertical'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" +------------------+
" |       fzf        |
" +------------------+

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
let g:fzf_preview_window = ['hidden,right,50%,<60(up,40%)', 'ctrl-/']
"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" +------------------+
" |       tmux       |
" +------------------+

let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" +------------------+
" |    easy align    |
" +------------------+

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" +------------------+
" |      wordy       |
" +------------------+

let g:wordy_spell_dir = '$HOME/.wordy'

if !&wildcharm | set wildcharm=<C-z> | endif
execute 'nnoremap <leader>s :Wordy<space>'.nr2char(&wildcharm)

" +------------------+
" |      airline     |
" +------------------+

" theme
let g:airline_theme='deus'
" let g:airline_theme='night_owl'
" let g:airline_theme='bubblegum'
" let g:airline_theme='violet'
" let g:airline_theme='base16'
" let g:airline_base16_improved_contrast = 1
" let g:airline#themes#base16#constant = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" branch integration (fugitive | lawrencium)
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 2
let g:airline#extensions#branch#vcs_checks = ['untracked', 'dirty']
let g:airline#extensions#hunks#enabled = 1

" csv integration
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

" fzf integration
let g:airline#extensions#fzf#enabled = 1

" transparency
augroup transparentTabFill
	autocmd!
    autocmd User AirlineAfterInit highlight airline_tabfill ctermbg=NONE guibg=NONE
	" autocmd SourcePost * highlight airline_c ctermbg=NONE guibg=NONE
augroup END

" YCM completion selection
" let g:ycm_key_list_select_completion=['<C-j>']
" let g:ycm_key_list_previous_completion=['<C-k>']

" +------------------+
" |      setters     |
" +------------------+
" copy to OS's clipboard
set clipboard+=unnamedplus
" editing a file from multiple sources
set noswapfile
" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
" indentation
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Show substitution
set inccommand=nosplit

set nocompatible
set bs=2		      " allow backspacing over everything in insert mode
set number
set hidden
set nowrap
set nopaste
set relativenumber
set smarttab
set smartindent
set autoindent
set autoread
set cin
set ignorecase
set smartcase
set incsearch
set smarttab
set mouse=a
set nohls
set shortmess+=c
set encoding=UTF-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
