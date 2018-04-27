;;; 20_rainbow-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package rainbow-mode
  :ensure t
  :diminish rainbow-mode
  :commands (rainbow-mode)
  :config
  (add-hook 'lisp-interaction-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'php-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'rainbow-mode))

(provide '20_rainbow-mode)
;;; 20_rainbow-mode.el ends here
