
(require 'xcscope)
;; C-c s a 设定初始化的目录，一般是你代码的根目录  
;; C-s s I 对目录中的相关文件建立列表并进行索引  
;; C-c s s 序找符号  
;; C-c s g 寻找全局的定义  
;; C-c s c 看看指定函数被哪些函数所调用  
;; C-c s C 看看指定函数调用了哪些函数  
;; C-c s e 寻找正则表达式  
;; C-c s f 寻找文件  
;; C-c s i 看看指定的文件被哪些文件include  

;; C-c s s         Find symbol.
;; C-c s d         Find global definition.
;; C-c s g         Find global definition (alternate binding).
;; C-c s G         Find global definition without prompting.
;; C-c s c         Find functions calling a function.
;; C-c s C         Find called functions (list functions called
;;                 from a function).
;; C-c s t         Find text string.
;; C-c s e         Find egrep pattern.
;; C-c s f         Find a file.
;; C-c s i         Find files #including a file.
;; 下面是在搜索到的结果之间切换用的快捷键：

;; C-c s b         Display *cscope* buffer.
;; C-c s B         Auto display *cscope* buffer toggle.
;; C-c s n         Next symbol.
;; C-c s N         Next file.
;; C-c s p         Previous symbol.
;; C-c s P         Previous file.
;; C-c s u         Pop mark.
;; 更详细的使用说明请参见 xcscope.el 文件头部的注释。

(provide 'xcscope-settings)
