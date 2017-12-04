;;; 20_undo-tree.el --- setup undo-tree.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package undo-tree
  :if (e:require-package 'undo-tree nil t)
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(provide '20_undo-tree)
;;; 20_undo-tree.el ends here
