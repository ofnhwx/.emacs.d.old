;;; 40_web.el --- configurations.
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
  :init
  (add-hook 'editorconfig-custom-hooks 'web-mode-re-setup-padding)
  (autoload 'web-mode-re-setup-padding "web-mode")
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
  (defun web-mode-re-setup-padding (props)
    (setq web-mode-script-padding 2)
    (setq web-mode-style-padding  2)
    (setq web-mode-block-padding  2)))

(provide '40_web)
;;; 40_web.el ends here
