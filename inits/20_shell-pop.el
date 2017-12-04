;;; 20_shell-pop.el --- setup shell-pop.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:22>
;;

;;; Commentary:

;;; Code:

(use-package shell-pop
  :if (e:require-package 'shell-pop nil t)
  :init
  ;;(set-variable 'shell-pop-shell-type '(("ansi-term" "*ansi-term*" (lambda () (ansi-term shell-pop-term-shell)))))
  ;;(set-variable 'shell-pop-term-shell (executable-find "fish"))
  (set-variable 'shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
  (set-variable 'shell-pop-window-position "bottom")
  (set-variable 'shell-pop-window-size 30)
  (set-variable 'shell-pop-full-span t))

(provide '20_shell-pop)
;;; 20_shell-pop.el ends here
