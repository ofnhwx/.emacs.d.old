;;; 20_lacarte.el --- configurations.
;;; Commentary:
;;; Code:

(use-package lacarte
  :if (progn (quelpa '(lacarte :fetcher github :repo "emacsmirror/lacarte"))
             (locate-library "lacarte"))
  :defer t
  :bind
  (:map global-map
        ("M-X" . lacarte-execute-command)))

(provide '20_lacarte)
;;; 20_lacarte.el ends here
