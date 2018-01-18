;;; 20_dump-jump.el --- setup dumb-jump.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/19 15:46:01>
;;

;;; Commentary:

;;; Code:

(use-package dumb-jump
  :if (e:require-package 'dumb-jump nil t)
  :init
  (set-variable 'dumb-jump-selector 'helm))

(provide '20_dump-jump)
;;; 20_dump-jump.el ends here
