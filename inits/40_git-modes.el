;;; 40_git-modes.el --- setup git-modes.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 18:48:45>
;;

;;; Commentary:

;;; Code:

(use-package gitattributes-mode
  :if (e:require-package 'gitattributes-mode))

(use-package gitconfig-mode
  :if (e:require-package 'gitconfig-mode))

(use-package gitignore-mode
  :if (e:require-package 'gitignore-mode))

(provide '40_git-modes)
;;; 40_git-modes.el ends here
