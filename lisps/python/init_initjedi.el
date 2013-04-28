;; URL:https://github.com/tkf/emacs-jedi

;;use M-x el-get-install RET jedi to install jedi.

;;should install virtualenv first

;;MACOS,should run "make requirements" at jedi folders in terminal.

(setq jedi:setup-keys t)
(require 'jedi)

(message "start jedi")
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook
	  '(lambda ()
	     (define-key python-mode-map [(meta s)] 'jedi:complete)
	     (define-key python-mode-map [(control .)] 'jedi:goto-definition)
	     ))
;(global-set-key [(control tab)] 'jedi:complete) 


(provide 'init_initjedi)
