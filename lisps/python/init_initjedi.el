;; URL:https://github.com/tkf/emacs-jedi

;;use M-x el-get-install RET jedi to install jedi.

;;should install virtualenv first

;;MACOS,should run "make requirements" at jedi folders in terminal.


(message "start jedi")
(add-hook 'python-mode-hook 'jedi:ac-setup)

(add-hook 'python-mode-hook
'(lambda ()

   (define-key python-mode-map [(meta s)] 'jedi:complete)
))

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)
(global-auto-complete-mode t)  


(add-hook 'python-mode-hook 'jedi:ac-setup)


(provide 'init_initjedi)
