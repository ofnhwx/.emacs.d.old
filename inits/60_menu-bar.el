;;; 60_menu-bar.el --- setup menu-bar.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:07:45>
;;

;;; Commentary:

;;; Code:

(use-package menu-bar
  :config
  (use-package menu-bar+
    :if (e:require-package 'menu-bar+)))

(provide '60_menu-bar)
;;; 60_menu-bar.el ends here
