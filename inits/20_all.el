;;; 20_all.el --- setup all.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 10:40:45>
;;

;;; Commentary:

;;; Code:

(use-package all
  :if (e:require-package 'all)
  :config
  (use-package all-ext
    :if (e:require-package 'all-ext)))

(provide '20_all)
;;; 20_all.el ends here
