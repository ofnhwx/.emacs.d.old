;;; 60_autoinsert.el --- setup autoinsert.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:37:24>
;;

;;; Commentary:

;;; Code:

(use-package autoinsert
  :init
  (set-variable 'auto-insert-directory (e:expand "insert" :cache))
  :config
  (auto-insert-mode 1))

(provide '60_autoinsert)
;;; 60_autoinsert.el ends here
