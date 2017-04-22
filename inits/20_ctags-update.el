;;; 20_ctags-update.el --- setup ctags-update.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:27:05>
;;

;;; Commentary:

;;; Code:

(use-package ctags-update
  :if (executable-find "ctags")
  :init
  (e:require-package 'ctags-update))

(provide '20_ctags-update)
;;; 20_ctags-update.el ends here
