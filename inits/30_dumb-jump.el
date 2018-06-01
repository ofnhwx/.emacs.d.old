;;; 30_dump-jump.el --- configurations.
;;; Commentary:
;;; Code:

(use-package dumb-jump
  :ensure t
  :defer t
  :bind
  (:map search-map
        ("g" . dumb-jump-go)
        ("b" . dumb-jump-back)
        ("q" . dumb-jump-quick-look)))

(use-package dumb-jump
  :no-require t
  :after (helm)
  :custom
  (dumb-jump-selector 'helm))

(provide '30_dump-jump)
;;; 30_dump-jump.el ends here
