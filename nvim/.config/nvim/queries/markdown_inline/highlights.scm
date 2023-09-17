;; extends

(wiki_link ["[" "[" "|" "]" "]"] @punctuation.delimiter)

(tag) @string.special

(
  [
    (wiki_link
      (link_destination) @conceal
      (link_text)
    )
    "[" @conceal
    "|" @conceal
    "]" @conceal
  ]
  (#set! conceal "")
)

(
  [
    (wiki_link
      (link_destination) @text.reference
      .
    ) @_link
  ]
  (#contains? @_link "|")
)
