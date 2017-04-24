;;; 00_template.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 12:48:45>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :if (e:require-package 'flycheck)
  :config
  (global-flycheck-mode t))

(provide '00_template)
;;; 00_template.el ends here
