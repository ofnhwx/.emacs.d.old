;;; 20_flycheck.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/07 15:22:47>
;;

;;; Commentary:

;;; Code:

(use-package flycheck
  :if (e:require-package 'flycheck nil t)
  :config
  (global-flycheck-mode t)
  ;; 追加パッケージ
  (use-package flycheck-swift
    :if (e:require-package 'flycheck-swift nil t)))

(provide '20_flycheck)
;;; 20_flycheck.el ends here
