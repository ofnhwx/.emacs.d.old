;;; 20_smartparens.el --- configurations.
;;; Commentary:
;;; Code:

(use-package smartparens
  :ensure t
  :demand t
  :diminish smartparens-mode
  :config
  (sp-with-modes '(lisp-mode lisp-interaction-mode emacs-lisp-mode)
    (sp-local-pair "'" nil :actions nil)
    (sp-local-pair "`" nil :actions nil))
  (smartparens-global-mode t))

(provide '20_smartparens)
;;; 20_smartparens.el ends here
