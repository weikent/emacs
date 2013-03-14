

;;(load-file "~/.emacs.d/ipython.el")
(load-file "~/emacs/lisps/ipython.el")
(require 'python)
;; use ipython
(setq python-command "ipython")
(require 'ipython)
(setq
python-shell-interpreter "ipython"
python-shell-interpreter-args ""
python-shell-prompt-regexp "In \\[[0-9]+\\]: "
python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
python-shell-completion-setup-code
"from IPython.core.completerlib import module_completion"
python-shell-completion-string-code
"';'.join(__IP.complete('''%s'''p))\n"
python-shell-completion-module-string-code "")

(provide 'init_ipython)
