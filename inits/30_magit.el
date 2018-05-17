;;; 20_magit.el --- configurations.
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :defer t
  :bind
  (:map file-command-map
        ("m" . magit-find-file))
  (:map general-command-map
        ("d" . magit-diff-buffer-file-popup)
        ("l" . magit-log-buffer-file-popup)
        ("s" . magit-status))
  :custom
  (magit-log-margin '(t "%Y-%m-%d %H:%M" magit-log-margin-width t 15))
  (magit-diff-refine-hunk 'all)
  (smerge-refine-ignore-whitespace nil))

(use-package magit-gitflow
  :after (magit)
  :ensure t
  :hook (magit-mode . turn-on-magit-gitflow))

(provide '20_magit)
;;; 20_magit.el ends here
