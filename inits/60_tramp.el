;;; 60_tramp.el --- configurations.
;;; Commentary:
;;; Code:

(use-package tramp
  :init
  (set-variable 'tramp-persistency-file-name (e:expand "tramp" :cache)))

(provide '60_tramp)
;;; 60_tramp.el ends here
