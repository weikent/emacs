
;; path
(message (getenv "PATH"))
(setq path "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/bin")
(setq path1 "/usr/local/bin")
(setenv "PATH"
	(concat
	 "/usr/local/bin" ":"
	 (getenv "PATH")
	 )
	)
(message (getenv "PATH"))


(setq homeName (substring system-name 0 (string-match "teki" system-name)))
(setq homePath (concat "/Users/" homeName))
(setq pathModule1 (concat homePath "/emacs/PP4E/Preview"))
(setq pathModule2 (concat homePath "/emacs/python"))
(setq pathModule3 (concat homePath "/emacs/project"))
(setq pathModule4 (concat homePath "/emacs/python/pythonFirstGame"))
(setq pythonModulePath (concat pathModule1 ":" pathModule2 ":" pathModule3 ":" pathModule4))
;;设置PYTHONPATH  export PYTHONPATH=/Users/weishijian/emacs/python:$PYTHONPATH in .bash_profile or other environment variables set files.
;; HOME 路径不能用 ~/... 这样添加不成功，
(setenv "PYTHONPATH" pythonModulePath)





(defconst my-emacs-path           "~/emacs/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-template-path  (concat my-emacs-lisps-path "template/templates") "")



;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)


;;访问.emacs文件
(defun visit-.emacs ()
  "访问.emacs文件"
  (interactive)
  (find-file (concat my-emacs-path "macDotEmacs.el")))
(global-set-key (kbd "C-x E") 'visit-.emacs)


;;(load-file "~/.emacs.d/sudo-ext.el")
;;(server-start)
;;(require 'sudo-ext)
(require 'my-global-key-settings)


;;(require 'init_auto-complete-clang)

(require 'init_elget)
(require 'init_auto-complete-clang)
;;(require 'init_initjedi)

(require 'init_yasnippet)

(require 'init_ipython)



;; 一些基本的小函数
(require 'ahei-misc)

;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

(require 'util)

;; 用一个很大的kill ring. 这样防止我不小心删掉重要的东西
(setq kill-ring-max 200)

;; 方便的在kill-ring里寻找需要的东西
(require 'browse-kill-ring-settings)

;; 显示行号
(require 'linum-settings)
;; 高亮当前行
(require 'hl-line-settings)




(defmacro def-redo-command (fun-name redo undo)
  "Make redo command."
  `(defun ,fun-name ()
     (interactive)
     (if (equal last-command ,redo)
         (setq last-command 'undo)
       (setq last-command nil))
     (call-interactively ,undo)
     (setq this-command ,redo)))
(def-redo-command redo 'redo 'undo)

(require 'dired-settings)

(require 'grep-settings)

(require 'tramp-settings)

(require 'ido-settings)

;;格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
;;绑定到F7键
(global-set-key [f7] 'indent-whole)




(require 'template)  
(setq template-default-directories '("~/emacs/lisps/template/templates"))
;;(setq template-subdirectories '("~/.emacs.d/template/templates"))  
(setq template-auto-insert t)  
(template-initialize)
(add-to-list 'template-find-file-commands  
             'ido-exit-minibuffer)  





;;(require 'init_python)

(require 'orgMode-settings)
;; ;;;(require 'htmlize)

(require 'cedet-settings)

(require 'xcscope-settings)


(require 'highlight-symbol-settings)

(require 'C-settings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; color theme Emacs主题 		   ;;
;; ;; color-theme-calm-forset 也听不错的。 ;;
;; (defun my-color-settings()		   ;;
;;   (interactive)			   ;;
;;   ;; (color-theme-initialize)  	   ;;
;;   ;; (color-theme-calm-forest)	   ;;
;;   ;; (color-theme-dark-blue2)	   ;;
;;   (require 'color-theme-settings)	   ;;
;;   (color-theme-initialize)		   ;;
;;   ;; (color-theme-calm-forest)	   ;;
;;   ;; (color-theme-dark-green)	   ;;
;;   (color-theme-dark-blue2)		   ;;
;;   ;;  (require 'ahei-face)		   ;;
;;   ;;  (require 'color-theme-ahei)	   ;;
;;   ;;  (require 'face-settings)	   ;;
;;   )					   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; 字体配置
;; ;;(require 'font-settings)
;; (color-theme-ahei)

;; 有关界面和字体的配置
(add-hook 'after-make-frame-functions
	  (lambda (new-frame)
	    (select-frame new-frame)
	    (tool-bar-mode 0)
	    (scroll-bar-mode 0)
	    ;;	    (my-color-settings)
	    ))

(require 'color-theme)
(color-theme-initialize)
(color-theme-digital-ofs1)
;;(color-theme-robin-hood)

(require 'init_initjedi)


;;(set-default-font "courier 10 pitch-12")
(set-default-font "DejaVu Sans Mono-12")


;;(set-default-font "Courier New-12") 
