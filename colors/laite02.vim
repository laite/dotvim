" Vim color file
" Maintainer:   laite
" Last Change:  2012 Aug 17

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="laite02"

hi Cursor       guifg=white guibg=darkgreen

hi Normal       gui=none guifg=black guibg=white
hi NonText      gui=none guifg=orange guibg=white

hi Statement    gui=none guifg=darkblue
hi Type         gui=none guifg=darkblue
hi Special      gui=none guifg=#880000
hi Constant     gui=none guifg=#880000
hi Comment      gui=none guifg=#999999
hi Preproc      gui=none guifg=#57962F
hi Identifier   gui=none guifg=#2E7C72
hi Title        gui=none guifg=black

hi Number		gui=none guifg=#B31F19

hi StatusLine   gui=none guibg=#333333 guifg=white
hi StatusLineNC gui=none guibg=#333333 guifg=white
hi VertSplit    gui=none guibg=#333333 guifg=white
hi LineNr 		gui=none guibg=#eeeeee guifg=#aaaaaa

hi MatchParen 	gui=none guibg=darkgreen guifg=black
hi Visual       gui=none guibg=darkgreen guifg=black
hi Search       gui=none guibg=magenta
hi Directory    gui=none guifg=darkblue
hi WarningMsg   gui=none guifg=red 
hi Error        gui=none guifg=white guibg=red
hi Todo         gui=none guifg=black guibg=yellow

hi MoreMsg      gui=none
hi ModeMsg      gui=none

