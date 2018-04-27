;;; 20_dump-jump.el --- configurations.
;;; Commentary:
;;; Code:

(use-package dumb-jump
  :ensure t)

(use-package dumb-jump
  :no-require t
  :after (helm)
  :init
  (set-variable 'dumb-jump-selector 'helm))

(provide '20_dump-jump)
;;; 20_dump-jump.el ends here
