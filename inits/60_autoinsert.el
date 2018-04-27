;;; 60_autoinsert.el --- configurations.
;;; Commentary:
;;; Code:

(use-package autoinsert
  :init
  (set-variable 'auto-insert-directory (e:expand "insert" :cache))
  :config
  (auto-insert-mode 1))

(provide '60_autoinsert)
;;; 60_autoinsert.el ends here
