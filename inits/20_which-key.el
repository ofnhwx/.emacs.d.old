;;; 20_which-key.el --- setup which-key.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:15:50>
;;

;;; Commentary:

;;; Code:

(use-package which-key
  :if (e:require-package 'which-key)
  :diminish which-key-mode
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(provide '20_which-key)
;;; 20_which-key.el ends here
