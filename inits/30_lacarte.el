;;; 30_lacarte.el --- configurations.
;;; Commentary:
;;; Code:

(use-package lacarte
  :if (progn (quelpa '(lacarte :fetcher github :repo "emacsmirror/lacarte"))
             (locate-library "lacarte"))
  :defer t)

(provide '30_lacarte)
;;; 30_lacarte.el ends here
