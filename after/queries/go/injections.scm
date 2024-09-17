;;(
;;   (expression_list
;;    (raw_string_literal)) @property
;;    (#offset! @property 0 1 0 -1)
;;)

;;(
;;   (expression_list
;;    (raw_string_literal)) @injection.content
;;  (#offset! @injection.content 0 1 0 -1)
;;  (#set! injection.include-children)
;;  (#set! injection.language "go")
;;)
;;((raw_string_literal) @injection.content
;;  (#offset! @injection.content 0 1 0 -1)
;;  (#set! injection.language "sql"))
;;((comment) @injection.content
;;  (#offset! @injection.content 0 1 0 -1)
;;  (#set! injection.include-children)
;;  (#set! injection.language "sql"))
