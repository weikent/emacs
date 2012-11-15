
(add-to-list 'load-path
             "~/emacs/lisp/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/emacs/lisps/yasnippet-0.6.1c/snippets")



(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(global-auto-complete-mode t)  
  
;;(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))  
(setq-default ac-sources '(ac-source-yasnippet    
                 ac-source-semantic  
;;                 ac-source-ropemacs  
                 ac-source-imenu    
                 ac-source-words-in-buffer  
                 ac-source-dictionary  
                 ac-source-abbrev    
                 ac-source-words-in-buffer    
                 ac-source-files-in-current-dir    
                 ac-source-filename))   
  
(add-hook 'emacs-lisp-mode-hook    (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))  
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))  

(add-hook 'python-mode-hook        (lambda () (add-to-list 'ac-omni-completion-sources (cons "\\." '(ac-source-ropemacs)))  ))    
  
  
(set-face-background 'ac-candidate-face "lightgray")  
(set-face-underline 'ac-candidate-face "darkgray")  
(set-face-background 'ac-selection-face "steelblue")   
  
(setq ac-auto-start 2)  
(setq ac-dwim t)  

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
(add-hook 'python-mode-hook
      (lambda ()
        (set-variable 'py-indent-offset 4)
        ;(set-variable 'py-smart-indentation nil)
        (set-variable 'indent-tabs-mode nil)
        (define-key py-mode-map (kbd "RET") 'newline-and-indent)
        ;(define-key py-mode-map [tab] 'yas/expand)
        ;(setq yas/after-exit-snippet-hook 'indent-according-to-mode)
        (smart-operator-mode-on)
        ))
;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)


;; (require 'pycomplete)  
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))  
;; (setq interpreter-mode-alist(cons '("python2.7" . python-mode)  
;;                            interpreter-mode-alist))  
  
;; (setq py-python-command "python2.7")  
;; (autoload 'python-mode "python-mode" "Python editing mode." t)  



;; ;; Auto Syntax Error Hightlight
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (add-hook 'find-file-hook 'flymake-find-file-hook)



(provide 'init_python)