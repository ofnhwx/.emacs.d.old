;;; 20_magit.el --- configurations.
;;; Commentary:
;;; Code:

(use-package magit
  :ensure
  :init
  (set-variable 'magit-diff-refine-hunk 'all)
  (set-variable 'smerge-refine-ignore-whitespace nil))

(use-package magit-gitflow
  :after (magit)
  :ensure t
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(provide '20_magit)
;;; 20_magit.el ends here
