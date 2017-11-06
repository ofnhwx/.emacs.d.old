;;; 40_typescript-mode.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/06 15:32:38>
;;

;;; Commentary:

;;; Code:

(use-package typescript-mode
  :if (e:require-package 'typescript-mode nil t))

(provide '40_typescript-mode)
;;; 40_typescript-mode.el ends here
