;;; 30_dump-jump.el --- configurations.
;;; Commentary:
;;; Code:

(use-package dumb-jump
  :ensure t
  :defer t)

(use-package dumb-jump
  :no-require t
  :after (helm)
  :custom
  (dumb-jump-selector 'helm))

(provide '30_dump-jump)
;;; 30_dump-jump.el ends here
