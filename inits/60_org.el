;;; 60_org.el --- setup org.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 11:05:35>
;;

;;; Commentary:

;;; Code:

(use-package org
  :init
  (set-variable 'org-directory (e:expand "org" :home))
  (set-variable 'org-agenda-files
                (cl-remove-if 'file-directory-p (directory-files (e:expand "agenda" org-directory) t))))

(provide '60_org)
;;; 60_org.el ends here
