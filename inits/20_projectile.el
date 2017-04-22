;;; 20_projectile.el --- setup projectile.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/04/22 23:25:11>
;;

;;; Commentary:

;;; Code:

(use-package projectile
  :ensure t
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
