;;; 20_smartparens.el --- setup smartparens.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:09:47>
;;

;;; Commentary:

;;; Code:

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))

(provide '20_smartparens)
;;; 20_smartparens.el ends here
