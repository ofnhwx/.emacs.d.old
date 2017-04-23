;;; 20_multiple-cursors.el --- setup multiple-cursors.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:22:21>
;;

;;; Commentary:

;;; Code:

(use-package multiple-cursors
  :if (e:require-package 'multiple-cursors)
  :init
  (custom-set-variables
   '(mc/list-file (e:expand ".mc-lists.el" :local))))

(provide '20multiple-cursors)
;;; 20_multiple-cursors.el ends here
