;;; 60_url-cookie.el --- configurations.
;;; Commentary:
;;; Code:

(use-package url-cookie
  :init
  (set-variable 'url-cookie-file (e:expand "cookies" :cache)))

(provide '60_url-cookie)
;;; 60_url-cookie.el ends here
