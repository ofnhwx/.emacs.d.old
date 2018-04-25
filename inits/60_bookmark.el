;;; 60_bookmark.el --- setup bookmark.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:38:38>
;;

;;; Commentary:

;;; Code:

(use-package bookmark
  :init
  (set-variable 'bookmark-default-file (e:expand "bookmark" :cache)))

(provide '60_bookmark)
;;; 60_bookmark.el ends here
