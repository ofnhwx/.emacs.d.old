;;; 20_open-junk-file.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/04 16:09:50>
;;

;;; Commentary:

;;; Code:

(use-package open-junk-file
  :init
  (set-variable 'open-junk-file-format (e:expand "junk/%Y%m%d_%H%M%S." :cache)))

(provide '20_open-junk-file)
;;; 20_open-junk-file.el ends here
