;;; 20_flycheck.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/29 11:07:32>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :if (e:require-package 'flycheck nil t)
  :init
  (set-variable 'flycheck-phpcs-standard "PSR2")
  :config
  (global-flycheck-mode t)
  ;; 追加パッケージ
  (use-package flycheck-swift
    :if (e:require-package 'flycheck-swift nil t)))

(provide '20_flycheck)
;;; 20_flycheck.el ends here
