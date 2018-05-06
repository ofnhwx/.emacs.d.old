;;; 20_rainbow-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package rainbow-mode
  :ensure t
  :defer t
  :diminish rainbow-mode
  :hook
  ((lisp-interaction-mode-hook . rainbow-mode)
   (emacs-lisp-mode-hook . rainbow-mode)
   (html-mode-hook . rainbow-mode)
   (css-mode-hook . rainbow-mode)
   (php-mode-hook . rainbow-mode)
   (web-mode-hook . rainbow-mode)))

(provide '20_rainbow-mode)
;;; 20_rainbow-mode.el ends here
