;;; 20_selected.el --- configurations.
;;; Commentary:
;;; Code:

(use-package selected
  :ensure t
  :diminish selected-minor-mode
  :config
  (bind-keys
   :map selected-keymap
   ("=" . count-words-region)
   ("d" . downcase-region)
   ("q" . selected-off)
   ("u" . upcase-region))
  (selected-global-mode))

(use-package helm-selected
  :after (helm selected)
  :ensure t
  :config
  (bind-keys
   :map selected-keymap
   ("?" . helm-selected)))

(provide '20_selected)
;;; 20_selected.el ends here
