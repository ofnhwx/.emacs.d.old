;;; 40_irony-mode.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/04 16:04:13>
;;

;;; Commentary:

;;; Code:

(use-package irony
  :init
  (set-variable 'irony-additional-clang-options '("-std=c++11"))
  (set-variable 'irony-user-dir (e:expand "irony" :cache))
  :config
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode)
  (defun irony-add-include (path)
    (add-to-list 'irony-additional-clang-options (format "-I%s" path)))
  (e:load-local-config "irony"))

(provide '40_irony-mode)
;;; 40_irony-mode.el ends here
