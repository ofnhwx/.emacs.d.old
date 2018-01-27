;;; 20_elscreen.el --- setup elscreen.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:51:54>
;;

;;; Commentary:

;;; Code:

(use-package elscreen
  :init
  (set-variable 'elscreen-prefix-key (kbd "C-z"))
  (set-variable 'elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
