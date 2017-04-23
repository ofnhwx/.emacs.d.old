;;; 60_dired.el --- setup dired.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:10:14>
;;

;;; Commentary:

;;; Code:

(use-package dired
  :config
  (use-package dired+
    :if (e:require-package 'dired+)))

(provide '60_dired)
;;; 60_dired.el ends here
