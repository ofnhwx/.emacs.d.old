;;; 20_minimap.el --- setup minimap.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:43:28>
;;

;;; Commentary:

;;; Code:

(use-package minimap
  :ensure t
  :config
  (custom-set-variables
   '(minimap-window-location 'right)))

(provide '20_minimap)
;;; 20_minimap.el ends here
