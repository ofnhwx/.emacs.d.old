;;; 20_shell-pop.el --- setup shell-pop.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:46:25>
;;

;;; Commentary:

;;; Code:

(use-package shell-pop
  :ensure t
  :config
  (custom-set-variables
   '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
   `(shell-pop-term-shell ,(executable-find "fish"))
   '(shell-pop-window-position "bottom")
   '(shell-pop-window-size 30)
   '(shell-pop-full-span t)))

(provide '20_shell-pop)
;;; 20_shell-pop.el ends here
