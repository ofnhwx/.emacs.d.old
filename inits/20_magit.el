;;; 20_magit.el --- setup magit.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:26:59>
;;

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :config
  (custom-set-variables
   ;; 行内の差分に色付けする
   '(magit-diff-refine-hunk 'all)
   ;; 空白の差を無視しない
   '(smerge-refine-ignore-whitespace nil))
  (use-package magit-gitflow
    :ensure t
    :config
    (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)))

(provide '20_magit)
;;; 20_magit.el ends here
