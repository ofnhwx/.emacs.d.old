;;; 20_projectile.el --- configurations.
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :custom
  (projectile-keymap-prefix (kbd "C-x p"))
  (projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :cache))
  (projectile-cache-file (e:expand "projectile.cache" :cache))
  :config
  (projectile-global-mode))

(provide '20_projectile)
;;; 20_projectile.el ends here
