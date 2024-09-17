((template_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#match? @injection.content "\\cselect.*")
  (#set! injection.language "sql"))
