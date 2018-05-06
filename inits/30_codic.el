;;; 20_codic.el --- configurations.
;;; Commentary:
;;; Code:

(use-package codic
  :ensure t
  :defer t
  :config
  (set-variable 'codic-api-token (e:auth-source-get 'api-token :app "codic")))

(provide '20_codic)
;;; 20_codic.el ends here
