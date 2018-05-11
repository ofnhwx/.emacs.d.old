;;; 20_avy.el --- configurations.
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :defer t
  :bind
  (:map base-command-map
        (":" . avy-goto-char)
        (";" . avy-goto-word-1))
  (:map general-command-map
        ("g" . avy-goto-line))
  (:map global-map
        ("C-:" . avy-goto-char)
        ("C-;" . avy-goto-word-1))
  (:map mode-specific-map
        (":" . avy-goto-char)
        (";" . avy-goto-word-1))
  (:map isearch-mode-map
        ("C-i" . avy-isearch)))

(use-package ace-link
  :ensure t
  :demand t
  :config
  (ace-link-setup-default))

(use-package ace-window
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("C-^" . ace-window))
  (:map ctl-x-map
        ("o" . ace-window)))

(e:use-package avy-migemo
  (executable-find "cmigemo")
  :after (migemo)
  :ensure t
  :demand t
  :config
  (avy-migemo-mode 1))

(use-package avy-zap
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-z" . avy-zap-to-char-dwim)))

(provide '20_avy)
;;; 20_avy.el ends here
