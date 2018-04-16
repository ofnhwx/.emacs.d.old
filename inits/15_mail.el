;;; 15_mail.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/15 14:36:52>
;;

;;; Commentary:

;;; Code:

(use-package notmuch
  :init
  (set-variable 'notmuch-search-oldest-first nil))

(provide '15_mail)
;;; 15_mail.el ends here
