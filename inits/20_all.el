;;; 20_all.el --- setup all.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:23>
;;

;;; Commentary:

;;; Code:

(use-package all
  :if (e:require-package 'all nil t)
  :config
  (use-package all-ext
    :if (e:require-package 'all-ext nil t)))

(provide '20_all)
;;; 20_all.el ends here
