# shtml
rendering HTML in chezscheme

```scheme
(:html '("lang" "en")
  (:meta '("http-equiv" "Content-Type" "content" "charset=utf-8"))
  (:title "chez-nng web")
  (:link '("href" "http://fonts.googleapis.com/icon?family=Material+Icons" "rel" "stylesheet"))
  (:script '("src" "https://cdn.jsdelivr.net/npm/@unocss/runtime"))
  (:link '("rel" "stylesheet" "href" "https://cdn.jsdelivr.net/npm/@unocss/reset/normalize.min.css"))
  (:body
    (:div '("class" "bg-red-500")
      (:div "a")
      (:div "b"))
    (:script "console.log('hello scheme')")
    ))
```
