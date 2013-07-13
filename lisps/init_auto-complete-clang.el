

;; (add-to-list 'load-path "~/.emacs.d/el-get/pos-tip")
;; (add-to-list 'load-path "~/.emacs.d/el-get/fuzzy")
;; ;;(add-to-list 'load-path "~/.emacs.d/el-get/popup")
;; (add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")

;; (require 'pos-tip)
;; (setq ac-quick-help-prefer-pos-tip t)
;; (setq ac-use-quick-help t)
;; (setq ac-quick-help-delay 1.0)
;; (setq ac-fuzzy-enable t)
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
;; (ac-config-default)

;; (global-auto-complete-mode t)  

;; ;; 使用Ctrl+enter按键触发自动补全  
;; (define-key ac-mode-map  [(control return)] 'auto-complete)  

;; ;; (require 'auto-complete-config)
;; ;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; ;; (ac-config-default)
;; ;; (global-auto-complete-mode t)  


;; (add-to-list 'load-path "~/.emacs.d/el-get/auto-complete-clang/")  
;; (require 'auto-complete-clang)    
;; ;;(setq ac-clang-auto-save t)    
;; ;; 设置不自动启动  
;; ;;(setq ac-auto-start nil)    
;; ;; 设置响应时间 0.5  
;; (setq ac-quick-help-delay 0.5)    
;; ;;(ac-set-trigger-key "TAB")    
;; ;;(define-key ac-mode-map  [(control tab)] 'auto-complete)    
;; ;; 提示快捷键为 M-/  
;; ;; (define-key ac-mode-map  (kbd "M-/") 'auto-complete)   


;; (defun my-ac-config ()
;;   (when (eq system-type 'darwin)
;;     (setq ac-clang-flags    
;; 	  (mapcar(lambda (item)(concat "-I" item))    
;; 		 (split-string    
;; 		  "  
;; /usr/llvm-gcc-4.2/bin/../lib/gcc/i686-apple-darwin11/4.2.1/include
;;  /usr/include/c++/4.2.1
;;  /usr/include/c++/4.2.1/backward
;;  /usr/local/include
;;  /Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include
;;  /usr/include
;;  /System/Library/Frameworks
;;  /Library/Frameworks
;; "
;; 		  ))))
;;   (when (eq system-type 'gnu/linux)
;;     (setq ac-clang-flags    
;; 	  (mapcar(lambda (item)(concat "-I" item))    
;; 		 (split-string    
;; 		  "  
;;  /usr/include/c++/4.7
;;  /usr/include/c++/4.7/i686-linux-gnu
;;  /usr/include/c++/4.7/backward
;;  /usr/lib/gcc/i686-linux-gnu/4.7/include
;;  /usr/local/include
;;  /usr/lib/gcc/i686-linux-gnu/4.7/include-fixed
;;  /usr/include/i386-linux-gnu
;;  /usr/include
;; "
;; 		  ))))
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))    
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)    
;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)    
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)    
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)    
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)    
;;   (global-auto-complete-mode t))


;; (defun my-ac-cc-mode-setup ()    
;;   (setq ac-sources (append '(ac-source-clang) ac-sources)))    
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)    
;; ;; ac-source-gtags    
;; (my-ac-config)    
;; (ac-config-default)  

;;==============================
;;------------------------------
;; 2013-7-13 修改此文件
;; 现在认为自动补全功能并不需要使用到popup/pos-tip/fuzzy功能。并且好像auto-complete自带这些功能。不需要单独下载。
;; 修改补全的提示，不需要自动启动。在需要的时候使用快捷键来启动。
;;------------------------------
;;==============================

;; 开启 auto-complete  
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete/")  
(require 'auto-complete)  
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/ac-dict/")  
(add-to-list 'ac-user-dictionary-files "~/.emacs.d/el-get/auto-complete/dict/guotf.dict")  
(require 'auto-complete-config)  
;; 结束  

;; 开启 auto-complete-clang  
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete-clang/")  
(require 'auto-complete-clang)    
;;(setq ac-clang-auto-save t)    
;; 设置不自动启动  
(setq ac-auto-start nil)    
;; 设置响应时间 0.5  
(setq ac-quick-help-delay 0.5)    
;;(ac-set-trigger-key "TAB")    
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)    
;; 提示快捷键为 M-/  
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)   
;; (defun my-ac-config ()    
;;   (setq ac-clang-flags    
;;         (mapcar(lambda (item)(concat "-I" item))    
;;                (split-string    
;;                 "  
;;  /usr/include/c++/4.7
;;  /usr/include/c++/4.7/i686-linux-gnu
;;  /usr/include/c++/4.7/backward
;;  /usr/lib/gcc/i686-linux-gnu/4.7/include
;;  /usr/local/include
;;  /usr/lib/gcc/i686-linux-gnu/4.7/include-fixed
;;  /usr/include/i386-linux-gnu
;;  /usr/include
;; "  
;; )))    

(defun my-ac-config ()
  (when (eq system-type 'darwin)
    (setq ac-clang-flags    
	  (mapcar(lambda (item)(concat "-I" item))    
		 (split-string    
		  "  
/usr/llvm-gcc-4.2/bin/../lib/gcc/i686-apple-darwin11/4.2.1/include
 /usr/include/c++/4.2.1
 /usr/include/c++/4.2.1/backward
 /usr/local/include
 /Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include
 /usr/include
 /System/Library/Frameworks
 /Library/Frameworks
"
		  ))))
  (when (eq system-type 'gnu/linux)
    (setq ac-clang-flags    
	  (mapcar(lambda (item)(concat "-I" item))    
		 (split-string    
		  "  
 /usr/include/c++/4.7
 /usr/include/c++/4.7/i686-linux-gnu
 /usr/include/c++/4.7/backward
 /usr/lib/gcc/i686-linux-gnu/4.7/include
 /usr/local/include
 /usr/lib/gcc/i686-linux-gnu/4.7/include-fixed
 /usr/include/i386-linux-gnu
 /usr/include
"
		  ))))

  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))    
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)    
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)    
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)    
  (add-hook 'css-mode-hook 'ac-css-mode-setup)    
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)    
  (global-auto-complete-mode t))    
(defun my-ac-cc-mode-setup ()    
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))    
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)    
;; ac-source-gtags    
(my-ac-config)    
(ac-config-default)  
(provide 'init_auto-complete-clang)
