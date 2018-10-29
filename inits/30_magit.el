;;; 30_magit.el --- configurations.
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :defer t
  :custom
  (magit-log-margin '(t "%Y-%m-%d %H:%M" magit-log-margin-width t 15))
  (magit-diff-refine-hunk 'all)
  (smerge-refine-ignore-whitespace nil))

(use-package magit-gitflow
  :after (magit)
  :ensure t
  :hook (magit-mode . turn-on-magit-gitflow))

(provide '30_magit)
;;; 30_magit.el ends here
