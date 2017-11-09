;;; 20_ctags-update.el --- setup ctags-update.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:49:33>
;;

;;; Commentary:

;;; Code:

(use-package ctags-update
  :if (and (executable-find "ctags")
           (e:require-package 'ctags-update)))

(provide '20_ctags-update)
;;; 20_ctags-update.el ends here
