;;; 10_exec-path-from-shell.el --- setup exec-path-from-shell.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:21>
;;

;;; Commentary:

;;; Code:

(use-package exec-path-from-shell
  :if (and (not (os-type-win-p))
           (e:require-package 'exec-path-from-shell nil t))
  :config
  (exec-path-from-shell-initialize))

(provide '10_exec-path-from-shell)
;;; 10_exec-path-from-shell.el ends here
