;;; 20_anzu.el --- setup anzu.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package anzu
  :if (e:require-package 'anzu nil t)
  :diminish anzu-mode
  :config
  (global-anzu-mode 1))

(provide '20_anzu)
;;; 20_anzu.el ends here
