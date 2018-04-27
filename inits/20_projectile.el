;;; 20_projectile.el --- configurations.
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init
  (set-variable 'projectile-keymap-prefix (kbd "C-x p"))
  (set-variable 'projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :cache))
  (set-variable 'projectile-cache-file (e:expand "projectile.cache" :cache))
  :config
  (projectile-global-mode))

(provide '20_projectile)
;;; 20_projectile.el ends here
