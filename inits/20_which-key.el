;;; 20_which-key.el --- setup which-key.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:20>
;;

;;; Commentary:

;;; Code:

(use-package which-key
  :if (e:require-package 'which-key nil t)
  :diminish which-key-mode
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(provide '20_which-key)
;;; 20_which-key.el ends here
