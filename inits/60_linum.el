;;; 60_linum.el --- setup linum.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package linum
  :config
  (use-package hlinum
    :if (e:require-package 'hlinum nil t)
    :config
    (hlinum-activate)))

(provide '60_linum)
;;; 60_linum.el ends here
