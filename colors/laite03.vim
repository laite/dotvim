" Vim color file
" Maintainer:   laite
" Last Change:  2012 Aug 17

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="laite03"

hi Cursor       guifg=white guibg=#d8896a

hi Normal       gui=none guifg=black guibg=#fcfcfc
hi NonText      gui=none guifg=orange guibg=#fcfcfc

hi Statement    gui=none guifg=#a01300
hi Type         gui=none guifg=#a01300
hi Special      gui=none guifg=#c03700
hi Constant     gui=none guifg=#005599
hi Number		gui=none guifg=#20408e
hi Identifier   gui=none guifg=black
hi Preproc      gui=none guifg=darkcyan
hi Comment      gui=none guifg=#999999
hi Title        gui=none guifg=black

hi StatusLine   gui=none guibg=#333333 guifg=white
hi StatusLineNC gui=none guibg=#333333 guifg=white
hi VertSplit    gui=none guibg=#333333 guifg=white
hi LineNr 		gui=none guibg=#f7f7f7 guifg=#bbbbbb

hi MatchParen 	gui=none guifg=white guibg=#e8c9ba
hi Visual       gui=none guibg=darkgreen guifg=black
hi Search       gui=none guibg=#ddffdd guifg=black
hi Directory    gui=none guifg=darkblue
hi WarningMsg   gui=none guifg=red 
hi Error        gui=none guifg=white guibg=red
hi Todo         gui=none guifg=black guibg=yellow

hi MoreMsg      gui=none
hi ModeMsg      gui=none guifg=darkred

hi perlIdentifier			gui=none guifg=black 
hi perlVarPlain				gui=none guifg=#106020 
hi perlVarPlain2			gui=none guifg=#106020 
hi perlFunctionName			gui=none guifg=black 
hi perlArrow				gui=none guifg=black 
hi perlFiledescRead			gui=none guifg=black 
hi perlVarSimpleMember		gui=none guifg=black 
hi perlFiledescStatement	gui=none guifg=black 
hi perlVarNotInMatches		gui=none guifg=black 
hi perlVarSimpleMember		gui=none guifg=black 
hi perlVarSimpleMemberName 	gui=none guifg=#106020 
hi perlVarNotInMatches		gui=none guifg=black 
hi perlVarSlash				gui=none guifg=black 
hi perlFormatName			gui=none guifg=black 
hi perlFunctionName			gui=none guifg=black 
hi perlMethod				gui=none guifg=black 
hi perlFunction				gui=none guifg=#a01300

hi perlStatementControl 	gui=none guifg=#a01300
hi perlStatementMisc	 	gui=none guifg=black
hi perlStatementStorage 	gui=none guifg=#a01300
