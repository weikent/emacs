;;-------------------------中文设定--------------------------
;; Setup GBK environment
(set-terminal-coding-system 'euc-cn)
(set-keyboard-coding-system 'euc-cn)
(set-language-environment 'Chinese-GB)
(setq locale-coding-system 'utf-8)
(setq current-language-environment "Chinese-GBK")
(prefer-coding-system 'utf-8)



;; ;; Time-stamp: <2012-01-01 13:56:02 Sunday by taoshanwen>

;; (defconst my-emacs-path           "d:/emacs/home/emacs/" "我的emacs相关配置文件的路径")
;; (defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "我自己写的emacs lisp包的路径")
;; (defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
;; (defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

;; ;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
;; (load (concat my-emacs-my-lisps-path "my-subdirs"))
;; (my-add-subdirs-to-load-path my-emacs-lisps-path)
;; (my-add-subdirs-to-load-path my-emacs-my-lisps-path)


;; ; 一些基本的小函数
;; (require 'ahei-misc)

;; (require 'eval-after-load)

;; (require 'util)

;; ;; 一些Emacs的小设置
;; (require 'misc-settings)

;; ;;(require 'all-auto-complete-settings)

;; ;;(require 'cedet-settings)



;;(require 'auto-insert-settings)


(add-to-list 'load-path
             "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

;;(global-set-key [M-y] 'yas/insert-snippet)
;;(global-set-key [M-n] 'yas/next-field)
;;(global-set-key [M-p] 'yas/prev-field)


;;(require 'template)
;;(template-initialize)
;;(template-auto-insert t)



;; (setq auto-insert t)										   ;;
;; ;;(setq auto-insert-query t)
;; (add-hook 'find-file-hooks 'auto-insert)							   ;;
;; (setq auto-insert-directory "~/.emacs.d/mytemplates/")					   ;;
;; ;;(define-auto-insert '("^build\\.xml\\'" . "Ant±àÒë½Å±¾") "build.xml")			   ;;
;; (define-auto-insert "\\.org" "org-auto-insert")						   ;;
;; ;;这个就是新建以.c 结尾的C文件时，会自动插入c-auto-insert文件中的内容			   ;;
;; ;;(define-auto-insert "\\.c" "c-auto-insert")							   ;;
;; (define-auto-insert "\\.c" "c.tpl")

(add-hook 'find-file-hooks 'auto-insert)
(auto-insert-mode 1)

;;(setq auto-insert-directory "~/.emacs.d/mytemplates/")

;; (setq auto-insert-alist
;;       (append '((f90-mode . "Template.f90")
;;             (python-mode . "Template.py")
;;             (c-mode . "Template.c")
;;             )
;;            auto-insert-alist))

												   ;;
;; ;;首先这句话设置一个目录，你的auto-insert 的模版文件会存放在这个目录中，			   ;;
;; (setq-default auto-insert-directory "~/.emacs.d/mytemplates/")				   ;;
;; (auto-insert-mode)  ;;; 启用auto-insert							   ;;
;; ;; 默认情况下插入模版前会循问你要不要自动插入，这里设置为不必询问，			   ;;
;; ;; 在新建一个org文件时，自动插入`auto-insert-directory'目录下的`org-auto-insert`文件中的内容 ;;
;; (setq auto-insert-query nil)								   ;;
;; (define-auto-insert "\\.org" "org-auto-insert")						   ;;
;; ;;这个就是新建以.c 结尾的C文件时，会自动插入c-auto-insert文件中的内容			   ;;
;; (define-auto-insert "\\.c" "c-auto-insert")						   ;;
												   ;;
(defadvice auto-insert  (around yasnippet-expand-after-auto-insert activate)			   ;;
  "expand auto-inserted content as yasnippet templete,					   ;;
  so that we could use yasnippet in autoinsert mode"						   ;;
  (let ((is-new-file (and (not buffer-read-only)						   ;;
                          (or (eq this-command 'auto-insert)					   ;;
                              (and auto-insert (bobp) (eobp))))))				   ;;
    ad-do-it											   ;;
    (let ((old-point-max (point-max)))							   ;;
      (when is-new-file									   ;;
        (goto-char old-point-max)								   ;;
        (yas/expand-snippet (buffer-substring-no-properties (point-min) (point-max)))	   ;;
        (delete-region (point-min) old-point-max)						   ;;
        )											   ;;
      )											   ;;
    )											   ;;
  )												   ;;

;; (setq auto-insert t)
;; (auto-insert-mode)  ;;; Adds hook to find-files-hook
;; (setq auto-insert-directory "~/.emacs.d/mytemplates/") ;;; Or use custom, *NOTE* Trailing slash important
;; (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
;; (add-hook 'find-file-hooks 'auto-insert)

;; (setq auto-insert-alist
;;       (append '((f90-mode . "Template.f90")
;;             (python-mode . "Template.py")
;;             (c-mode . "Template.c")
;;             )
;;            auto-insert-alist))





(server-start) ;;
(add-hook 'kill-emacs-hook ;;
(lambda() ;;
(if (file-exists-p "~/.emacs.d/server/server") ;;
(delete-file "~/.emacs.d/server/server"))))


(require 'auto-complete-settings)



(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(ansi-color-for-comint-mode-on)



(require 'my-global-key-settings)



