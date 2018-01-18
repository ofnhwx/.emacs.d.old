;;; 60_menu-bar.el --- setup menu-bar.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package menu-bar
  :config
  (use-package menu-bar+
    :if (e:require-package 'menu-bar+ nil t)))

(provide '60_menu-bar)
;;; 60_menu-bar.el ends here
