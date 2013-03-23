;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-05 14:03:31 Monday by ahei>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.





;; (defun tramp-settings ()
;;   "Settings of `tramp'."
;;   (setq tramp-default-method "sudo"))

;; (eval-after-load "tramp"
;;   `(tramp-settings))


(setq tramp-default-method "scp")
(setq tramp-auto-save-directory "~/emacs/tramp")
(setq auto-save-file-name-transforms
       '(("\\`/[^/]*:\\(.+/\\)*\\(.*\\)" "/tmp/\\2")))
(setq tramp-chunksize 328)
(require 'ange-ftp)
(require 'tramp)




(provide 'tramp-settings)
