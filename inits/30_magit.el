;;; 20_magit.el --- configurations.
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :defer t
  :custom
  (magit-diff-refine-hunk 'all)
  (smerge-refine-ignore-whitespace nil))

(use-package magit-gitflow
  :after (magit)
  :ensure t
  :hook (magit-mode-hook . turn-on-magit-gitflow))

(provide '20_magit)
;;; 20_magit.el ends here
