" Vim syntax file
" Language:	trpc TRPC
" Maintainer:	Nima-Dvlp
" Last Change:	2022-01-01

if exists("b:current_syntax")
  finish
endif

syn case match

function! s:FoldEnable(...) abort
  if a:0 > 0
    return index(s:FoldEnable(), a:1) > -1
  endif
  return get(g:, 'trpc_fold_enable', ['block', 'import', 'varconst', 'package_comment'])
endfunction


syntax keyword trpcKeyword test desc import importpath
syntax keyword trpcKeyword protofile protoset
syntax keyword trpcKeyword endpoint insecure port path reflectPath
syntax keyword trpcKeyword invoke goal data headers
syntax keyword trpcKeyword expects onFail isNotEmpty isEmpty isNoneOrZero
syntax keyword trpcKeyword if else elseif

syntax keyword trpcBoolean        true false
syntax keyword trpcConst          null
syntax match   trpcConst          /^(null|true|false)$/
syntax match   trpcOperator       "+=\=\|-=\=\|*=\=\|/=\=\|%=\=\|\~/=\=\|<<=\=\|>>=\=\|[<>]=\=\|===\=\|\!==\=\|&=\=\|\^=\=\||=\=\|||\|&&\|\[\]=\=\|=>\|!\|\~\|?\|:"

syntax keyword trpcException Ignore Warn Panic

syntax match trpcExpect  /^\s\+\zs[A-Za-z._]\+\ze/
syntax match trpcField   /[A-Za-z_][A-Za-z_0-9]\+\ze[[:blank:]\r\n]*\:/

"Function's highlighting
syntax match   trpcFunction      "\zs\<\([_$]*[a-z][a-zA-Z0-9_$]*\)\ze\(<\|(\|\s\+=>\)"


" Numbers
syntax match   trpcNumber        "\<0[xX]\x\+\>\|\<\d\+\(\.\d\+\)\=\([eE][+-]\=\d\+\)\=\>"

" Comments
syntax keyword trpcTodo          contained TODO FIXME XXX

syn region      trpcComment           start="//" end="$" contains=goGenerate,@trpcCommentGroup,@Spell
if s:FoldEnable('comment')
  syn region    trpcComment           start="/\*" end="\*/" contains=@trpcCommentGroup,@Spell fold
  syn match     trpcComment           "\v(^\s*//.*\n)+" contains=goGenerate,@trpcCommentGroup,@Spell fold
else
  syn region    trpcComment           start="/\*" end="\*/" contains=@trpcCommentGroup,@Spell
endif

syntax region trpcString oneline start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link trpcString String

syn region  trpcFold matchgroup=trpcBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold


hi def link     trpcComment         Comment

highlight link trpcKeyword 					 Keyword
highlight default link trpcFunction        Function
highlight default link trpcNumber          Number
highlight default link trpcBoolean         Boolean
highlight default link trpcConst         Constant
highlight default link dartLineDocComment  Comment
highlight default link dartShebangLine     Comment
highlight default link trpcTodo            Todo
highlight default link trpcOperator        Operator
highlight default link trpcException    Error
highlight default link trpcField           Label
highlight default link trpcExpect           Label
highlight default link trpcBraces          Delimiter

let b:current_syntax = "trpc"
