" ###                                            ###
" ### KONFIGURATIONSDATEI AUS UBUNTU UEBERNOMMEN ###
" ###                                            ###
"
"All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Highlight expression searched for
set hlsearch

" Show line numbers
set number

" No smart indent
"set nosmartindent
" cindent for c-like programs
set cindent
" cindent one tab only
set cinoptions=>4

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set matchtime=3		" make it a quick blink
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" LilyPond syntax highlighting for vim
set runtimepath+=/usr/share/lilypond/2.10.33/vim/

" Set width of indent for TAB
set tabstop=4
set shiftwidth=4
" expand tabs to spaces
set expandtab
" Set automatic indent
set ai

"set makeprg=javac\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#


" Some things for vim-latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Schalte Mausbedienung fuer alle Modi ein
"set mouse=a

" Erkenne *.pl-Dateien als Prolog statt Perl
"autocmd BufEnter *.pl	set filetype=prolog

" VHDL-Veraenderungen
autocmd BufEnter *.vhd set tabstop=2 expandtab shiftwidth=2
autocmd BufEnter *.vhdl set tabstop=2 expandtab shiftwidth=2

" ignore case during search
" (abschalten: set noic)
set ic

" when end is reached: continue wordcompletion at beginning of file
set wrapscan

" Ctrl-j/k deletes blank line below/above, and Ctrl-h/l inserts.
" See http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-h> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-l> :set paste<CR>m`O<Esc>``:set nopaste<CR>

