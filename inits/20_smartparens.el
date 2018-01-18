;;; 20_smartparens.el --- setup smartparens.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package smartparens
  :if (e:require-package 'smartparens nil t)
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))

(provide '20_smartparens)
;;; 20_smartparens.el ends here
