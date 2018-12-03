;;; 30_rainbow-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package rainbow-mode
  :ensure t
  :defer t
  :diminish rainbow-mode
  :hook
  ((lisp-interaction-mode . rainbow-mode)
   (emacs-lisp-mode . rainbow-mode)
   (html-mode . rainbow-mode)
   (css-mode . rainbow-mode)
   (php-mode . rainbow-mode)
   (web-mode . rainbow-mode)))

(provide '30_rainbow-mode)
;;; 30_rainbow-mode.el ends here
