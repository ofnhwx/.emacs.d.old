;;; 10_exec-path-from-shell.el --- setup exec-path-from-shell.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:18:39>
;;

;;; Commentary:

;;; Code:

(use-package exec-path-from-shell
  :if (not (os-type-win-p))
  :init
  (e:require-package 'exec-path-from-shell)
  :config
  (exec-path-from-shell-initialize))

(provide '10_exec-path-from-shell)
;;; 10_exec-path-from-shell.el ends here
