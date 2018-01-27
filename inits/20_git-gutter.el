;;; 20_git-gutter.el --- setup git-gutter.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:53:03>
;;

;;; Commentary:

;;; Code:

(use-package git-gutter-fringe
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(use-package git-gutter
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(provide '20_git-gutter)
;;; 20_git-gutter.el ends here
