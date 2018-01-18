;;; 20_editorconfig.el --- setup editorconfig.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:22>
;;

;;; Commentary:

;;; Code:

(use-package editorconfig
  :if (e:require-package 'editorconfig nil t)
  :diminish editorconfig-mode
  :config
  (editorconfig-mode))

(provide '20_editorconfig)
;;; 20_editorconfig.el ends here
