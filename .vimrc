" My .vimrc

if !has("gui_win32")
	source /etc/vimrc
endif
" Notes "{{{
"
" * This file consists of "sections".
" 	- The first character of the name of each sections should be Capital.
"
" * Each sections have zero or more "subsections".
" FIXME: add notations. cf.kana's dot.vim (~/Desktop/kana*/)
"
" * Key Notation: 
" 	- Contol-keys: Write as <C-x>, neither <C-X> nor <c-x>.
" 		- See |<>|.
" }}}

"" Miscellaneous settings {{{
set modelines=5
	"+ check modeline from top or bottom of text

set nocompatible
	"+ Set off (that is set nocompatible) automatically when $MYVIMRC.

set viminfo='100,<50,s10,h
"set viminfo='100,<50,s10,h,%,/50,c,f0,@50,:50,%

set wildmenu
set sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize"
set autoread
	"+ When detection to have been changed outside of Vim, read it automatically
set hidden
	"+ traverse between the buffers without :w
set esckeys
	"+ required to be able to use keypad keys and map missed escape sequences
set backspace=indent,eol,start
	"+ allow BSing over everything in insert mode
set softtabstop=0
"set textwidth=78
set textwidth=0
	"+ don't wrap
set ignorecase
set smartcase
set showmatch
	"+ show matching brackets
set shortmess=aoOtTI
	"+ default value is "filnxtToO"
filetype plugin on

"}}}

"" Filetype plugin (indentation) settings {{{
"filetype plugin indent on
	"+ :help :filetype-overview

"}}}
"" Highlight syntax settings {{{
syntax enable
	"+ enable syntax highlighting
syntax on

"}}}
"" winopen when quickfix is updated {{{
	""+ (See http://d.hatena.ne.jp/h_east/20090205/1233822692)
"autocmd QuickfixCmdPost [^l]* copen 3
"autocmd QuickfixCmdPost l* lopen 3

"}}}

"" [Look and feel]
"" Appear blanks {{{
"set list
	"+ show visibly tab, end of line, wrap line...

"set listchars=tab:>.,eol:$,trail:_,extends:\
set listchars=tab:\ \ ,eol:$,trail:_,extends:\
	"+ 'set listchars' is setting for 'set list'

"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
"au BufRead,BufNew * match JpSpace /　/
	"+ Following two settings bring 全角の空白 into sight
	"+ (See http://d.hatena.ne.jp/studio-m/20080117/1200552387)

"}}}
"" Indent options {{{
filetype indent off
set shiftwidth=8
"set expandtab
"set shiftround
	"+ width when using '>>' or '<<'
set tabstop=8
set softtabstop=0
set noautoindent
set nocindent
set nosmartindent
set nosmarttab

"}}}
"" Indent options.2 (See 'filetype indent on') {{{
"autocmd FileType * setl formatoptions-=r
	"+ don't continue comment line automatically
"autocmd FileType * setl formatoptions-=o
	"+ don't continue comment line automatically

"}}}
"" Behavior on folding block {{{
"set foldmethod=indent

"}}}
"" Appearance of the status line {{{
set laststatus=2
	"+ always show status line
set modeline
	"+ enable mode line.
set ruler
	"+ show cursor line and column
set showcmd
	"+ show command inputing in status line
set showmode
	"+ display mode INSERT/REPLACE/...
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
	"+ Comment out 'cause using buftab.
	"+ show character code and return character in status line


"}}}
"" Highlight the current line {{{
autocmd WinEnter *	setlocal cursorline
autocmd WinLeave *	setlocal nocursorline

"}}}
"" Settings about help {{{
" See 'map K'
"set keywordprg=man\ -S\ 3p\ -P\ \'lv\ -c\'	"See :h index.txt /|K|
"set keywordprg=":tab man -S 3p -P lv -c'"	"See :h index.txt /|K|

"}}}

"" [keymap]
"" The prefix key (See http://vim-users.jp/2009/08/hack-59/) {{{
nnoremap	[Tag]	<Nop>
nmap		,		[Tag]

"}}}
"" Recenter as searching word {{{
"set scrolloff=999		"recenter (almost same as :zz)
set scrolloff=2
"nmap <silent>	n	nzz<CR>
"nmap <silent>	N	Nzz<CR>
"nmap <silent>	*	*zz<CR>
"nmap <silent>	#	#zz<CR>
"nmap <silent>	g*	g*zz<CR>
"nmap <silent>	g#	g#zz<CR>

"}}}
"" Move between buffers or tabs or windows {{{
nnoremap <silent>	<Space>		:bn<CR>
nnoremap <silent>	<BS>		:bp<CR>
"nnoremap <silent>	<S-Space>	:bp<CR>
"nnoremap <silent>	<Bslash>	:bp<CR>
nnoremap <silent>	<C-p>		:tabp<CR>
nnoremap <silent>	<C-n>		:tabn<CR>
nnoremap <silent>	<C-h>		<C-w>h
nnoremap <silent>	<C-l>		<C-w>l
nnoremap <silent>	<C-j>		<C-w>j
nnoremap <silent>	<C-k>		<C-w>k

"}}}
"" In Command-Line mode, map C-a and C-e as emacs {{{
cnoremap <silent>	<C-a>		<Home>
cnoremap <silent>	<C-e>		<End>
cnoremap <silent>	<C-f>		<Right>
cnoremap <silent>	<C-b>		<Left>
"cnoremap <silent>	<C-d>		<Del>

"}}}
"" Resize windows easily {{{
nnoremap <silent>	<Up>		<C-w>+
nnoremap <silent>	<Down>		<C-w>-
nnoremap <silent>	<Left>		<C-w><
nnoremap <silent>	<Right>		<C-w>>

"}}}
"" Switch :hls, :noh when leaving Lang-Arg mode(See :lmap @Lang-Arg) {{{
"ln

"}}}
"" Reread this buffer with changing fileenconding type {{{
noremap <silent>	<F2>		:edit ++ff=dos ++enc=shift_jis<CR>
noremap <silent>	<F3>		:edit ++ff=unix ++enc=2byte-utf-8<CR>

"}}}
"" List buffers {{{
noremap <silent>	[Tag],	:ls<CR>

"}}}
"" Delete buffer {{{
"no <silent>		<Leader>d	:bd<CR>
noremap <silent>	[Tag]d	:<C-u>bd<CR>

"}}}
"" For ChangeLog {{{
noremap <silent>	<F5>	<Esc>O<Esc>"=strftime('%Y-%m-%dT%H:%M:%S')
								\ <CR>p$a:<Esc>o<Esc>:.!basename `pwd`
								\ <CR>kJo<TAB>* 
	"+ TODO: don't use !basename, but getcwd() to get directory name 

"}}}
"" For update/reload vimrc {{{
nnoremap	[Tag]s	:source $MYVIMRC<CR>
nnoremap	[Tag]v	:edit $MYVIMRC<CR>

"}}}
"" :help under the cursor (See WEB+DB PRESS vol.52, p68) {{{
nnoremap <silent>	<C-h>	:<C-u>help<Space><C-r><C-w><CR>

"}}}
"" Select last changed text-objects (See WEB+DB PRESS vol.52, p70) {{{
nnoremap	gc		`[v`]
vnoremap	gc		:<C-u>normal gc<CR>
onoremap	gc		:<C-u>normal gc<CR>

"}}}
"" Templete {{{
"au BufNewFile *.c		0r ~/.vim/skel/skeleton.c
"	\ |exe 'normal! G"_dd'
"	\ |exe cursor(1,1,0)
"	\ |exe search('//plz code')
autocmd BufNewFile *.html
	\ 0r ~/.vim/skel/skeleton.html
	\ |exe 'normal! G"_dd'|call cursor(1,1,0)
	\ |call search('//EDITSECTION')
autocmd BufNewFile *.c
	\ 1r ~/.vim/skel/skeleton.c
	\ |1 delete _
	\ |call search('//plz code')
autocmd BufNewFile Makefile	0r ~/.vim/skel/skeleton.Makefile|normal! 11G$
autocmd BufNewFile *.pl		0r ~/.vim/skel/skeleton.pl|normal! G
"au BufWinEnter *.c	

"}}}

"" [plugin settings] (built-in, external command, own supplement)
"" changelog {{{
	"+ Need to work |changelog.vim|.
	"+ Press '<Leader>o' when filetype is changelog, insert 
	"  changelog_new_date_formatchangelog (See :help ft-changelog-plugin)
let g:changelog_new_date_format = "%d  %u\n\t* %c\n\n"
	"+ set changelog format above.
	"+ must do 'filetype plugin on' to enable this format. 

"}}}
"" dirtags(ctags) {{{
	"+ must install ctags in your system
if !has("gui_win32")
	nn <silent>		[Tag]t			:!(cd %:p:h;ctags *.[ch])&<cr>
	nn <silent>		[Tag]x			:!(gcc -Wall -I$HOME/include %:p) 2>&1<cr>
		"+ TODO: want to display in :clist by using tmpname()
	nn <silent>		[Tag]X			:!(g++ -Wall %:p) 2>&1<cr>
endif

"}}}

"" [plugin settings] (local-addition)
"" manpageview.vim {{{
let g:manpageview_options="-S 3p"
"nnoremap <silent>		K 			:Man <cword>
"let g:manpageview_winopen="reuse"
"let g:manpageview_options=""
""runtime ftplugin/man.vim
""let $PAGER=''
""let $PAGER='lv -c'
""let MANPAGER='lv -c'

"}}}
"" yankring.vim {{{
"nn <silent>	,y	:YRShow<CR>
"nun <silent>	<C-P>

"}}}
"" buftabs.vim {{{
set laststatus=2				"always show status line
let g:buftabs_only_basename=1	"show only basename (not './path/basename')
let g:buftabs_in_statusline=1	"show buffer-tab in status line

"}}}
"" mru.vim {{{
if !has("gui_win32")
	"let MRU_File='$HOME/.vim_mru_files	"default
	let MRU_Max_Entries=20			"history size
	let MRU_Exclude_Files='^/tmp/.*\|^/var/tmp/.*'
endif

"}}}
"" vim-Arpeggio {{{
call arpeggio#load()
let g:arpeggio_timeoutlen=40		"default
Arpeggio noremap!	jk	<Esc>

"function! s:Toggle_option_number()	"not use 's:'
function! Toggle_option_number()
	if &number == 0
		setlocal number
	else
		setlocal nonumber
	endif
endfunction
Arpeggio noremap	sn	:call Toggle_option_number()<CR>

"}}}
"" howm-mode.vim {{{
"set runtimepath+=~/.howm_vim
"let g:howm_dir = '~/.howm/'
"let g:howm_grepprg = '/usr/bin/grep'
"let g:howm_findprg = '/usr/bin/find'

"}}}
"" fuzzyfinder.vim {{{
" The prefix key with fuzzyfinder.vim
nnoremap	[FUFTag]	<Nop>
nmap		<C-q>		[FUFTag]
"let g:FuzzyFinderOptions.Base.key_open=<CR>			"default
"let g:FuzzyFinderOptions.Base.key_open_split=<C-j>
nn <silent> [FUFTag]<C-n>      :FuzzyFinderBuffer<CR>
nn <silent> [FUFTag]<C-m>      :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nn <silent> [FUFTag]<C-j>      :FuzzyFinderMruFile<CR>
nn <silent> [FUFTag]<C-k>      :FuzzyFinderMruCmd<CR>
nn <silent> [FUFTag]<C-p>      :FuzzyFinderDir <C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]<CR><CR>
"nn <silent> [FUFTag]<C-d> :FuzzyFinderDir<CR>
"nn <silent> [FUFTag]<C-b>      :FuzzyFinderBookmark<CR>
"nn <silent> [FUFTag]<C-t> :FuzzyFinderTag!<CR>
"nn <silent> [FUFTag]<C-g> :FuzzyFinderTaggedFile<CR>
no  <silent> g]         :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>
"nn <silent> [FUFTag]b     :FuzzyFinderAddBookmark<CR>
"nn <silent> [FUFTag]<C-e> :FuzzyFinderEditInfo<CR>

"}}}
"" taglist.vim {{{
nnoremap <silent>	[Tag]<C-t>	:TlistToggle<CR>
"let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1

"}}}


"" [TODO: memo]
"au FileType * set formatoptions-=r	"don't continue comment line automatically
"au FileType * set formatoptions-=o	"don't continue comment line automatically
"set formatoptions-=r		"don't continue comment line automatically
"set formatoptions-=o		"don't continue comment line automatically


" END {{{
" vim: tw=0:sts=0:ts=4:sw=4
" vim: fdm=marker
" vim: fenc=utf-8:fencs=utf-8,euc-jp
