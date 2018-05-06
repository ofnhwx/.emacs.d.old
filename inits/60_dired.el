;;; 60_dired.el --- configurations.
;;; Commentary:
;;; Code:

(use-package dired
  :custom
  (dired-use-ls-dired t)
  (ls-lisp-dirs-first t)
  (dired-dwim-target t)
  (dired-recursive-copies 'always)
  (dired-isearch-filenames t)
  (dired-listing-switches "ahl"))

(use-package dired-x
  :after (dired))

(use-package wdired
  :after (dired+)
  :config
  (bind-keys
   :map dired-mode-map
   ("r" . wdired-change-to-wdired-mode)))

(use-package dired+
  :if (progn (quelpa '(dired+ :fetcher github :repo "emacsmirror/dired-plus"))
             (locate-library "dired+"))
  :after (dired)
  :config
  (bind-keys
   :map dired-mode-map
   ("M-g" . nil))
  (defun dired-show-details ()
    (dired-hide-details-mode 0))
  (add-hook 'dired-mode-hook 'dired-show-details))

(e:use-package dired-atool
  (executable-find "atool")
  :after (dired)
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ("z" . dired-atool-do-unpack-with-subdirectory)
   ("Z" . dired-atool-do-pack)))

(use-package dired-collapse
  :after (dired)
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ("," . dired-collapse-mode)))

(use-package dired-filter
  :after (dired)
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'dired-filter-mode))

(use-package dired-hacks-utils
  :after (dired)
  :ensure t
  :config
  (bind-keys
   ([remap diredp-previous-line] . dired-hacks-previous-file)
   ([remap diredp-next-line] . dired-hacks-next-file)))

(use-package dired-narrow
  :after (dired)
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ("N" . dired-narrow-fuzzy)))

(use-package dired-ranger
  :after (dired)
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ("b" . dired-ranger-bookmark-visit)
   ("B" . dired-ranger-bookmark)
   ("C-w" . dired-ranger-copy)
   ("C-y" . dired-ranger-paste)
   ("M-w" . dired-ranger-copy)
   ("M-y" . dired-ranger-move)
   ("C-c b" . diredp-byte-compile-this-file)
   ("C-c B" . dired-do-byte-compile)))

(use-package dired-sort
  :if (progn (quelpa '(dired-sort :fetcher github :repo "emacsmirror/dired-sort"))
             (locate-library "dired-sort"))
  :after (dired hydra)
  :config
  (bind-keys
   :map dired-mode-map
   ("s" . hydra-dired-sort/body))
  (defhydra hydra-dired-sort
    (:color teal)
    "sort by"
    ("s" dired-sort-size "size")
    ("x" dired-sort-extension "extension")
    ("c" dired-sort-ctime "ctime")
    ("u" dired-sort-utime "utime")
    ("t" dired-sort-time "time")
    ("n" dired-sort-name "name")))

(use-package dired-subtree
  :after (dired)
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ("i" . dired-subtree-toggle)))

(use-package dired-toggle-sudo
  :after (dired)
  :ensure t
  :config
  (bind-keys
   :map dired-mode-map
   ("C-c s" . dired-toggle-sudo)))

(provide '60_dired)
;;; 60_dired.el ends here
