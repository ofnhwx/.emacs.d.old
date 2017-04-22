;;; 20_editorconfig.el --- setup editorconfig.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 00:20:06>
;;

;;; Commentary:

;;; Code:

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode))

(provide '20_editorconfig)
;;; 20_editorconfig.el ends here
