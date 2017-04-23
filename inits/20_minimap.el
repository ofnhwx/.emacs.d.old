;;; 20_minimap.el --- setup minimap.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:22:37>
;;

;;; Commentary:

;;; Code:

(use-package minimap
  :if (e:require-package 'minimap)
  :init
  (custom-set-variables
   '(minimap-window-location 'right)))

(provide '20_minimap)
;;; 20_minimap.el ends here
