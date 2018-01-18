;;; 20_sudo-edit.el --- setup sudo-edit.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:20>
;;

;;; Commentary:

;;; Code:

(use-package sudo-edit
  :if (e:require-package 'sudo-edit nil t))

(provide '20_sudo-edit)
;;; 20_sudo-edit.el ends here
