(defconst my-emacs-path           "~/emacs/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")


;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
(my-add-subdirs-to-load-path my-emacs-path)

;;访问.emacs文件
(defun visit-.emacs ()
  "访问.emacs文件"
  (interactive)
  (find-file (concat my-emacs-path "winDotEmacs.el")))
(global-set-key (kbd "C-x E") 'visit-.emacs)


(server-start)
(add-hook 'kill-emacs-hook
	  (lambda()
	    (if (file-exists-p "~/.emacs.d/server/server")
		(delete-file "~/.emacs.d/server/server"))))



(require 'my-global-key-settings)

(require 'ahei-misc)
;;(require 'misc-settings)
(require 'util)

;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)
;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

;; 方便的在kill-ring里寻找需要的东西
(require 'browse-kill-ring-settings)
;;(require 'browse-kill-ring)
;; 显示行号
(require 'linum-settings)

;; 高亮当前行
(require 'hl-line-settings)

(require 'color-theme-settings)

(require 'ahei-face)
(require 'color-theme-ahei)
(require 'face-settings)

(require 'font-settings)

(defmacro def-redo-command (fun-name redo undo)
  "Make redo command."
  `(defun ,fun-name ()
     (interactive)
     (if (equal last-command ,redo)
         (setq last-command 'undo)
       (setq last-command nil))
     (call-interactively ,undo)
     (setq this-command ,redo)))

(require 'dired-settings)


(require 'orgMode-settings)

(require 'tramp-settings)

(require 'ido-settings)

;;格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
;;绑定到F7键
(global-set-key [f7] 'indent-whole)


(add-to-list 'load-path
             "~/emacs/lisp/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/emacs/lisps/yasnippet-0.6.1c/snippets")



(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)




;;;--for cedet
;; (load-file "~/emacs/lisps/cedet/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ;;; 搜索路径
;; (setq semanticdb-project-roots
;;       (list
;;       (expand-file-name "/")))
;; ;;; 数据库位置，可以随意选择，我选择在家目录下(后面有说明)
;; (require 'semanticdb)
;; (setq semanticdb-default-save-directory
;; (expand-file-name "~/semanticdb"))
 
;; (global-semanticdb-minor-mode 1)
;; ;;; 空闲调度时间
;; (setq-default semantic-idle-scheduler-idle-time 432000)
;; (setq semanticdb-search-system-databases t)
;; ;;; 针对于结构体和指针的补齐
;; (global-set-key "." 'semantic-complete-self-insert)
;; (global-set-key ">" 'semantic-complete-self-insert)
;; ;;; 补齐的其它按键
;; (global-set-key [(control return)] 'semantic-ia-complete-symbol)
;; (global-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;; (global-set-key "\C-c>" 'semantic-complete-analyze-inline)
;; (global-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)

;;; 可以看一下效果再作选择。那个菜单式补齐(像VC6.0补齐那种)我截图不到，但我负责地告诉你，是可以的。
;;;(global-set-key [(control tab)] 'senator-completion-menu-popup)
;;;(global-set-key [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;;; this will be fine!!
;;;(global-set-key [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;;-- end for cedet



;; ;;-------------------------中文设定--------------------------
;; ;; Setup GBK environment
;; (set-terminal-coding-system 'euc-cn)
;; (set-keyboard-coding-system 'euc-cn)
;; (set-language-environment 'Chinese-GB)
;; (setq locale-coding-system 'utf-8)
;; (setq current-language-environment "Chinese-GBK")
;; (prefer-coding-system 'utf-8)
;; (require 'my-global-key-settings)





;; ;; ;;(require 'all-auto-complete-settings)

;; ;; ;;(require 'cedet-settings)



;; ;;(require 'auto-insert-settings)


;; (add-to-list 'load-path
;;              "~/.emacs.d/yasnippet-0.6.1c")
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

;; ;;(global-set-key [M-y] 'yas/insert-snippet)
;; ;;(global-set-key [M-n] 'yas/next-field)
;; ;;(global-set-key [M-p] 'yas/prev-field)


;; ;;(require 'template)
;; ;;(template-initialize)
;; ;;(template-auto-insert t)



;; ;; ;; (setq auto-insert t)										   ;;
;; ;; ;; ;;(setq auto-insert-query t)
;; ;; ;; (add-hook 'find-file-hooks 'auto-insert)							   ;;
;; ;; ;; (setq auto-insert-directory "~/.emacs.d/mytemplates/")					   ;;
;; ;; ;; ;;(define-auto-insert '("^build\\.xml\\'" . "Ant±àÒë½Å±¾") "build.xml")			   ;;
;; ;; ;; (define-auto-insert "\\.org" "org-auto-insert")						   ;;
;; ;; ;; ;;这个就是新建以.c 结尾的C文件时，会自动插入c-auto-insert文件中的内容			   ;;
;; ;; ;; ;;(define-auto-insert "\\.c" "c-auto-insert")							   ;;
;; ;; ;; (define-auto-insert "\\.c" "c.tpl")

;; ;; (add-hook 'find-file-hooks 'auto-insert)
;; ;; (auto-insert-mode 1)

;; ;; ;;(setq auto-insert-directory "~/.emacs.d/mytemplates/")

;; ;; ;; (setq auto-insert-alist
;; ;; ;;       (append '((f90-mode . "Template.f90")
;; ;; ;;             (python-mode . "Template.py")
;; ;; ;;             (c-mode . "Template.c")
;; ;; ;;             )
;; ;; ;;            auto-insert-alist))

;; ;; 												   ;;
;; ;; ;; ;;首先这句话设置一个目录，你的auto-insert 的模版文件会存放在这个目录中，			   ;;
;; ;; ;; (setq-default auto-insert-directory "~/.emacs.d/mytemplates/")				   ;;
;; ;; ;; (auto-insert-mode)  ;;; 启用auto-insert							   ;;
;; ;; ;; ;; 默认情况下插入模版前会循问你要不要自动插入，这里设置为不必询问，			   ;;
;; ;; ;; ;; 在新建一个org文件时，自动插入`auto-insert-directory'目录下的`org-auto-insert`文件中的内容 ;;
;; ;; ;; (setq auto-insert-query nil)								   ;;
;; ;; ;; (define-auto-insert "\\.org" "org-auto-insert")						   ;;
;; ;; ;; ;;这个就是新建以.c 结尾的C文件时，会自动插入c-auto-insert文件中的内容			   ;;
;; ;; ;; (define-auto-insert "\\.c" "c-auto-insert")						   ;;
;; ;; 												   ;;
;; ;; (defadvice auto-insert  (around yasnippet-expand-after-auto-insert activate)			   ;;
;; ;;   "expand auto-inserted content as yasnippet templete,					   ;;
;; ;;   so that we could use yasnippet in autoinsert mode"						   ;;
;; ;;   (let ((is-new-file (and (not buffer-read-only)						   ;;
;; ;;                           (or (eq this-command 'auto-insert)					   ;;
;; ;;                               (and auto-insert (bobp) (eobp))))))				   ;;
;; ;;     ad-do-it											   ;;
;; ;;     (let ((old-point-max (point-max)))							   ;;
;; ;;       (when is-new-file									   ;;
;; ;;         (goto-char old-point-max)								   ;;
;; ;;         (yas/expand-snippet (buffer-substring-no-properties (point-min) (point-max)))	   ;;
;; ;;         (delete-region (point-min) old-point-max)						   ;;
;; ;;         )											   ;;
;; ;;       )											   ;;
;; ;;     )											   ;;
;; ;;   )												   ;;

;; ;; ;; (setq auto-insert t)
;; ;; ;; (auto-insert-mode)  ;;; Adds hook to find-files-hook
;; ;; ;; (setq auto-insert-directory "~/.emacs.d/mytemplates/") ;;; Or use custom, *NOTE* Trailing slash important
;; ;; ;; (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
;; ;; ;; (add-hook 'find-file-hooks 'auto-insert)

;; ;; ;; (setq auto-insert-alist
;; ;; ;;       (append '((f90-mode . "Template.f90")
;; ;; ;;             (python-mode . "Template.py")
;; ;; ;;             (c-mode . "Template.c")
;; ;; ;;             )
;; ;; ;;            auto-insert-alist))



;; ;;auto-complete 
;; ;;(require 'auto-complete-settings)
;; (add-to-list 'load-path "~/.emacs.d/")
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)

;; (define-key ac-complete-mode-map (kbd "<return>") 'nil)
;; (define-key ac-complete-mode-map (kbd "RET") 'nil)
;; (define-key ac-complete-mode-map (kbd "M-j") 'ac-complete)
;; (define-key ac-complete-mode-map (kbd "M-n") 'ac-next)
;; (define-key ac-complete-mode-map (kbd "M-p") 'ac-previous)


;; ;; (add-to-list 'load-path (concat myoptdir "AC"))
;; (require 'auto-complete-config)
;; ;;    (add-to-list 'ac-dictionary-directories (concat myoptdir "AC/ac-dict"))
;; (require 'auto-complete-clang)

;; (setq ac-auto-start 2)
;; (setq ac-quick-help-delay 0.5)
;; ;; (ac-set-trigger-key "TAB")
;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (defun my-ac-config ()
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;; ;;  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;; ;;  (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ;; ac-source-gtags
;; (my-ac-config)
;; ;;auto-complete end 

;; ;;;python

;; ;;pymacs

;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;; ;;(eval-after-load "pymacs"
;; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;; ;;ropmacs
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)


;; ;;pycomplete
;; (require 'pycomplete)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (setq interpreter-mode-alist(cons '("python" . python-mode)
;;                            interpreter-mode-alist))

;; ;;(define-key py-mode-map "\t" 'py-complete)
;; ;;(define-key python-mode-map (kbd "\t") 'py-complete)

;; ;;(require 'ipython)			     
;; ;;python end 


;; (setq default-buffer-file-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

;; (ansi-color-for-comint-mode-on)



;; (global-set-key (read-kbd-macro "<C-tab>") 'py-complete) 
