;;; 20_dump-jump.el --- setup dumb-jump.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:51:40>
;;

;;; Commentary:

;;; Code:

(use-package dumb-jump
  :after (helm)
  :init
  (set-variable 'dumb-jump-selector 'helm))

(provide '20_dump-jump)
;;; 20_dump-jump.el ends here
