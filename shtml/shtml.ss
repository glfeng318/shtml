(library (shtml shtml)
  (export
    :a
    :abbr
    :address
    :area
    :article
    :aside
    :audio
    :b
    :base
    :bdi
    :bdo
    :blockquote
    :body
    :br
    :button
    :canvas
    :caption
    :cite
    :code
    :col
    :colgroup
    :data
    :datalist
    :dd
    :del
    :details
    :dfn
    :dialog
    :div
    :dl
    :dt
    :em
    :embed
    :fieldset
    :figcaption
    :figure
    :footer
    :form
    :h1
    :h2
    :h3
    :h4
    :h5
    :h6
    :head
    :header
    :hgroup
    :hr
    :html
    :i
    :iframe
    :img
    :input
    :ins
    :kbd
    :label
    :legend
    :li
    :link
    :main
    :map
    :mark
    :menu
    :meta
    :meter
    :nav
    :noscript
    :object
    :ol
    :optgroup
    :option
    :output
    :p
    :param
    :picture
    :pre
    :progress
    :q
    :rp
    :rt
    :ruby
    :s
    :samp
    :script
    :search
    :section
    :select
    :small
    :source
    :span
    :strong
    :style
    :sub
    :summary
    :sup
    :svg
    :table
    :tbody
    :td
    :template
    :textarea
    :tfoot
    :th
    :thead
    :time
    :title
    :tr
    :track
    :u
    :ul
    :var
    :video
    :wbr
    )
  (import (chezscheme))

(define make-attribute
  (lambda (a)
    (let loop ((a (car a)))
      (if (null? (cddr a))
        (string-append (car a) "=\"" (cadr a) "\"")
        (string-append (car a) "=\"" (cadr a) "\" " (loop (cddr a)))))))

(define (make-element-fn tag)
  (case tag
    [("area" "base" "br" "col" "embed" "hr" "img" "input" "link" "meta" "source" "track" "wbr")
    (lambda e
      (if (null? e)
        (string-append "<" tag " />")
        (string-append "<" tag " " (make-attribute e) " />")
        ))]
    [("html") (lambda e
                (if (null? e)
                  (string-append "<!DOCTYPE html>\n<html></html>")
                  (if (list? (car e))
                    (string-append "<!DOCTYPE html>\n<html " (make-attribute e) ">" (apply string-append (cdr e)) "</html>")
                    (string-append "<!DOCTYPE html>\n<html>" (apply string-append e) "</html>")))
                  )]
    [else (lambda e
            (if (null? e)
              (string-append "<" tag "></" tag ">")
              (if (list? (car e))
                (string-append "<" tag " " (make-attribute e) ">" (apply string-append (cdr e)) "</" tag ">")
                (string-append "<" tag ">" (apply string-append e) "</" tag ">")))
              )]))

(define :a          (make-element-fn "a"))
(define :abbr       (make-element-fn "abbr"))
(define :address    (make-element-fn "address"))
(define :area       (make-element-fn "area"))
(define :article    (make-element-fn "article"))
(define :aside      (make-element-fn "aside"))
(define :audio      (make-element-fn "audio"))
(define :b          (make-element-fn "b"))
(define :base       (make-element-fn "base"))
(define :bdi        (make-element-fn "bdi"))
(define :bdo        (make-element-fn "bdo"))
(define :blockquote (make-element-fn "blockquote"))
(define :body       (make-element-fn "body"))
(define :br         (make-element-fn "br"))
(define :button     (make-element-fn "button"))
(define :canvas     (make-element-fn "canvas"))
(define :caption    (make-element-fn "caption"))
(define :cite       (make-element-fn "cite"))
(define :code       (make-element-fn "code"))
(define :col        (make-element-fn "col"))
(define :colgroup   (make-element-fn "colgroup"))
(define :data       (make-element-fn "data"))
(define :datalist   (make-element-fn "datalist"))
(define :dd         (make-element-fn "dd"))
(define :del        (make-element-fn "del"))
(define :details    (make-element-fn "details"))
(define :dfn        (make-element-fn "dfn"))
(define :dialog     (make-element-fn "dialog"))
(define :div        (make-element-fn "div"))
(define :dl         (make-element-fn "dl"))
(define :dt         (make-element-fn "dt"))
(define :em         (make-element-fn "em"))
(define :embed      (make-element-fn "embed"))
(define :fieldset   (make-element-fn "fieldset"))
(define :figcaption (make-element-fn "figcaption"))
(define :figure     (make-element-fn "figure"))
(define :footer     (make-element-fn "footer"))
(define :form       (make-element-fn "form"))
(define :h1         (make-element-fn "h1"))
(define :h2         (make-element-fn "h2"))
(define :h3         (make-element-fn "h3"))
(define :h4         (make-element-fn "h4"))
(define :h5         (make-element-fn "h5"))
(define :h6         (make-element-fn "h6"))
(define :head       (make-element-fn "head"))
(define :header     (make-element-fn "header"))
(define :hgroup     (make-element-fn "hgroup"))
(define :hr         (make-element-fn "hr"))
(define :html       (make-element-fn "html"))
(define :i          (make-element-fn "i"))
(define :iframe     (make-element-fn "iframe"))
(define :img        (make-element-fn "img"))
(define :input      (make-element-fn "input"))
(define :ins        (make-element-fn "ins"))
(define :kbd        (make-element-fn "kbd"))
(define :label      (make-element-fn "label"))
(define :legend     (make-element-fn "legend"))
(define :li         (make-element-fn "li"))
(define :link       (make-element-fn "link"))
(define :main       (make-element-fn "main"))
(define :map        (make-element-fn "map"))
(define :mark       (make-element-fn "mark"))
(define :menu       (make-element-fn "menu"))
(define :meta       (make-element-fn "meta"))
(define :meter      (make-element-fn "meter"))
(define :nav        (make-element-fn "nav"))
(define :noscript   (make-element-fn "noscript"))
(define :object     (make-element-fn "object"))
(define :ol         (make-element-fn "ol"))
(define :optgroup   (make-element-fn "optgroup"))
(define :option     (make-element-fn "option"))
(define :output     (make-element-fn "output"))
(define :p          (make-element-fn "p"))
(define :param      (make-element-fn "param"))
(define :picture    (make-element-fn "picture"))
(define :pre        (make-element-fn "pre"))
(define :progress   (make-element-fn "progress"))
(define :q          (make-element-fn "q"))
(define :rp         (make-element-fn "rp"))
(define :rt         (make-element-fn "rt"))
(define :ruby       (make-element-fn "ruby"))
(define :s          (make-element-fn "s"))
(define :samp       (make-element-fn "samp"))
(define :script     (make-element-fn "script"))
(define :search     (make-element-fn "search"))
(define :section    (make-element-fn "section"))
(define :select     (make-element-fn "select"))
(define :small      (make-element-fn "small"))
(define :source     (make-element-fn "source"))
(define :span       (make-element-fn "span"))
(define :strong     (make-element-fn "strong"))
(define :style      (make-element-fn "style"))
(define :sub        (make-element-fn "sub"))
(define :summary    (make-element-fn "summary"))
(define :sup        (make-element-fn "sup"))
(define :svg        (make-element-fn "svg"))
(define :table      (make-element-fn "table"))
(define :tbody      (make-element-fn "tbody"))
(define :td         (make-element-fn "td"))
(define :template   (make-element-fn "template"))
(define :textarea   (make-element-fn "textarea"))
(define :tfoot      (make-element-fn "tfoot"))
(define :th         (make-element-fn "th"))
(define :thead      (make-element-fn "thead"))
(define :time       (make-element-fn "time"))
(define :title      (make-element-fn "title"))
(define :tr         (make-element-fn "tr"))
(define :track      (make-element-fn "track"))
(define :u          (make-element-fn "u"))
(define :ul         (make-element-fn "ul"))
(define :var        (make-element-fn "var"))
(define :video      (make-element-fn "video"))
(define :wbr        (make-element-fn "wbr"))


; (display
;   (:html '("lang" "en")
;     (:meta '("http-equiv" "Content-Type" "content" "charset=utf-8"))
;     (:title "Scheme Website")
;     (:link '("href" "http://fonts.googleapis.com/icon?family=Material+Icons" "rel" "stylesheet"))
;     (:script '("src" "https://cdn.jsdelivr.net/npm/@unocss/runtime"))
;     (:link '("rel" "stylesheet" "href" "https://cdn.jsdelivr.net/npm/@unocss/reset/normalize.min.css"))
;     (:body
;       (:div '("class" "bg-red-500")
;         (:div "a")
;         (:div "b"))
;       (:script "console.log('hello scheme')")
;       )))

)
