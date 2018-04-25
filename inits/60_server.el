;;; 60_server.el --- setup server.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 11:04:49>
;;

;;; Commentary:

;;; Code:

(use-package server
  :init
  (set-variable 'server-auth-dir (e:expand "server" :cache))
  :config
  (when window-system
    (add-hook 'after-init-hook 'server-start)))

(provide '60_server)
;;; 60_server.el ends here
