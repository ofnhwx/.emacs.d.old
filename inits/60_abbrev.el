;;; 60_abbrev.el --- configurations.
;;; Commentary:
;;; Code:

(use-package abbrev
  :diminish abbrev-mode
  :init
  (set-variable 'abbrev-file-name (e:expand "abbrev.defs" :cache))
  (set-variable 'save-abbrevs t)
  :config
  (when (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file)))

(provide '60_abbrev)
;;; 60_abbrev.el ends here
