;;; 40_git-modes.el --- setup git-modes.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package gitattributes-mode
  :if (e:require-package 'gitattributes-mode nil t))

(use-package gitconfig-mode
  :if (e:require-package 'gitconfig-mode nil t))

(use-package gitignore-mode
  :if (e:require-package 'gitignore-mode nil t))

(provide '40_git-modes)
;;; 40_git-modes.el ends here
