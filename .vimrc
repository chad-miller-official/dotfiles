set nocompatible

" Setup vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'lepture/vim-jinja'

call vundle#end()
filetype plugin indent on

" Indent settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap / /\v
vnoremap / /\v

" Scroll settings
set scrolloff=10
set sidescrolloff=15

nnoremap j gj
nnoremap k gk

" Filetype-based settings
syntax on
au BufNewFile,BufRead *.ini,*.yml set ft=jinja
au BufNewFile,BufRead *.conf set ft=dosini

" Theme
colorscheme Tomorrow-Night-Eighties
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=grey

" Misc
set ruler
set number

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Easy-Align Settings
vmap <Enter> <Plug>(EasyAlign)

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" }

nnoremap <F7> :SyntasticCheck<CR>
nnoremap <F8> :SyntasticReset<CR>
