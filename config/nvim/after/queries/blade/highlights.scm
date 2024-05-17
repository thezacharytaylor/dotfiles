(directive) @tag
(directive_start) @tag
(directive_end) @tag
; (comment) @comment @spell

[
  (directive)
  (directive_start)
  (directive_end)
] @keyword

([
  (bracket_start)
  (bracket_end)
] @punctuation.special (#set! "priority" 110))

(comment) @comment @spell
