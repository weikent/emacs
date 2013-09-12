;; (defun my-c-mode-common-hook ()  
;;   (setq default-tab-width 4)  
;;   (setq tab-width 4)  
;;   (setq c-basic-offset 4)  
;;   (hs-minor-mode t)  
;;   )  
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)  





;; C语言设置  
(defun my-c-mode-hook ()  
  (c-set-style "awk"))  
(add-hook 'c-mode-hook 'my-c-mode-hook)  
;; C++设置  
(defun my-c++-mode-hook ()  
  (c-set-style "stroustrup"))  
(add-hook 'c++-mode-hook 'my-c-mode-hook)  
(add-hook 'c-mode-hook 'my-c-mode-hook) 


(defconst mystyle
  '((setq indent-tabs-mode nil))
  "mystyle" )
(c-add-style "mystyle" mystyle)
(defun myhook()
  (setq indent-tabs-mode nil)
  (c-set-style "mystyle"))
(add-hook 'c++-mode-hook 'myhook)
(add-hook 'c-mode-hook 'myhook)

;; ;; (setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
;; ;; 	      c-indent-level 4         ; A TAB is equivilent to four spaces
;; ;; 	      c-argdecl-indent 0       ; Do not indent argument decl's extra
;; ;; 	      c-tab-always-indent t
;; ;; 	      backward-delete-function nil) ; DO NOT expand tabs when deleting
;; ;; (c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
;; ;; (defun my-c-mode-hook ()
;; ;;   (c-set-style "my-c-style")
;; ;;   (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
;; ;;   (c-set-offset 'inline-open '+)
;; ;;   (c-set-offset 'block-open '+)
;; ;;   (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
;; ;;   (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
;; ;; (add-hook 'c-mode-hook 'my-c-mode-hook)

;; ;; (add-hook 'c++-mode-hook
;; ;;           (lambda () (setq comment-start "/* " comment-end " */")))
;; ;; (add-hook 'c++-mode-hook 'my-c-mode-hook)



(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))
(require 'eassist nil 'noerror)
(global-set-key [M-f12] 'eassist-switch-h-cpp)
;;(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)


(provide 'C-settings)



