;;; 20_anzu.el --- setup anzu.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 10:41:33>
;;

;;; Commentary:

;;; Code:

(use-package anzu
  :if (e:require-package 'anzu)
  :diminish anzu-mode
  :init
  (custom-set-variables
   '(global-anzu-mode 1)))

(provide '20_anzu)
;;; 20_anzu.el ends here
