;;; 40_web-mode.el --- configurations.
;;; Commentary:
;;; Code:

(use-package web-mode
  :ensure t
  :defer t
  :mode (("\\.twig\\'" . web-mode))
  :bind
  (:map web-mode-map
        ("C-]" . ac-php-find-symbol-at-point)
        ("C-}" . ac-php-location-stack-back))
  :hook (editorconfig-custom-hooks . web-mode-re-setup-padding)
  :custom
  (web-mode-comment-keywords "\\(?:BUG\\|FIXME\\|HACK\\|KLUDGE\\|OPTIMIZE\\|RE\\(?:FACTOR\\|VIEW\\)\\|TODO\\|WORKAROUND\\|XXX\\|MEMO\\)")
  ;; offset
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset    2)
  (web-mode-code-indent-offset   4)
  (web-mode-attr-indent-offset   2)
  ;; padding
  (web-mode-style-padding  2)
  (web-mode-script-padding 2)
  (web-mode-block-padding  2)
  :config
  (defun web-mode-re-setup-padding ()
    (setq web-mode-script-padding 2)
    (setq web-mode-style-padding  2)
    (setq web-mode-block-padding  2)))

(provide '40_web-mode)
;;; 40_web-mode.el ends here
