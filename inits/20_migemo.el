;;; 20_migemo.el --- setup migemo.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:14:07>
;;

;;; Commentary:

;;; Code:

(use-package migemo
  :if (executable-find "cmigemo")
  :init
  (e:require-package 'migemo)
  :config
  (custom-set-variables
   '(migemo-options '("-q" "--emacs"))
   '(migemo-user-dictionary nil)
   '(migemo-regex-dictionary nil)
   '(migemo-coding-system 'utf-8-unix))
  ;; for:`mac'
  (when (os-type-mac-p)
    (custom-set-variables
     '(migemo-command (executable-find "cmigemo"))
     '(migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")))
  ;; 有効化
  (migemo-init))

(provide '20_migemo)
;;; 20_migemo.el ends here
