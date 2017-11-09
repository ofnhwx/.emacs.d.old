;;; 20_editorconfig.el --- setup editorconfig.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 11:50:53>
;;

;;; Commentary:

;;; Code:

(use-package editorconfig
  :if (e:require-package 'editorconfig)
  :diminish editorconfig-mode
  :config
  (editorconfig-mode))

(provide '20_editorconfig)
;;; 20_editorconfig.el ends here
