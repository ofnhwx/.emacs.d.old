;;; 60_ediff.el --- setup ediff.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:57:08>
;;

;;; Commentary:

;;; Code:

(use-package ediff
  :init
  (set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)
  (set-variable 'ediff-split-window-function 'split-window-horizontally))

(provide '60_ediff)
;;; 60_ediff.el ends here
