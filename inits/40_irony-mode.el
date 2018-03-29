;;; 40_irony-mode.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/03/29 16:03:44>
;;

;;; Commentary:

;;; Code:

(use-package irony
  :init
  (set-variable 'irony-additional-clang-options '("-std=c++11"))
  :config
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode))

(provide '40_irony-mode)
;;; 40_irony-mode.el ends here
