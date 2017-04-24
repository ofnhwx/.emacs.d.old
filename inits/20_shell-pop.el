;;; 20_shell-pop.el --- setup shell-pop.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 12:54:25>
;;

;;; Commentary:

;;; Code:

(use-package shell-pop
  :if (e:require-package 'shell-pop)
  :init
  (set-variable 'shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (set-variable 'shell-pop-term-shell (executable-find "fish"))
  (set-variable 'shell-pop-window-position "bottom")
  (set-variable 'shell-pop-window-size 30)
  (set-variable 'shell-pop-full-span t))

(provide '20_shell-pop)
;;; 20_shell-pop.el ends here
