
(defun my-c-mode-common-hook ()  
(setq default-tab-width 4)  
(setq tab-width 4)  
(setq c-basic-offset 4)  
(hs-minor-mode t)  
)  
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)  

;; C语言设置  
(defun my-c-mode-hook ()  
(c-set-style "stroustrup"))  
(add-hook 'c-mode-hook 'my-c-mode-hook)  
;; C++设置  
(defun my-c++-mode-hook ()  
(c-set-style "stroustrup"))  
(add-hook 'c++-mode-hook 'my-c++-mode-hook)  
(add-hook 'c-mode-hook 'my-c++-mode-hook)  

(provide 'C-settings)

