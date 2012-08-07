
(defconst my-emacs-path           "~/Downloads/SVN/my-emacs/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "我自己写的emacs lisp包的路径")
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
  (find-file (concat my-emacs-path ".emacs")))
(global-set-key (kbd "C-x E") 'visit-.emacs)


;;(require 'my-global-key-settings)
(require 'ahei-misc)
(require 'misc-settings)
(require 'util)

;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)
;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

; 方便的在kill-ring里寻找需要的东西
(require 'browse-kill-ring-settings)
;;(require 'browse-kill-ring)
;; 显示行号
(require 'linum-settings)

;; 高亮当前行
(require 'hl-line-settings)

;;(require 'eagle-settings)

;; ;; 关闭buffer的时候, 如果该buffer有对应的进程存在, 不提示, 烦  不成功阿
;; (define-derived-mode eagle-status-edit-mode text-mode "Twitter Status Edit"
;;   "Major mode for updating your Twitter status."
;;   ;; Schedule to update the character count after altering the buffer
;;   (make-local-variable 'after-change-functions)
;;   (add-hook 'after-change-functions 'eagle-status-edit-after-change)
;;   ;; Add the remaining character count to the mode line
;;   ;; messages
;;   (make-local-variable 'eagle-tweet-overlong-overlay)
;;   (make-local-variable 'kill-buffer-query-functions)
;;   (setq kill-buffer-query-functions '(eagle-confirm-kill-status-edit))
;;   ;; Update the mode line immediatly
;;   (eagle-status-edit-update-length))

;; (defun eagle-confirm-kill-status-edit ()
;;   "Ask kill current buffer or not."
;;   (if (or (not (buffer-modified-p)) (yes-or-no-p "Kill this buffer?"))
;;       t))
;; ;; 关闭buffer的时候, 如果该buffer有对应的进程存在, 不提示, 烦
;; (delq 'process-kill-buffer-query-function kill-buffer-query-functions)

;; color theme Emacs主题
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-dark-blue2)

(require 'color-theme-settings)

(require 'ahei-face)
(require 'color-theme-ahei)
(require 'face-settings)


(require 'coding-settings)

(require 'font-settings)

;;dired ---------------------------------------------------------------------------------------------------------------------

;;(require 'dired-settings)
(require 'dired+)
;; (require 'w32-browser)										 
;; (require 'files+)											 ;;
;; (require 'ls-lisp+)										 ;;
;;只打开一个buffer											 ;;
(require 'dired-single)										 ;;
;;(require 'wuxch-dired "my-wuxch-dired")								 ;;
;;(require 'wuxch-dired-copy-paste "my-wuxch-dired-copy-paste")					 ;;
;;为了C-1,C-2,C-3 来得到文件名，路径。其他功能咱时不清楚。						 ;;
(require 'wuxch-dired)										 ;;
(require 'wuxch-dired-copy-paste)									 ;;
;;li-lisp+可以防止出 没有找到ls程序 错误。								 ;;
(require 'ls-lisp+)											 ;;
;;(require 'dired-details+)										 ;;
													 ;;
;;防止加载wuxch之后，自动隐藏dired-details。即文件大小，创建时间，可读写权限 都隐藏，只显示文件和文件夹名称 ;;
(setq dired-details-initially-hide nil)								 ;;
;;(require 'dired+)											 ;;
;;(require 'dired+-settings)										 ;;
;;(require 'dired-x-settings)									 ;;
;;(require 'dired-lis-settings)									 ;;
;;
(defun dired-up-directory-same-buffer ()								 ;;
  "Goto parent directory in the smae buffer."							 ;;
  (interactive)											 ;;
  (let* ((dir (dired-current-directory))								 ;;
	 (dir-file-name (directory-file-name dir)))							 ;;
    (unless (string= dir dir-file-name)								 ;;
      (find-alternate-file "..")									 ;;
      (dired-goto-file dir-file-name))))								 ;;


;; (defun eal-define-keys-commonly (keymap key-defs)
;;   "Execute `define-key' on KEYMAP use arguments from KEY-DEFS.

;; KEY-DEFS should be one list, every element of it is a list
;; whose first element is key like argument of `define-key', and second element is command
;; like argument of `define-key'."
;;    (dolist (key-def key-defs)
;;      (when key-def
;;        (define-key keymap (eval `(kbd ,(car key-def))) (nth 1 key-def)))))


;;   (defun dired-keys ()
;;     "dired-mode中的快捷键定义"
;;     (define-prefix-command 'dired-slash-map)
;;     (eal-define-keys-commonly
;;      dired-mode-map
;;      `(("<backspace>" dired-up-directory-same-buffer))))
;;(define-key dired-mode-map (eval `(kbd ,"<backspace>")) dired-up-directory-same-buffer ))))

;;9月6日 注释。 用来关闭dired
;;(define-key dired-mode-map (eval `(kbd ,"<backspace>")) 'dired-up-directory-same-buffer)


;;dired end --------------------------------------------------------------------------------------------------------------------






;; diff
(require 'diff-settings)

;; Emacs的diff: ediff
(require 'ediff-settings)


;; 打开压缩文件时自动解压缩
;; 必须放在session前面
(auto-compression-mode 1)


;; 用M-x执行某个命令的时候，在输入的同时给出可选的命令名提示
(require 'icomplete-settings)

;; Emacs可以做为一个server, 然后用emacsclient连接这个server,
;; 无需再打开两个Emacs
;;(require 'emacs-server-settings)
(server-start)
;;(require 'apropos-settings)
;;(require 'completion-list-mode-settings)


;; 语法高亮
(global-font-lock-mode t)


;;auto-insert 
(auto-insert-mode 1)
(setq auto-insert-query nil)


;;auto-complete
(require 'auto-complete-settings)


(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/Downloads/SVN/my-emacs/yasnippet-0.6.1c/snippets")



;;cedet -----------------------------------------------------------------------------------------------
;(add-to-list 'load-path "

;;cedet End -------------------------------------------------------------------------------------------
