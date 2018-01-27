;;; 20_projectile.el --- setup projectile.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/01/28 01:10:23>
;;

;;; Commentary:

;;; Code:

(use-package projectile
  :diminish projectile-mode
  :init
  (set-variable 'projectile-keymap-prefix (kbd "C-x p"))
  (set-variable 'projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :cache))
  (set-variable 'projectile-cache-file (e:expand "projectile.cache" :cache))
  :config
  (projectile-global-mode))

(use-package projectile)

(provide '20_projectile)
;;; 20_projectile.el ends here
