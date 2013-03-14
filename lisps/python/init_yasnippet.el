
(add-to-list 'load-path
             "~/emacs/lisp/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/emacs/lisps/yasnippet-0.6.1c/snippets")

(provide 'init_yasnippet)

