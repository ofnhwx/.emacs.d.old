;;; 30_cobol.el --- configurations.
;;; Commentary:
;;; Code:

(use-package cobol-mode
  :if (progn (quelpa '(cobol-mode :fetcher github :repo "emacsmirror/cobol-mode"))
             (locate-library "cobol-mode"))
  :defer t
  :mode (("\\.cob\\'" . cobol-mode)
         ("\\.cbl\\'" . cobol-mode)
         ("\\.lst\\'" . cobol-mode)
         ("\\.pco\\'" . cobol-mode)
         ("\\.pcom\\'" . cobol-mode)))

(use-package column-marker
  :after (cobol-mode)
  :if (progn (quelpa '(column-marker :fetcher github :repo "emacsmirror/column-marker"))
             (locate-library "column-marker"))
  :custom
  (cobol-column-marker-1 6)
  (cobol-column-marker-2 72))

(provide '30_cobol)
;;; 30_cobol.el ends here
