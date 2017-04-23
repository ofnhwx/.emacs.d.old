;;; 20_elscreen.el --- setup elscreen.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:51:17>
;;

;;; Commentary:

;;; Code:

(use-package elscreen
  :if (e:require-package 'elscreen)
  :init
  (custom-set-variables
   '(elscreen-prefix-key (kbd "C-z"))
   '(elscreen-tab-display-kill-screen nil))
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
