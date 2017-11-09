;;; 20_emmet-mode.el --- setup emmet-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 12:48:18>
;;

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :if (e:require-package 'emmet-mode)
  :init
  (set-variable 'emmet-indentation 2))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
