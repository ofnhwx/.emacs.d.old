;;; 20_git-gutter.el --- configurations.
;;; Commentary:
;;; Code:

(use-package git-gutter-fringe
  :if (not window-system)
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(use-package git-gutter
  :if (bound-and-true-p window-system)
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode))

(provide '20_git-gutter)
;;; 20_git-gutter.el ends here
