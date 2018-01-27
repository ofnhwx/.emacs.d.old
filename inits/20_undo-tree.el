;;; 20_undo-tree.el --- setup undo-tree.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:13:43>
;;

;;; Commentary:

;;; Code:

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(provide '20_undo-tree)
;;; 20_undo-tree.el ends here
