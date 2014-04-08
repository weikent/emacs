
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 一些全局快捷键设置 ;; ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;不要自动在文件最后自动插入换行符
;;(setq auto-insert nil)


(setq frame-title-format "emacs@weishijian'computer")

(setq inhibit-startup-screen t)        ;去掉启动欢迎界面
;;;; 关闭启动画面
;;(setq inhibit-startup-message t)


;;y/n代替yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;不生成临时文件
(setq-default make-backup-files nil)

 ;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;;set the default text coding system
;;(setq default-buffer-file-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)
 
;;指针不闪，不恍花眼睛。
(blink-cursor-mode -1)
(transient-mark-mode 1)


(global-set-key (kbd "M-g") 'goto-line)

;;;;ecb 设置------------------------------
;;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
;;;;;------------------------------
;;

;;时间设置
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着?
;;;; 显示时间------------------------------------------------------------------------------------------------
(display-time)


;;;;设置大的kill ring
(setq kill-ring-max 2000)

;;设置打开文件缺省路径
(setq default-directory "~/")



;;取消工具栏
;;(tool-bar-mode nil);;这个在ntemacs24中不好使，估计nil都不好使。
(tool-bar-mode -1)
;;(scroll-bar-mode nil)
(scroll-bar-mode -1);;显示右侧滚动条。-1为不显示。


(setq x-select-enable-clipboard t) ;支持emacs和外部程序的粘贴

;; 跳转到 Emacs 的另一个buffer窗口
(global-set-key [f1] 'other-window)


;;不要打入 TAB 时总是听到 PC 喇叭嘀嘀嘀的叫
(setq visible-bell nil)



;;不要总是没完没了的问yes or no, 为什么不能用 y/n
(fset 'yes-or-no-p 'y-or-n-p)


;;为什么不能显示个时间什么的
(display-time)


;;为什么不显示当前所在的行号和列号
(column-number-mode t)


;;为什么不能像Windows下编辑器那样, 高亮显示要拷贝的区域
(transient-mark-mode t)


;;我要显示匹配的括号
(show-paren-mode t)

;;为什么使用语法显示的大文件在移动时如此之慢
(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
   



;;revert-buffer 和 revert-buffer-with-coding-system 两个名命令可以重新加载当前buffer打开的文件，我把这两个功能分别绑定到F5和C-F5快键上:

(global-set-key [f2] 'revert-buffer)
(global-set-key [C-f2] 'revert-buffer-with-coding-system)

(global-set-key (kbd "<f1>") 'ansi-term)

;;;F3：切换到dired模式
(global-set-key [(f3)] 'grep-find)

;;;;F7：调用compile
(global-set-key (kbd "<f5>") 'compile)


;;;
(global-set-key (kbd "C-x ;") 'comment-region)
(global-set-key (kbd "C-c ;") 'uncomment-region)


;;;F4：切换到shell模式
;;(global-set-key [(f4)] 'ansi-term)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;speedbar干啥用的。没觉得好用。。。。	       ;;
;; ;; ;;;F5：打开speedbar			       ;;
;; ;; (global-set-key [(f5)] 'speedbar)		       ;;
;; ;; ;;定义f4为speedbar启动			       ;;
;; ;; (global-set-key [(f4)] 'speedbar-get-focus)      ;;
;; ;; ;;;Alt+s : 让speedbar获得焦点		       ;;
;; ;; (global-set-key (kbd "M-s") 'speedbar-get-focus) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;------------------------End of Short Cut ---------------------


;;----------日历设置------------------------------------------------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  设置日历 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))
;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1);; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t);; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil); ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日
;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
(holiday-fixed 2 14 "情人节")
(holiday-fixed 3 14 "白色情人节")
(holiday-fixed 4 1 "愚人节")
(holiday-fixed 5 1 "劳动节")
(holiday-float 5 0 2 "母亲节")
(holiday-fixed 6 1 "儿童节")
(holiday-float 6 0 3 "父亲节")
(holiday-fixed 7 1 "建党节")
(holiday-fixed 8 1 "建军节")
(holiday-fixed 9 10 "教师节")
(holiday-fixed 10 1 "国庆节")
(holiday-fixed 12 25 "圣诞节")))
;;Calendar模式支持各种方式来更改当前日期
;;（这里的“前”是指还没有到来的那一天，“后”是指已经过去的日子）
;;  q      退出calendar模式
;; C-f     让当前日期向前一天
;; C-b     让当前日期向后一天
;; C-n     让当前日期向前一周
;; C-p     让当前日期向后一周
;; M-}     让当前日期向前一个月
;; M-{     让当前日期向后一个月
;; C-x ]   让当前日期向前一年
;; C-x [   让当前日期向后一年
;; C-a     移动到当前周的第一天
;; C-e     移动到当前周的最后一天
;; M-a     移动到当前月的第一天
;; M-e     多动到当前月的最后一天
;; M-<     移动到当前年的第一天
;; M->     移动到当前年的最后一天
;;Calendar模式支持移动多种移动到特珠日期的方式
;; g d     移动到一个特别的日期
;;  o      使某个特殊的月分作为中间的月分
;;  .      移动到当天的日期
;; p d     显示某一天在一年中的位置，也显示本年度还有多少天。
;; C-c C-l 刷新Calendar窗口
;; Calendar支持生成LATEX代码。
;; t m     按月生成日历
;; t M     按月生成一个美化的日历
;; t d     按当天日期生成一个当天日历
;; t w 1   在一页上生成这个周的日历
;; t w 2   在两页上生成这个周的日历
;; t w 3   生成一个ISO-SYTLE风格的当前周日历
;; t w 4   生成一个从周一开始的当前周日历
;; t y     生成当前年的日历
;;EMACS Calendar支持配置节日：
;; h       显示当前的节日
;; x       定义当天为某个节日
;; u       取消当天已被定义的节日
;; e       显示所有这前后共三个月的节日。
;; M-x holiday  在另外的窗口的显示这前后三个月的节日。

;; 另外，还有一些特殊的，有意思的命令：
;; S       显示当天的日出日落时间(是大写的S)
;; p C     显示农历可以使用
;; g C     使用农历移动日期可以使用 
;;设置F11快捷键指定Emacs 的日历系统
;;(require 'cal-china-x)
;; (setq mark-holidays-in-calendar t)
;; (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
;; (setq calendar-holidays cal-china-x-important-holidays)
;; (setq calendar-holidays holiday-wsj-holidays)

;; (setq christian-holidays nil) ;; 不显示基督教的节日
;; (setq hebrew-holidays nil)    ;; 不显示希伯来人的节日
;; (setq islamic-holidays nil)   ;; 不显示伊斯兰教的节日

;;(global-set-key [f10] 'calendar)

;;设置日历的一些颜色
;;;---------- 日历设置------------------------------------------------------------------------------------------------------------------




;;----插入时间2010/12/06 15:19:57
(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(defun my-replace ()
  (interactive)
  (replace-string  (regexp-quote "\t") "    "))


(global-set-key (kbd "C-c m d") 'my-insert-date)


;;(global-set-key [(control tab)] 'switch-to-buffer) 
;;-----插入时间2010/12/06 15:20:29
(defun my-insert-tab ()
  (interactive)
  (insert "    "))

;; (global-set-key (read-kbd-macro "<C-tab>") 'my-insert-tab) 
(global-set-key (kbd "<f12> t") 'my-insert-tab)
;;删除的东西。
;;(global-set-key [(f2)] 'browse-kill-ring)
(global-set-key (kbd "<f12> k") 'browse-kill-ring)
;;In html-helper-mode , NOT auto indents
(setq html-helper-never-indent 't)



(global-set-key (kbd "C-SPC") 'nil)


;; 密码之类的显示成**号
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
 

(provide 'my-global-key-settings)
