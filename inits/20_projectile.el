;;; 20_projectile.el --- configurations.
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :demand t
  :diminish projectile-mode
  :bind
  (:map base-command-map
        ("p" . projectile-command-map))
  :custom
  (projectile-keymap-prefix (kbd "C-x p"))
  (projectile-known-projects-file (e:expand "projectile-bookmarks.eld" :cache))
  (projectile-cache-file (e:expand "projectile.cache" :cache))
  (projectile-enable-caching t)
  :config
  (projectile-global-mode))

(provide '20_projectile)
;;; 20_projectile.el ends here
