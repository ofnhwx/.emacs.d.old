;;; 20_which-key.el --- setup which-key.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:15:17>
;;

;;; Commentary:

;;; Code:

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(provide '20_which-key)
;;; 20_which-key.el ends here
