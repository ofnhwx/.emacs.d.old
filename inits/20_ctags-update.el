;;; 20_ctags-update.el --- setup ctags-update.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 15:33:47>
;;

;;; Commentary:

;;; Code:

(use-package ctags-update
  :after (php-mode)
  :config
  (add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode))

(provide '20_ctags-update)
;;; 20_ctags-update.el ends here
