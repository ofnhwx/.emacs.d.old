;;; 60_org.el --- configurations.
;;; Commentary:
;;; Code:

(use-package org
  :init
  (set-variable 'org-directory (e:expand "org" :config))
  (set-variable 'org-agenda-files
                (cl-remove-if 'file-directory-p (directory-files (e:expand "agenda" org-directory) t))))

(provide '60_org)
;;; 60_org.el ends here
