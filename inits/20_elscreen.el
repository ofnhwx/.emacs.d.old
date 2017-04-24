;;; 20_elscreen.el --- setup elscreen.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/24 12:47:43>
;;

;;; Commentary:

;;; Code:

(use-package elscreen
  :if (e:require-package 'elscreen)
  :init
  (set-variable 'elscreen-prefix-key (kbd "C-z"))
  (set-variable 'elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
