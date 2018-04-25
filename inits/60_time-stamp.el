;;; 60_time-stamp.el --- setup time-stamp.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/25 11:00:32>
;;

;;; Commentary:

;;; Code:

(use-package time-stamp
  :init
  (set-variable 'time-stamp-active t)
  (set-variable 'time-stamp-start  (concat "Last " "updated: <"))
  (set-variable 'time-stamp-format "%04y/%02m/%02d %02H:%02M:%02S")
  (set-variable 'time-stamp-end    ">")
  :config
  (add-hook 'before-save-hook 'time-stamp))

(provide '60_time-stamp)
;;; 60_time-stamp.el ends here
