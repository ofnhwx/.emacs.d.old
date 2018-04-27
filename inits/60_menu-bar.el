;;; 60_menu-bar.el --- configurations.
;;; Commentary:
;;; Code:

(use-package menu-bar+
  :after (menu-bar)
  :preface (progn (quelpa '(menu-bar+ :fetcher github :repo "emacsmirror/menu-bar-plus"))
                  (locate-library "menu-bar+")))

(provide '60_menu-bar)
;;; 60_menu-bar.el ends here
