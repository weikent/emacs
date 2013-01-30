
(add-to-list 'load-path
             "~/emacs/lisp/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/emacs/lisps/yasnippet-0.6.1c/snippets")
;; (setq yas/trigger-key (kbd “M-[“))


;;(require 'yasnippet-settings)

;; (setq yas/next-field-or-maybe-expand (kbd "<f4>"))
;; (setq yas/prev-field (kbd "<f5>"))
;; setq yas/trigger-key (kbd "<f4>")


;; ;; at ~/.emacs.d folder. git clone yasnippet.git
;; (add-to-list 'load-path
;;               "~/.emacs.d/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (setq yas-next-field-or-maybe-expand "M-n")
;; (setq yas-prev-field "M-p")




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
;;			   ac-source-dictionary  
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
;;	    (define-key py-mode-map (kbd "RET") 'newline-and-indent)
					;(define-key py-mode-map [tab] 'yas/expand)
					;(setq yas/after-exit-snippet-hook 'indent-according-to-mode)
;;	    (smart-operator-mode-on)
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

;; (if (eq system-type 'darwin)
;; (rope-mode 1)
;; )

;; (defvar server-buffer-clients)
;; (when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
;;   (server-start)
;;   (defun fp-kill-server-with-buffer-routine ()
;;     (and server-buffer-clients (server-done)))
;;   (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

;;(require 'ipython)

;;(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
;;(setq ansi-color-for-comint-mode t)

;; (require 'helm-config)
;; (helm-mode 1)

;;(require 'anything-config)

;; (defun my-anything ()
;;   (interactive)
;;   (anything-other-buffer
;;    '(anything-c-source-buffers
;;      anything-c-source-file-name-history
;;      anything-c-source-info-pages
;;      anything-c-source-info-elisp
;;      anything-c-source-man-pages
;;      anything-c-source-locate
;;      anything-c-browse-code-regexp-python
;;      anything-for-files
;;      anything-ff-avfs-directory
;; ;;     anything-source-ipython
;;      anything-c-source-emacs-commands)
;;    " *my-anything*"))

;;(require 'anything-ipython)

;; (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;; 				'(length initial-pattern)))

;; (require 'comint)
;; (define-key comint-mode-map (kbd "M-") 'comint-next-input)
;; (define-key comint-mode-map (kbd "M-") 'comint-previous-input)
;; (define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)



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
