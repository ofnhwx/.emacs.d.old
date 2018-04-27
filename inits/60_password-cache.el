;;; 60_password-cache.el --- configurations.
;;; Commentary:
;;; Code:

(use-package password-cache
  :init
  (set-variable 'password-cache-expiry 3600))

(provide '60_password-cache)
;;; 60_password-cache.el ends here
