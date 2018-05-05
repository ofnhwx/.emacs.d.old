;;; 20_list-processes+.el --- configurations.
;;; Commentary:
;;; Code:

(use-package list-processes+
  :if (progn (quelpa '(list-processes+ :fetcher github :repo "emacsmirror/list-processes-plus"))
             (locate-library "list-processes+"))
  :defer t)

(provide '20_list-processes+)
;;; 20_list-processes+.el ends here
