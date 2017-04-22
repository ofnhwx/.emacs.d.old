;;; 20_git-gutter.el --- setup git-gutter.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:02:11>
;;

;;; Commentary:

;;; Code:

(use-package git-gutter-fringe
  :if window-system
  :diminish git-gutter-mode
  :init
  (e:require-package 'git-gutter-fringe)
  :config
  (global-git-gutter-mode))

(use-package git-gutter
  :if (not window-system)
  :diminish git-gutter-mode
  :init
  (e:require-package 'git-gutter)
  :config
  (global-git-gutter-mode))

(provide '20_git-gutter)
;;; 20_git-gutter.el ends here
