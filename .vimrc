" My .vimrc
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
" * Fuction name: 
"	- underscore separated (like GNU): Write as Toggle_option, not ToggleOption.
" TODO: divide global function name from script local function?
" 
" * augroup name: 
"	- like Java Class: Write as 'ToggleOption', not 'Toggle_option'.
" 
" * command name: 
"	- not specified.
" 
" }}}

if has('unix')
	source /etc/vimrc
endif

filetype plugin on
	"+ set default values (note that order of reading plugin)
	"+ :help :filetype-overview
	"  Note: my autocmd, indent setttings etc. had better describe
	"        below this line.


"" [ScriptLocal Function]
"" boolean s:is_win(void) "{{{
"  * Usage
" 		if s:is_win() && ...
"  * Result
" 		Return TRUE (not zero) if vim is run on windows.
"		Otherwise return FALSE. (See :help variables about TRUE or FALSE)
"  * Reference
"		http://soralabo.net/s/vrcb/s/thinca
function! s:is_win()
	return has('win32') || has('win64')
endfunction

"}}}
"" [Public Function]
"" void Toggle option(string) "{{{
"  * Usage
" 		Toggle_option('number')
"  * Result
" 		Execute :setlocal nonumber when current option 'number' is
"		0 (that is :set number).
"  * Reference
"		http://github.com/kana/config/blob/4d9b8598975fef45d1f71405633332e593b5f848/vim/dot.vimrc#L927
function! Toggle_option(target_opt)
	execute 'setlocal' a:target_opt . '!'
	execute 'setlocal' a:target_opt . '?'
endfunction

"}}}

"" [Character Encoding]
"" Detect character encoding automatically "{{{
"if has('unix')
"	"let &termencoding = &encoding
"		"+ See :help encoding-table
"	"set fileencodings=euc-jp,utf-8,cp932,shift-jis,sjis
"	set fileencodings=utf-8,cp932,shift-jis,sjis,euc-jp
"endif

"}}}

"" [Command]
"" Change fileencoding {{{
" Utf8 and others - :edit with specified 'fileencoding'
	"+ (See kana[http://whileimautomaton.net/]'s vimrc)
command! -bang -bar -complete=file -nargs=? Cp932
\ edit<bang> ++enc=cp932 <args>
command! -bang -bar -complete=file -nargs=? Eucjp
\ edit<bang> ++enc=euc-jp <args>
command! -bang -bar -complete=file -nargs=? Iso2022jp
\ edit<bang> ++enc=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Utf8
\ edit<bang> ++enc=utf-8 <args>
 
command! -bang -bar -complete=file -nargs=? Jis  Iso2022jp<bang> <args>
command! -bang -bar -complete=file -nargs=? Sjis  Cp932<bang> <args>

"}}}


"" [Miscellaneous settings]
"" Modeline {{{
set modeline
	"+ enable mode line.
set modelines=5
	"+ check modeline from top or bottom of text

"}}}
"" Compatibility {{{
set nocompatible
	"+ Set off (that is set nocompatible) automatically when $MYVIMRC.

"}}}
"" Restore/Recovery/Backup or Session"{{{
set viminfo='100,<50,s10,h
"set viminfo='100,<50,s10,h,%,/50,c,f0,@50,:50,%
set sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize"

"}}}
"" Completion"{{{
set wildmenu
set wildchar=<TAB>
set wildmode=full

"}}}
"" Buffer status"{{{
set hidden
	"+ traverse between the buffers without :w
set autoread
	"+ When detection to have been changed outside of Vim, read it automatically

"}}}
"" Window behavior"{{{
set splitbelow
set splitright

"}}}
"" Behavior when the cursor on First/Last character"{{{
set backspace=indent,eol,start
	"+ allow BSing over everything in insert mode
set whichwrap=b,s,<,>,[,]
	"+ allow specified keys (<BS>, <Space>, ...etc.) to move to previout/next
	"  line when the cursor is on the first/last character in the line.

"}}}
"" Indentation"{{{
set softtabstop=0
"set textwidth=78
set textwidth=0
	"+ don't wrap

"}}}
"" Search"{{{
set ignorecase
set smartcase
set showmatch
	"+ show matching brackets/parentheses
set shortmess=aoOtTI
	"+ default value is "filnxtToO"

"}}}
"" Shut up key input"{{{
set esckeys
	"+ required to be able to use keypad keys and map missed escape sequences
set timeout
set nottimeout
set timeoutlen=650
	"+ timeout length when map sequence pressed
set ttimeoutlen=-1

"}}}

"" [Miscellaneous settings.2]
"" :winopen when quickfix is updated {{{
	""+ (See http://d.hatena.ne.jp/h_east/20090205/1233822692)
"augroup NotifyQuickfixChanged
"	autocmd!
"	autocmd QuickfixCmdPost [^l]* copen 3
"	autocmd QuickfixCmdPost l* lopen 3
"augroup END

"}}}
"" :TOhtml {{{
	""+ (See http://vim-users.jp/2009/06/hack23/)
let g:use_xhtml = 1
let g:html_use_css = 1
let g:html_no_pre = 1

"}}}

"" [Help]
"" Language {{{
if s:is_win()
	set helplang=ja,en
else
	set helplang=en
endif

"}}}
"" Behavior on pressing K {{{
" See 'map K'
"set keywordprg=man\ -S\ 3p\ -P\ \'lv\ -c\'	"See :h index.txt /|K|
"set keywordprg=":tab man -S 3p -P lv -c'"	"See :h index.txt /|K|

"}}}


"" [ColorScheme/Highlight syntax]
"" << NOTE >> {{{
	"Not set ':syntax' in this section.

"}}}
"" Color limit {{{
if $TERM ==? 'xterm'
	set t_Co=256
		"+ your system must have 256 palette.
elseif $TERM =~? 'screen.*'
	set t_Co=256
endif
	"+ (See http://vim-users.jp/2009/08/hack64/)

"}}}
"" Colorscheme {{{
if $TERM ==? 'xterm'
	"colorscheme torte
	"colorscheme delek

	"colorscheme inkpot
	colorscheme candycode
		"+ your system must have 256 palette.
elseif $TERM =~? 'screen.*'			" TODO: modify regex
	"colorscheme candycode
		"+ TODO: set colorscheme
endif
	"+ (See http://vim-users.jp/2009/08/hack64/)

"}}}

"" [Look and feel]
"" Highlight syntax settings {{{
syntax enable
	"+ enable syntax highlighting
syntax on

"}}}
"" Appear blanks {{{
"set list
	"+ show visibly tab, end of line, wrap line...

"set listchars=tab:>.,eol:$,trail:_,extends:\
set listchars=tab:\ \ ,eol:$,trail:_,extends:\
	"+ 'set listchars' is setting for 'set list'

scriptencoding euc-jp
	"+ Convert the following lines.
	"+ (from this line to described ':scriptencoding')

"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
"au BufRead,BufNew * match JpSpace /　/
	"+ Following two settings bring 全角の空白 into sight
	"+ (See http://d.hatena.ne.jp/studio-m/20080117/1200552387)
scriptencoding

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
	"+ See http://vim.g.hatena.ne.jp/ka-nacht/20081222/1229926763
	"  Describe after 'filetype plugin indent on'.
	"+ this settings move to 'after/'.
augroup KillEvilIndentaion
	autocmd!
	autocmd FileType * setlocal formatoptions-=r
		"+ don't continue comment line automatically
	autocmd FileType * setlocal formatoptions-=o
		"+ don't continue comment line automatically
augroup END

"}}}
"" Behavior on folding block {{{
set foldenable
"set foldmethod=indent

"}}}
"" Appearance of the status line {{{
set laststatus=2
	"+ always show status line
set ruler
	"+ show cursor line and column
set showcmd
	"+ show command inputing in status line
set showmode
	"+ display mode INSERT/REPLACE/...
"set statusline='['%n']'%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline=%<[%n]\ %f\ %h%r%m[%{&fenc}][%{&ff=='unix'?'LF':&ff=='dos'?'CRLF':'CR'}]\ %=[0x%B]\ %c,%l/%L\ %y
	"+ Comment out 'cause using buftab.
	"+ show character code and return character in status line


"}}}
"" Highlight the current line {{{
augroup HighlightCurrentLine
	autocmd!
	autocmd WinEnter *	setlocal cursorline
	autocmd WinLeave *	setlocal nocursorline
augroup END

"}}}
"" Error format when compile C source {{{
	"+ (See errormarker.vim)
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
set makeprg=LANGUAGE=C\ make

"}}}

"" [keymap]
"" The prefix key {{{
	"+ (See http://vim-users.jp/2009/08/hack-59/)
nnoremap	[Tag]	<Nop>
nmap		,		[Tag]

"}}}
"" Recenter as searching word {{{
"set scrolloff=999		"recenter (almost same as :zz)
set scrolloff=2
"nnoremap <silent>	n	nzz<CR>
"nnoremap <silent>	N	Nzz<CR>
"nnoremap <silent>	*	*zz<CR>
"nnoremap <silent>	#	#zz<CR>
"nnoremap <silent>	g*	g*zz<CR>
"nnoremap <silent>	g#	g#zz<CR>

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
inoremap <silent>	<C-w>		<Esc>

nnoremap <silent>	[Tag]w		<C-w><C-w>

"}}}
"" In Command-Line mode, map C-a and C-e as emacs {{{
cnoremap 			<C-a>		<Home>
cnoremap 			<C-e>		<End>
cnoremap 			<C-f>		<Right>
cnoremap 			<C-b>		<Left>
"cnoremap 			<C-d>		<Del>
	"+ Don't add <silent> or don't redraw.

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
nnoremap <silent> <special>	<F2>		:edit ++ff=dos ++enc=shift_jis<CR>
nnoremap <silent> <special>	<F3>		:edit ++ff=unix ++enc=2byte-utf-8<CR>

"}}}
"" List buffers {{{
nnoremap <silent>	[Tag],	:ls<CR>

"}}}
"" Delete buffer {{{
"no <silent>		<Leader>d	:bd<CR>
nnoremap <silent>	[Tag]d	:<C-u>bd<CR>

"}}}
"" Update buffer {{{
nnoremap 			<Leader><Space>	:<C-u>up<CR>

"}}}
"" Open/Close Quickfix {{{
function! Toggle_open_quickfix(count)
	if &l:buftype ==# 'quickfix'
		cclose
	else
		execute 'copen' (a:count ? a:count : '')
	endif
endfunction

nnoremap <silent>	[Tag]q	:<C-u>call Toggle_open_quickfix(v:count)<CR>

"}}}
"" Compile/Make {{{
	"+ must install ctags in your system
if has('unix')
	nnoremap <silent>	[Tag]x		:!(gcc -Wall -I$HOME/include %:p) 2>&1<CR>
		"+ TODO: want to display in :clist by using tmpname()
	nnoremap <silent>	[Tag]X		:!(g++ -Wall %:p) 2>&1<CR>
	nnoremap <silent>	[Tag]m		:make<CR>
	nnoremap <silent>	[Tag]M		:make -B<CR>
endif

"}}}
"" Open/Close folds (1 level nested) {{{
nnoremap <silent>	[Tag]z			za
nnoremap <silent>	[Tag]<Space>	za

"}}}
"" Close all folds {{{
nnoremap <silent>	[Tag]Z	zM

"}}}
"" Change into base directory of this file {{{
nnoremap <silent>	[Tag]b	:lcd %:h<CR>

command! -bang -bar -nargs=0 CDl cd<bang> %:h
command! -bang -bar -nargs=0 CDL lcd<bang> %:h

"}}}
"" Copy to Clipboard {{{
nnoremap <silent>	[Tag]y	"+y

"}}}
"" For ChangeLog {{{
nnoremap <silent> <special>	<F5>	<Esc>O<Esc>"=strftime('%Y-%m-%dT%H:%M:%S')
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

" do not work following mapping
"nnoremap <silent>	<C-h>	
"		\ :execute "help<Space>\<" . expand('<cword>') . "\><CR>"
"nnoremap <silent>	<C-h>	
"		\ :execute "normal :help " . expand('<cword>') . "<CR>"

"}}}
"" Select last changed text-objects {{{
	"+ (See WEB+DB PRESS vol.52, p70)
nnoremap	gc		`[v`]
vnoremap	gc		:<C-u>normal gc<CR>
onoremap	gc		:<C-u>normal gc<CR>

"}}}
"" Duplicate lines added comment {{{
	"+ TODO: 
"nnoremap	gp		
	"decide comment string as value of filetype

"}}}
"" Templete {{{
"au BufNewFile *.c		0r ~/.vim/skel/skeleton.c
"	\ |execute 'normal! G"_dd'
"	\ |execute cursor(1,1,0)
"	\ |execute search('//plz code')
augroup InsertTemplete
	autocmd!
	autocmd BufNewFile *.html
		\ 0r ~/.vim/skel/skeleton.html
		\ |execute 'normal! G"_dd'|call cursor(1,1,0)
		\ |call search('//EDITSECTION')
	autocmd BufNewFile *.c
		\ 1r ~/.vim/skel/skeleton.c
		\ |1 delete _
		\ |call search('//plz code')
	autocmd BufNewFile Makefile	0r ~/.vim/skel/skeleton.Makefile|normal! 11G$
	autocmd BufNewFile *.pl		0r ~/.vim/skel/skeleton.pl|normal! G
	autocmd BufNewFile *.py		0r ~/.vim/skel/skeleton.py|normal! G
	"au BufWinEnter *.c	
augroup END

"}}}

"" [plugin settings] (built-in, external command or my defined)
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
if has('unix')
	nnoremap <silent>		[Tag]t		:!(cd %:p:h;ctags *.[ch])&<cr>
endif

"}}}

"" [plugin settings] (local-additions)
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
"let g:buftabs_only_basename=1	"show only basename (not './path/basename')
"let g:buftabs_in_statusline=1	"show buffer-tab in status line

"}}}
"" mru.vim {{{
if has('unix')
	"let MRU_File='$HOME/.vim_mru_files		"by default
	let MRU_Max_Entries=20			"history size
	let MRU_Exclude_Files='^/tmp/.*\|^/var/tmp/.*'
endif

"}}}
"" vim-Arpeggio {{{
call arpeggio#load()
let g:arpeggio_timeoutlen=40		"default
Arpeggio noremap!	jk	<Esc>

"function! s:Toggle_option_number()	"not use 's:'
Arpeggio nnoremap	sn	:call Toggle_option('number')<CR>

"}}}
"" howm-mode.vim {{{
"set runtimepath+=~/.howm_vim
"let g:howm_dir = '~/.howm/'
"let g:howm_grepprg = '/usr/bin/grep'
"let g:howm_findprg = '/usr/bin/find'

"}}}
"" fuzzyfinder.vim {{{
" The prefix key with fuzzyfinder.vim
nnoremap			[FUFTag]	<Nop>
nmap				<C-q>		[FUFTag]
"let g:FuzzyFinderOptions.Base.key_open=<CR>			"default
"let g:FuzzyFinderOptions.Base.key_open_split=<C-j>
nnoremap <silent>	[FUFTag]<C-n>		:FuzzyFinderBuffer<CR>
nnoremap <silent>	[FUFTag]<C-m>		:FuzzyFinderFile 
				\ <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent>	[FUFTag]<C-j>		:FuzzyFinderMruFile<CR>
nnoremap <silent>	[FUFTag]<C-k>		:FuzzyFinderMruCmd<CR>
nnoremap <silent>	[FUFTag]<C-p>		:FuzzyFinderDir 
				\ <C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]<CR><CR>
"nnoremap <silent>	[FUFTag]<C-d>		:FuzzyFinderDir<CR>
"nnoremap <silent>	[FUFTag]<C-b>		:FuzzyFinderBookmark<CR>
"nnoremap <silent>	[FUFTag]<C-t>		:FuzzyFinderTag!<CR>
"nnoremap <silent>	[FUFTag]<C-g>		:FuzzyFinderTaggedFile<CR>
noremap <silent>	g]         :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>
"nnoremap <silent>	[FUFTag]b			:FuzzyFinderAddBookmark<CR>
"nnoremap <silent>	[FUFTag]<C-e>		:FuzzyFinderEditInfo<CR>

"}}}
"" taglist.vim {{{
nnoremap <silent>	[Tag]<C-t>	:TlistToggle<CR>
"let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1

"}}}
"" errormarker.vim {{{
"let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
"set makeprg=LANGUAGE=C\ make

"}}}
"" qbuf.vim {{{
let g:qb_hotkey = ",<LT>"

"}}}


"" [memo]
"au FileType * set formatoptions-=r	"don't continue comment line automatically
"au FileType * set formatoptions-=o	"don't continue comment line automatically
"set formatoptions-=r		"don't continue comment line automatically
"set formatoptions-=o		"don't continue comment line automatically

"" [memo.2]
command! CalcFP 
	\ :echo len(filter(readfile($MYVIMRC),'v:val !~ "^\\s*$\\|^\\s*\""'))
		"+ See http://vim.g.hatena.ne.jp/kabiy/20090712/1247378981
		"      http://vim-users.jp/2009/07/hack-39/

" END {{{
" vim: tw=0:sts=0:ts=4:sw=4
" vim: fdm=marker
