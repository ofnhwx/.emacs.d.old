;;; 20_open-junk-file.el --- configurations.
;;; Commentary:
;;; Code:

(use-package open-junk-file
  :ensure t
  :defer t
  :init
  (set-variable 'open-junk-file-format (e:expand "junk/%Y%m%d_%H%M%S." :cache)))

(provide '20_open-junk-file)
;;; 20_open-junk-file.el ends here
