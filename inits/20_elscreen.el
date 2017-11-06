;;; 20_elscreen.el --- setup elscreen.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/06 18:26:39>
;;

;;; Commentary:

;;; Code:

(use-package elscreen
  :if (e:require-package 'elscreen nil t)
  :init
  (set-variable 'elscreen-prefix-key (kbd "C-z"))
  (set-variable 'elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
