;;; 20_magit.el --- setup magit.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:02:49>
;;

;;; Commentary:

;;; Code:

(use-package magit
  :init
  (set-variable 'magit-diff-refine-hunk 'all)
  (set-variable 'smerge-refine-ignore-whitespace nil))

(use-package magit-gitflow
  :after (magit)
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(provide '20_magit)
;;; 20_magit.el ends here
