;;; 20_git-gutter.el --- setup git-gutter.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:37:22>
;;

;;; Commentary:

;;; Code:

(use-package git-gutter-fringe
  :if (and window-system
           (e:require-package 'git-gutter-fringe))
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(use-package git-gutter
  :if (and (not window-system)
           (e:require-package 'git-gutter))
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(provide '20_git-gutter)
;;; 20_git-gutter.el ends here
