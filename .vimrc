" My .vimrc
" Notes "{{{1
"
" * This file consists of "sections".
" 	- The first character of the name of each sections should be Capital.
"
" * Each sections consists of zero or more "subsections".
" FIXME: add notations. cf.kana's dot.vim (~/Desktop/kana*/)
"
" * Key Notation: 
" 	- Contol-keys: Write as <C-x>, neither <C-X> nor <c-x>.
"

"" Indent option {{{1
set modelines=5				"check modeline from top or bottom of text
set modeline				"enable mode line.
set softtabstop=0
set textwidth=0				"don't wrap
set shiftwidth=8			"width when using '>>' or '<<'
set tabstop=8
set noautoindent
"au FileType * set formatoptions-=ro   "don't continue comment line automatically
"set formatoptions="tcq"
set formatoptions-=r
set formatoptions-=o
set noignorecase
set nosmartcase
set nosmartindent
set nosmarttab
set nocindent
"au InsertLeave *	set iminsert=0	 	"don't work
"au InsertLeave *	set imsearch=-1	 	"don't work


"" Look and feel {{{1
"set list							"show visibly tab, end of line, wrap line...
" 'set listchars' is setting for 'set list'
set listchars=tab:>.,eol:$,trail:_,extends:\
" Following two settings bring 全角の空白 into sight
"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
"au BufRead,BufNew * match JpSpace /　/
syntax enable						"enavle syntax highlighting
set showmatch						"show matching brackets

"" Fold block {{{1
"set foldmethod=indent

"" Appearance of the status line {{{1
set ruler							"show cursor line and column
set showcmd							"show command inputing in status line
set showmode						"display mode INSERT/REPLACE/...

"" Miscellaneous settings {{{1
set sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize"

set hidden							"traverse between the buffers without :w
set esckeys							"required to be able to use keypad keys and map missed escape sequences
set backspace=indent,eol,start		"allow BSing over everything in insert mode
set keywordprg=man\ -S\	3p	"See :h index.txt /|K|
" Comment out 'cause using buftab
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P	"show character code and return character in status line

"" ft setting for changelog (input '\o'). (See :help ft-changelog-plugin)
let g:changelog_new_date_format = "%d  %u\n\t* %c\n\n"	"set changelog format
filetype plugin on										"enable above format


"" [keymap] {{{1
"" Recenter as searching word {{{2
"set scrolloff=999		"recenter (almost same as :zz)
set scrolloff=2
"nm <silent>	n	nzz<CR>
"nm <silent>	N	Nzz<CR>
"nm <silent>	*	*zz<CR>
"nm <silent>	#	#zz<CR>
"nm <silent>	g*	g*zz<CR>
"nm <silent>	g#	g#zz<CR>

"" Move between buffers or tabs or windows {{{2
nn <silent>		<Space>		:bn<CR>
"nn <silent>	<S-Space>	:bp<CR>
"nn <silent>	<Bslash>	:bp<CR>
nn <silent>		<BS>		:bp<CR>
nn <silent>		<C-p>		:tabp<CR>
nn <silent>		<C-n>		:tabn<CR>
nn <silent>		<C-h>		<C-w>h
nn <silent>		<C-l>		<C-w>l
nn <silent>		<C-j>		<C-w>j
nn <silent>		<C-k>		<C-w>k

"" In Command-Line mode, map C-a and C-e as emacs {{{2
cno				<C-a>		<Home>
cno				<C-e>		<End>
cno				<C-f>		<Right>
cno				<C-b>		<Left>
"cno				<C-d>		<Del>

"" Resize windows easily {{{2
nn <silent>		<Up>		<C-W>+
nn <silent>		<Down>		<C-W>-

"" Switch :hls, :noh when leaving Lang-Arg mode(See :lmap @Lang-Arg) {{{2
"ln

"" Reread this buffer with changing fileenconding type {{{2
no <silent>		<F2>		:e ++ff=dos ++enc=shift_jis<CR>
no <silent>		<F3>		:e ++ff=unix ++enc=2byte-utf-8<CR>

"" For ChangeLog {{{2
no <silent>		<F5>		<Esc>O<Esc>:.!LANG=C date<CR>$a:<Esc>o<Esc>:.!basename `pwd`<CR>kJo<TAB>* 

"" For update/reload vimrc {{{2
nn 				.s			:source $MYVIMRC<CR>
nn 				.v			:e $MYVIMRC<CR>

"" Templete {{{2
"au BufNewFile *.c		0r ~/.vim/skel/skeleton.c|exe 'normal! G"_dd'|exe cursor(1,1,0)|exe search('//plz code')
au BufNewFile *.html	0r ~/.vim/skel/skeleton.html|exe 'normal! G"_dd'|call cursor(1,1,0)|call search('//EDITSECTION')
au BufNewFile *.c		1r ~/.vim/skel/skeleton.c|1 delete _|call search('//plz code')
au BufNewFile Makefile	0r ~/.vim/skel/skeleton.Makefile|normal! 11G$
"au BufWinEnter *.c	


"" [plugin settings] {{{1
"" For dirtags(ctags) {{{2
nn <silent>		.t			:!(cd %:p:h;ctags *.[ch])&<cr>
nn <silent>		.x			:!(gcc -Wall -I$HOME/include %:p) 2>&1<cr>
						"TODO tmpname()を使ってclistに表示できるようにしたい
nn <silent>		.X			:!(g++ -Wall %:p) 2>&1<cr>

"" For yankring.vim {{{2
"nn <silent>	,y	:YRShow<CR>
"nun <silent>	<C-P>

"" For buftabs.vim {{{2
set laststatus=2				"always show status line
let g:buftabs_only_basename=1	"show only basename (not './path/basename')
let g:buftabs_in_statusline=1	"show buffer-tab in status line

"" For mru.vim {{{2
"let MRU_File='$HOME/.vim_mru_files	"default
let MRU_Max_Entries=20			"history size
let MRU_Exclude_Files='^/tmp/.*\|^/var/tmp/.*'

"" For vim-Arpeggio {{{2
"call arpeggio#load()
call arpeggio#map('ic', '', 0, 'jk', '<Esc>')
let g:arpeggio_timeoutlen=40		"default

"" For howm-mode.vim {{{2
"set runtimepath+=~/.howm_vim
"let g:howm_dir = '~/.howm/'
"let g:howm_grepprg = '/usr/bin/grep'
"let g:howm_findprg = '/usr/bin/find'

"" For fuzzyfinder.vim {{{2
"let g:FuzzyFinderOptions.Base.key_open=<CR>			"default
"let g:FuzzyFinderOptions.Base.key_open_split=<C-j>
nn <silent> <C-e><C-n>      :FuzzyFinderBuffer<CR>
nn <silent> <C-e><C-m>      :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nn <silent> <C-e><C-j>      :FuzzyFinderMruFile<CR>
nn <silent> <C-e><C-k>      :FuzzyFinderMruCmd<CR>
nn <silent> <C-e><C-p>      :FuzzyFinderDir <C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]<CR><CR>
"nn <silent> <C-e><C-d> :FuzzyFinderDir<CR>
"nn <silent> <C-e><C-b>      :FuzzyFinderBookmark<CR>
"nn <silent> <C-e><C-t> :FuzzyFinderTag!<CR>
"nn <silent> <C-e><C-g> :FuzzyFinderTaggedFile<CR>
no  <silent> g]         :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>
"nn <silent> <C-e>b     :FuzzyFinderAddBookmark<CR>
"nn <silent> <C-e><C-e> :FuzzyFinderEditInfo<CR>


" END {{{1
" vim: tw=0:sts=0:ts=4:sw=4:
" vim: foldmethod=marker
