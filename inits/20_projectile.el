;;; 20_projectile.el --- setup projectile.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/04 15:09:22>
;;

;;; Commentary:

;;; Code:

(use-package projectile
  :if (e:require-package 'projectile nil t)
  :diminish projectile-mode
  :init
  (set-variable 'projectile-keymap-prefix (kbd "C-x p"))
  (set-variable 'projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :local))
  (set-variable 'projectile-cache-file (e:expand "projectile.cache" :local))
  :config
  (defun helm-find-files-with-projectile (&optional arg)
    (interactive "P")
    (if (projectile-project-p)
        (helm-projectile-find-file arg)
      (helm-find-files arg)))
  (projectile-global-mode))

(provide '20_projectile)
;;; 20_projectile.el ends here
