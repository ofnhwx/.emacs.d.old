;;; 60_password-cache.el --- setup password-cache.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 11:01:47>
;;

;;; Commentary:

;;; Code:

(use-package password-cache
  :init
  (set-variable 'password-cache-expiry 3600))

(provide '60_password-cache)
;;; 60_password-cache.el ends here
