;;; 60_ido.el --- configurations.
;;; Commentary:
;;; Code:

(use-package ido
  :init
  (set-variable 'ido-enable-flex-matching t)
  (set-variable 'ido-save-directory-list-file (e:expand ".ido.last" :cache))
  :config
  (ido-everywhere 1)
  (ido-mode 1))

(use-package ido
  :no-require t
  :after (helm-dired-history)
  :config
  (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil))

(use-package bbyac
  :after (ido)
  :ensure t
  :init
  (set-variable 'bbyac-max-chars 99999))

(use-package flx-ido
  :after (ido)
  :ensure t
  :config
  (flx-ido-mode))

(use-package ido-completing-read+
  :after (ido)
  :ensure t
  :config
  (ido-ubiquitous-mode t))

(use-package ido-hacks
  :after (ido)
  :ensure t
  :config
  (let ((hacks "^ido-hacks-"))
    (ad-enable-regexp hacks)
    (ad-activate-regexp hacks)))

(use-package ido-vertical-mode
  :after (ido)
  :ensure t
  :config
  (ido-vertical-mode t))

(use-package ido-yes-or-no
  :after (ido)
  :ensure t
  :config
  (ido-yes-or-no-mode t))

(provide '60_ido)
;;; 60_ido.el ends here
