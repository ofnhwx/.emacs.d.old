;;; 20_emmet-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package emmet-mode
  :ensure t
  :defer t
  :bind
  (:map emmet-mode-keymap
        ("<C-return>" . nil)
        ("C-c C-j" . emmet-expand-line)
        ("C-j" . nil))
  :hook
  ((php-mode-hook . emmet-mode)
   (web-mode-hook . emmet-mode))
  :custom
  (emmet-indentation 2))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
