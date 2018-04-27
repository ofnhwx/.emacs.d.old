;;; 20_restclient.el --- configurations.
;;; Commentary:
;;; Code:

(use-package restclient
  :ensure t)

(use-package restclient-helm
  :after (restclient helm)
  :ensure t)

(provide '20_restclient)
;;; 20_restclient.el ends here
