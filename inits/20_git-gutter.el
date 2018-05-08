;;; 20_git-gutter.el --- configurations.
;;; Commentary:
;;; Code:

(e:use-package git-gutter-fringe
  (not window-system)
  :ensure t
  :demand t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(e:use-package git-gutter
  window-system
  :ensure t
  :demand t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(provide '20_git-gutter)
;;; 20_git-gutter.el ends here
