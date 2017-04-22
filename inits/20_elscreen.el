;;; 20_elscreen.el --- setup elscreen.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 19:02:36>
;;

;;; Commentary:

;;; Code:

(use-package elscreen
  :ensure t
  :config
  (custom-set-variables
   '(elscreen-prefix-key (kbd "C-z"))
   '(elscreen-tab-display-kill-screen nil))
  (elscreen-start))

(provide '20_elscreen)
;;; 20_elscreen.el ends here
