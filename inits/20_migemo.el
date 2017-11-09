;;; 20_migemo.el --- setup migemo.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 12:52:51>
;;

;;; Commentary:

;;; Code:

(use-package migemo
  :if (and (executable-find "cmigemo")
           (e:require-package 'migemo))
  :init
  (set-variable 'migemo-options '("-q" "--emacs"))
  (set-variable 'migemo-user-dictionary nil)
  (set-variable 'migemo-regex-dictionary nil)
  (set-variable 'migemo-coding-system 'utf-8-unix)
  ;; for:`mac'
  (when (os-type-mac-p)
    (set-variable 'migemo-command (executable-find "cmigemo"))
    (set-variable 'migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))
  :config
  ;; 有効化
  (migemo-init))

(provide '20_migemo)
;;; 20_migemo.el ends here
