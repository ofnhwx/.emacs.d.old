;;; 30_emmet-mode.el --- configurations.
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
  ((php-mode . emmet-mode)
   (web-mode . emmet-mode))
  :custom
  (emmet-indentation 2))

(provide '30_emmet-mode)
;;; 30_emmet-mode.el ends here
