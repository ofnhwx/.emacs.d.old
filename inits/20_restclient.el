;;; 20_restclient.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/09/12 00:09:00>
;;

;;; Commentary:

;;; Code:

(use-package restclient
  :if (e:require-package 'restclient nil t)
  :config
  (use-package restclient-helm
    :if (e:require-package 'restclient-helm nil t)))

(provide '20_restclient)
;;; 20_restclient.el ends here
