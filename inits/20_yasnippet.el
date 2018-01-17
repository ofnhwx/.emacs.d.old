;;; 20_yasnippet.el --- setup yasnippet.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/17 16:09:05>
;;

;;; Commentary:

;;; Code:

(use-package yasnippet
  :if (e:require-package 'yasnippet nil t)
  :init
  (set-variable 'yas-prompt-functions '(yas-ido-prompt))
  :config
  (yas-global-mode t))

(provide '20_yasnippet)
;;; 20_yasnippet.el ends here
