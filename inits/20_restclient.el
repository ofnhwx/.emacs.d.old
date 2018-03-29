;;; 20_restclient.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:21:42>
;;

;;; Commentary:

;;; Code:

(use-package restclient)

(use-package restclient-helm
  :after (restclient helm))

(provide '20_restclient)
;;; 20_restclient.el ends here
