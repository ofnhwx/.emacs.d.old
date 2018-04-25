;;; 60_abbrev.el --- setup template.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 10:36:15>
;;

;;; Commentary:

;;; Code:

(use-package abbrev
  :diminish abbrev-mode
  :init
  (set-variable 'abbrev-file-name (e:expand "abbrev.defs" :cache))
  (set-variable 'save-abbrevs t)
  :config
  (when (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file)))

(provide '60_abbrev)
;;; 60_abbrev.el ends here
