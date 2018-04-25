;;; 60_url-cookie.el --- setup url-cookie.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 11:08:56>
;;

;;; Commentary:

;;; Code:

(use-package url-cookie
  :init
  (set-variable 'url-cookie-file (e:expand "cookies" :cache)))

(provide '60_url-cookie)
;;; 60_url-cookie.el ends here
