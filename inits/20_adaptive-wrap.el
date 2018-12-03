;;; 20_adaptive-wrap.el --- configurations.
;;; Commentary:
;;; Code:

(use-package adaptive-wrap
  :ensure t
  :demand t
  :hook
  (adaptive-wrap-prefix-mode . adaptive-wrap-set-extra-indent)
  :config
  (defun adaptive-wrap-prefix-mode-auto (&rest args)
    (adaptive-wrap-prefix-mode (if truncate-lines 0 1)))
  (defun adaptive-wrap-set-extra-indent ()
    (setq adaptive-wrap-extra-indent (if indent-tabs-mode 1 tab-width)))
  (advice-add 'toggle-truncate-lines :after 'adaptive-wrap-prefix-mode-auto)
  (advice-add 'visual-line-mode :after 'adaptive-wrap-prefix-mode-auto))

(provide '20_adaptive-wrap)
;;; 20_adaptive-wrap.el ends here
