(field_declaration
  (raw_string_literal) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "go")
)
;;(
;;   (expression_list
;;    (raw_string_literal)) @injection.content
;;  (#offset! @injection.content 0 1 0 -1)
;;  (#set! injection.include-children)
;;  (#set! injection.language "go")
;;)
;;
((raw_string_literal) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#lua-match? @injection.content "^`%c?[select|SELECT|with|WITH]")
  (#set! injection.language "sql"))
;;((comment) @injection.content
;;  (#offset! @injection.content 0 1 0 -1)
;;  (#set! injection.include-children)
;;  (#set! injection.language "sql"))
