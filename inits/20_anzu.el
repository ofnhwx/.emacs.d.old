;;; 20_anzu.el --- setup anzu.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:22:49>
;;

;;; Commentary:

;;; Code:

(use-package anzu
  :ensure t
  :diminish anzu-mode
  :config
  (custom-set-variables
   '(global-anzu-mode 1)))

(provide '20_anzu)
;;; 20_anzu.el ends here
