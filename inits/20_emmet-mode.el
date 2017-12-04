;;; 20_emmet-mode.el --- setup emmet-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :if (e:require-package 'emmet-mode nil t)
  :init
  (set-variable 'emmet-indentation 2))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
