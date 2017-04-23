;;; 20_emmet-mode.el --- setup emmet-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:51:55>
;;

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :if (e:require-package 'emmet-mode)
  :init
  (custom-set-variables
   '(emmet-indentation 2)))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
