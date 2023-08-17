" +---------------------------------+
" |             plugins             |
" +---------------------------------+

call plug#begin("$XDG_DATA_HOME/nvim/plugged")

" +------------------+
" |     snippets     |
" +------------------+

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

" +------------------+
" |      general     |
" +------------------+

Plug 'simnalamburt/vim-mundo' "Undo tree visualizer
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
" Plug 'tpope/vim-dispatch' " aynchronous build & test dispatcher
" Plug 'preservim/nerdtree'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting

" +------------------+
" |    functional    |
" +------------------+

" Plug 'Valloric/YouCompleteMe'  " Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'moll/vim-bbye' " delete buffer without close window
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'andymass/vim-matchup' " Match more stuff with %
Plug 'junegunn/vim-easy-align' " Alignment
Plug 'ervandew/supertab' " Multiuse tab

" +------------------+
" |      visual      |
" +------------------+

Plug 'ghifarit53/tokyonight-vim'
Plug 'psliwka/vim-smoothie' " smooth kb scroll
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'Yggdroot/indentLine' " tab distinction
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Airline themes

" +------------------+
" |       tmux       |
" +------------------+

Plug 'tmux-plugins/vim-tmux' | Plug 'tmux-plugins/vim-tmux-focus-events' " syntax highlighting for tmux.conf + other cool options
Plug 'christoomey/vim-tmux-navigator' " seemless navigation between vim windows / tmux pane
Plug 'wellle/tmux-complete.vim' " Omni-completion from tmux pane

" +------------------+
" |       fzf        |
" +------------------+

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" +------------------+
" |       git        |
" +------------------+

Plug 'tpope/vim-fugitive' "wrapper for git
" Plug 'airblade/vim-gitgutter' "  display git diff in the left gutter
Plug 'rhysd/conflict-marker.vim' " Mark conflict

" +------------------+
" |   competitive    |
" |    programming   |
" +------------------+

Plug 'searleser97/cpbooster.vim'

" +------------------+
" |     writing      |
" +------------------+

Plug 'godlygeek/tabular' " Align stuff (useful for markdown tables for example)
Plug 'rhysd/vim-grammarous', { 'for': 'markdown' } " Show grammar mistakes
Plug 'reedes/vim-wordy' " Verify quality of writting (see :Wordy)
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" +------------------+
" |       lsp        |
" +------------------+

" Plug 'neovim/nvim-lspconfig'

" +------------------+
" |     debugger     |
" +------------------+

Plug 'puremourning/vimspector' "Multi language debugger

" +------------------+
" |       csv        |
" +------------------+

" Format CSV automatically
Plug 'chrisbra/csv.vim'

" +------------------+
" |    vim script    |
" +------------------+

Plug 'tpope/vim-scriptease' " Debug vimscripts

call plug#end()
