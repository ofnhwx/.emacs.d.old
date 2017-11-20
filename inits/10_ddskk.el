;;; 10_ddskk.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/20 10:45:38>
;;

;;; Commentary:

;;; Code:

(use-package skk
  :if (e:require-package 'ddskk nil t)
  :init
  (set-variable 'skk-user-directory (e:expand "ddskk" :conf))
  (set-variable 'skk-byte-compile-init-file t)
  (set-variable 'skk-isearch-start-mode 'latin)
  (set-variable 'skk-preload t))

(provide '10_ddskk)
;;; 10_ddskk.el ends here
