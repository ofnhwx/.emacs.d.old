;;; 20_bar-cursor.el --- setup bar-cursor.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package bar-cursor
  :if (e:require-package 'bar-cursor nil t)
  :diminish bar-cursor-mode
  :config
  (bar-cursor-mode 1))

(provide '20_bar-cursor)
;;; 20_bar-cursor.el ends here
