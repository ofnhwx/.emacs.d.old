;;; 15_mail.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/20 22:15:42>
;;

;;; Commentary:

;;; Code:

(use-package notmuch
  :init
  (set-variable 'notmuch-archive-tags '("-inbox" "-unread"))
  (set-variable 'notmuch-search-oldest-first nil)
  (set-variable 'notmuch-show-logo nil)
  :config
  (setenv "XAPIAN_CJK_NGRAM" "1"))

(provide '15_mail)
;;; 15_mail.el ends here
