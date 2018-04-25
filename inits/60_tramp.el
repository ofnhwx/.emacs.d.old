;;; 60_tramp.el --- setup tramp.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 11:06:44>
;;

;;; Commentary:

;;; Code:

(use-package tramp
  :init
  (set-variable 'tramp-persistency-file-name (e:expand "tramp" :cache)))

(provide '60_tramp)
;;; 60_tramp.el ends here
