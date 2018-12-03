;;; 20_avy.el --- configurations.
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :defer t
  :custom
  (avy-all-windows t)
  (avy-background t)
  (avy-keys (number-sequence ?a ?z))
  :config
  (defun add-keys-to-avy (prefix c &optional mode)
    (define-key global-map
      (read-kbd-macro (concat prefix (string c)))
      `(lambda ()
         (interactive)
         (funcall ',(if (eq mode 'word)
                        'avy-goto-word-1
                      'avy-goto-char) ,c))))
  (cl-loop for c from ?0 to ?9 do (add-keys-to-avy "s-" c 'word))
  (cl-loop for c from ?a to ?z do (add-keys-to-avy "s-" c 'word))
  (cl-loop for c from ?0 to ?9 do (add-keys-to-avy "s-M-" c))
  (cl-loop for c from ?a to ?z do (add-keys-to-avy "s-M-" c)))

(use-package ace-link
  :ensure t
  :demand t
  :config
  (ace-link-setup-default))

(use-package ace-window
  :ensure t
  :defer t)

(e:use-package avy-migemo
  (executable-find "cmigemo")
  :after (migemo)
  :ensure t
  :demand t
  :config
  (avy-migemo-mode 1))

(use-package avy-zap
  :ensure t
  :defer t)

(provide '20_avy)
;;; 20_avy.el ends here
