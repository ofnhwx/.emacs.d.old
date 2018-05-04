;;; 20_lacarte.el --- configurations.
;;; Commentary:
;;; Code:

(use-package lacarte
  :if (progn (quelpa '(lacarte :fetcher github :repo "emacsmirror/lacarte"))
             (locate-library "lacarte")))

(provide '20_lacarte)
;;; 20_lacarte.el ends here
