;;; 40_csv-mode.el --- setup csv-mode.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:13:20>
;;

;;; Commentary:

;;; Code:

(use-package csv-mode
  :if (e:require-package 'csv-mode))

(provide '40_csv-mode)
;;; 40_csv-mode.el ends here
