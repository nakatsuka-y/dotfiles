" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

""""""""""""""""""""""""""""""
" NeoBundle Scripts
""""""""""""""""""""""""""""""
" If you cloned vimfile from Github to another machine, be sure to remove all
" the contents of the bundle file and clone NeoBundle from NeoBundle site.
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim' "select using SHIFT+V and comment out with Ctrl+-
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace' "use ':FixWhitespace' to automatically delete unwanted spaces
<<<<<<< HEAD
NeoBundle 'powerline/powerline',{'rtp': 'powerline/bindings/vim/'}
NeoBundle 'scrooloose/syntastic'
=======
>>>>>>> new-master
NeoBundle 'fatih/vim-go.git' "Go development plugin

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Settings for Unite.vim
""""""""""""""""""""""""""""""
" start with input mode
let g:unite_enable_start_insert=1
" show all buffers
noremap <C-P> :Unite buffer<CR>
" show all files
noremap <C-N> :Unite -buffer-name=file file<CR>
" show all recent files
noremap <C-Z> :Unite file_mru<CR>
" set 'sources' to the now opened directory
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" open window horizonally split
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" open window vertically split
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" escape by pressing pressing ESC key two times
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Settings for vim
""""""""""""""""""""""""""""""
set shell=/bin/bash
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set autoindent          " Automatically inherit previous indent
set smartindent         " Change indent depending on previous line
set number              " Show line number
set title               " Show file name in title
set wildmenu            " Do file name completion in command mode
set hlsearch            " Highlight search result
set whichwrap=b,s,h,l,<,>,[,] " Stop cursor from stopping at line beginnings and endings

"hightlight LineNr ctermfg=darkyellow " Set line number color

let mapleader = "," " Set leader to comma
map <Leader>f <C-f>
map <Leader>b <C-b>
map <Leader>w :w<Return>
map <Leader>q :q<Return>
"imap <Space>n <C-n>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set colorscheme
"colorscheme solarized
colorscheme desert
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Settings for Omnifunction
""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" Automatically start vim-indent-guides at beginning
let g:indent_guides_enable_on_vim_startup=1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" C++ Omnicompletion
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_SelectFirstItem = 1
set completeopt=menuone,menu,longest
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Settings for Syntastic
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Settings for NeoComplete
""""""""""""""""""""""""""""""
"let g:acp_enableAtStartup=0
"let g:neocomplete#enable_at_startup=1
"let g:neocomplete#enable_smart_case=1
"" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 0
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#sources#dictionary#dictionaries = {
"	\ 'default' : '',
"	\ 'vimshell' : $HOME.'/.vimshell_hist',
"	\ 'scheme' : $HOME.'/.gosh_completions'
"	\}
"" <CR>: close popup and save indent.
"inoremap <expr><C-r> neocomplete#cancel_popup()
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Comments
""""""""""""""""""""""""""""""
" In order to access the system clipboard through terminal vim, I am using
" gvim which has +x11-clipboard. In order to copy to the system clipboard,
" type: '"+y', and you are good. To paste, type: '"+gp'.
""""""""""""""""""""""""""""""
