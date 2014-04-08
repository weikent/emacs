;;; doxymacs-settings.el --- 

;; Copyright 2014 世建 魏
;;
;; Author: weikent@ubuntu
;; Version: $Id: doxymacs-settings.el,v 0.0 2014/04/08 13:29:53 weikent Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'doxymacs-settings)

;;; Code:


(defconst my-company "DingQing Technology, Ltd." "公司名称")

(require 'doxymacs)
;; (add-hook 'c++-mode-hook 'doxymacs-mode)
;; (add-hook 'c-mode-hook 'doxymacs-mode)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
;; (add-hook 'c++-mode-common-hook 'doxymacs-mode)

(setq doxymacs-doxygen-style "C++")

;;If you want Doxygen keywords fontified use M-x doxymacs-font-lock
;;doxymacs 快捷键
;; 命令 英文解释  中文解释
;; C-c d ? will look up documentation for the symbol under the point.查找当前鼠标点下的符号的文档
;; C-c d r will rescan your Doxygen tags file.重新扫描tags文件
;; C-c d f will insert a Doxygen comment for the next function.为函数插入Doxygen注释
;; C-c d i will insert a Doxygen comment for the current file.为文件插入Doxygen注释
;; C-c d ; will insert a Doxygen comment for the current member.为当前成员插入Doxygen注释
;; C-c d m will insert a blank multiline Doxygen comment.插入多行注释
;; C-c d s will insert a blank singleline Doxygen comment.插入单行注释
;; C-c d @ will insert grouping comments around the current region.插入环绕当前区域的注释
(defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
        (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
;; (setq doxymacs-doxygen-style "C++") ;;设置默认模板为C++
;;Doxymacs C/C++注释模板
;;;doxymacs C/C++文件头注释模板
(defconst doxymacs-C++-file-comment-template
 '(
   "/*" > n
   "*" " =====================================================================================" > n
   "*" > n
   "*" "    Filename:  "
   (if (buffer-file-name)
       (file-name-nondirectory (buffer-file-name))
     "") > n
   "*" > n
   "*" " Description:  " (p "Brief description of this file: ") > n
   "*" > n
   "*" "    "> n
   "*" > n
   "*" "     Version:  " "0.1"> n
   "*" "     Created:  " (current-time-string) > n
   "*" > n
   "*" "     Authors:  " (user-full-name) (concat " , " user-mail-address) > n
   "*" "     Company:  " my-company > n
   "*" "    Revision:  " > n
   "*" " ======================================================================================" > n
   "*" " @0.1   " (concat (user-full-name) "  ")  (concat (current-time-string) " , create orignal file")  > n
   "*" " ======================================================================================" > n
   "*" " Copyright (c) , " my-company  > n
   "*" " ======================================================================================" > n
   "*/" > n)
 "Default C++-style template for file documentation.")



;;;Doxymacs C/C++函数注释模板
(defconst doxymacs-C++-function-comment-template
'((let ((next-func (doxymacs-find-next-func)))
     (if next-func
(list
 'l
 "/** " '> 'n
 " * " 'p '> 'n
 " * " '> 'n
      ;" * ===  FUNCTION  ======================================================================" > n
 (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
 (unless (string-match
                   (regexp-quote (cdr (assoc 'return next-func)))
                   doxymacs-void-types)
   '(l " * " > n " * " (doxymacs-doxygen-command-char)
"return " (p "Returns: ") > n))
 " */" '>)
       (progn
(error "Can't find next function declaration.")
nil))))
 "Default C++-style template for function documentation.")
(defconst doxymacs-C++-function-comment-template
 '((let ((next-func (doxymacs-find-next-func)))
     (if next-func
  (list
   'l
   " " '> 'n
   "/* " '> 'n
   "*" " ===  FUNCTION  ========================================================================" '>  'n
   "*" "         Name: " (cdr (assoc 'func (doxymacs-find-next-func)))
   (if (string-match (regexp-quote "static") (cdr (assoc 'return next-func)))
      "<private>") '> 'n
   "*" "  Description: " '(p "Brief description of this file: ") '> 'n
   "*" "   Parameters: " '> 'n
   (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
   (unless (string-match
                   (regexp-quote (cdr (assoc 'return next-func)))
                   doxymacs-void-types)
     '(l "* " > n "* "
   "Return Value: " (p  "Returns: ") > n))
   "*" "      Created: " (current-time-string) (concat " by" (user-full-name)) '> 'n
   "*" "     Revision: " '> 'n
   "*" " =======================================================================================" '> 'n
   "*" " @0.1   " (concat (user-full-name) "  ")  (concat (current-time-string) " , create orignal file")   '> 'n
   "*" " ======================================================================================="  '> 'n
   "*" " Copyright (c), " my-company   '> 'n
   "*" " ======================================================================================="  '> 'n
   "*/" '> 'n)
       (progn
  (error "Can't find next function declaraton.")
  nil))))
 "Default C++-style template for function documentation.")


;;;Doxymacs 单行C/C++注释模板
(defconst doxymacs-C++-blank-singleline-comment-template
 '("/* " p "  */")
 "Default C++-style template for a blank single line doxygen comment.")


;;;Doxymacs 多行C/C++注释模板
(defconst doxymacs-C++-blank-multiline-comment-template
 '(
   > n 
   "/*" > n 
   "* " p > n
   "* " > n
   "* " "Add by " (user-full-name) (concat " , " (current-time-string)) > n 
   "*/" > n)
 "Default C++-style template for a blank multiline doxygen comment.")

;; /*************************************************
;; Function: // 函数名称
;; Description: // 函数功能、性能等的描述
;; Calls: // 被本函数调用的函数清单
;; Called By: // 调用本函数的函数清单
;; Table Accessed: // 被访问的表（此项仅对于牵扯到数据库操作的程序）
;; Table Updated: // 被修改的表（此项仅对于牵扯到数据库操作的程序）
;; Input: // 输入参数说明，包括每个参数的作
;; // 用、取值说明及参数间关系。
;; Output: // 对输出参数的说明。
;; Return: // 函数返回值的说明
;; Others: // 其它说明
;; *************************************************/


;; /*********************************************************** 

;;  Function Name: //函数名 

;;  Function Description: //函数功能、性能等的描述 

;; Inputs: // 输入参数说明，包括每个参数的作用、取值说明及参数间关系。 

;;  Outputs: / /对输出参数的说明 

;;  Notes: // 本函数调用的函数清单及其他 

;; ************************************************************/

(provide 'doxymacs-settings)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; doxymacs-settings.el ends here
