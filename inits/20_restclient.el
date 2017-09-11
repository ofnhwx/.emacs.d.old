;;; 20_restclient.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/07/25 15:11:40>
;;

;;; Commentary:

;;; Code:

(use-package restclient
  :if (e:require 'restclient)
  :config
  (use-package restclient-helm
    :if (e:require 'restclient-helm)))

(provide '20_restclient)
;;; 20_restclient.el ends here
