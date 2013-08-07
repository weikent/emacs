;;; my-paren-settings.el --- 

;; Copyright 2013 weishijian
;;
;; Author: weishijian@weishijian-MacUbuntu
;; Version: $Id: my-paren-settings.el,v 0.0 2013/08/07 14:06:05 weishijian Exp $
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
;;   (require 'my-paren-settings)

;;; Code:
;; 填入大中小括号，双单引号的匹配
;; 详细格式可以参照C-h f skeleton-pair-alist  
(setq skeleton-pair-alist  
      '((?\" _ "\"" >)
        (?\' _ "\'" >)
        (?\( _ ")" >)
        (?\[ _ "]" >)
        (?\{ _ "}" >)))

(setq skeleton-pair t)

;; 绑定全局键值
;; 也可以绑定单独到某个mode，比如cc-mode (define-key cc-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)

(provide 'my-paren-settings)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; my-paren-settings.el ends here
