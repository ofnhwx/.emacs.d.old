;;; 30_list-processes+.el --- configurations.
;;; Commentary:
;;; Code:

(use-package list-processes+
  :if (progn (quelpa '(list-processes+ :fetcher github :repo "emacsmirror/list-processes-plus"))
             (locate-library "list-processes+"))
  :defer t)

(provide '30_list-processes+)
;;; 30_list-processes+.el ends here
