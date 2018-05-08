;;; 20_selected.el --- configurations.
;;; Commentary:
;;; Code:

(use-package selected
  :ensure t
  :demand t
  :diminish selected-minor-mode
  :bind
  (:map selected-keymap
        ("=" . count-words-region)
        ("d" . downcase-region)
        ("q" . selected-off)
        ("u" . upcase-region))
  :config
  (selected-global-mode))

(use-package helm-selected
  :after (helm selected)
  :ensure t
  :defer t
  :bind
  (:map selected-keymap
        ("?" . helm-selected)))

(provide '20_selected)
;;; 20_selected.el ends here
