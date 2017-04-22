;;; 20_undo-tree.el --- setup undo-tree.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:05:52>
;;

;;; Commentary:

;;; Code:

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(provide '20_undo-tree)
;;; 20_undo-tree.el ends here
