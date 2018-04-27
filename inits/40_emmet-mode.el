;;; 20_emmet-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package emmet-mode
  :ensure t
  :commands (emmet-mode)
  :init
  (set-variable 'emmet-indentation 2)
  :config
  (bind-keys
   :map emmet-mode-keymap
   ("<C-return>" . nil)
   ("C-c C-j" . emmet-expand-line)
   ("C-j" . nil))
  (add-hook 'php-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(provide '20_emmet-mode)
;;; 20_emmet-mode.el ends here
