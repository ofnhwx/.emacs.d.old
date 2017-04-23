;;; 20_smartparens.el --- setup smartparens.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:17:41>
;;

;;; Commentary:

;;; Code:

(use-package smartparens
  :if (e:require-package 'smartparens)
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))

(provide '20_smartparens)
;;; 20_smartparens.el ends here
