;;; 60_term.el --- configurations.
;;; Commentary:
;;; Code:

(use-package term+
  :after (term)
  :ensure t
  :defer t
  :bind
  (:map term+char-map
        ("C-^" . nil)
        ("C-z" . nil)))

(use-package term+mux
  :after (term+)
  :ensure t)

(provide '60_term)
;;; 60_term.el ends here
