;;; 20_magit.el --- setup magit.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/10/02 14:04:54>
;;

;;; Commentary:

;;; Code:

(use-package magit
  :if (e:require-package 'magit)
  :init
  (set-variable 'magit-diff-refine-hunk 'all)       ;; 行内の差分に色付けする
  (set-variable 'smerge-refine-ignore-whitespace t) ;; 空白の差を無視する
  :config
  (use-package magit-gitflow
    :if (e:require-package 'magit-gitflow)
    :config
    (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)))

(provide '20_magit)
;;; 20_magit.el ends here
