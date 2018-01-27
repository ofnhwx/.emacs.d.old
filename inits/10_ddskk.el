;;; 10_ddskk.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 00:37:18>
;;

;;; Commentary:

;;; Code:

(use-package skk
  :init
  (set-variable 'skk-user-directory (e:expand "ddskk" :conf))
  (set-variable 'skk-byte-compile-init-file t)
  (set-variable 'skk-isearch-start-mode 'latin)
  (set-variable 'skk-preload t))

(provide '10_ddskk)
;;; 10_ddskk.el ends here
