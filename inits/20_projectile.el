;;; 20_projectile.el --- setup projectile.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/23 12:18:45>
;;

;;; Commentary:

;;; Code:

(use-package projectile
  :if (e:require-package 'projectile)
  :diminish projectile-mode
  :init
  (custom-set-variables
   '(projectile-keymap-prefix (kbd "C-x p")))
  :config
  (custom-set-variables
   '(projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :local))
   '(projectile-cache-file (e:expand "projectile.cache" :local)))
  (defun helm-find-files-with-projectile (&optional arg)
    (interactive "P")
    (if (projectile-project-p)
        (helm-projectile-find-file arg)
      (helm-find-files arg)))
  (projectile-global-mode))

(provide '20_projectile)
;;; 20_projectile.el ends here
