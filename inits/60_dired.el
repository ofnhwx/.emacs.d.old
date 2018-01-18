;;; 60_dired.el --- setup dired.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/12/15 17:53:33>
;;

;;; Commentary:

;;; Code:

(use-package dired
  :bind
  (:map dired-mode-map
        ("r" . wdired-change-to-wdired-mode)
        ("M-g" . nil))
  :config
  (use-package dired+
    :if (e:require-package 'dired+ nil t)))

(use-package dired-atool
  :if (and (executable-find "atool")
           (e:require-package 'dired-atool nil t))
  :bind
  (:map dired-mode-map
        ("z" . dired-atool-do-unpack-with-subdirectory)
        ("Z" . dired-atool-do-pack)))

(use-package dired-collapse
  :if (e:require-package 'dired-collapse nil t)
  :config
  (add-hook 'dired-mode-hook 'dired-collapse-mode))

(use-package dired-filter
  :if (e:require-package 'dired-filter nil t)
  :config
  (add-hook 'dired-mode-hook 'dired-filter-mode))

(use-package dired-hacks-utils
  :if (e:require-package 'dired-hacks-utils nil t)
  :bind
  ([remap diredp-previous-line] . dired-hacks-previous-file)
  ([remap diredp-next-line] . dired-hacks-next-file))

(use-package dired-narrow
  :if (e:require-package 'dired-narrow nil t)
  :bind
  (:map dired-mode-map
        ("N" . dired-narrow-fuzzy)))

(use-package dired-ranger
  :if (e:require-package 'dired-ranger nil t)
  :bind
  (:map dired-mode-map
        ("b" . dired-ranger-bookmark-visit)
        ("B" . dired-ranger-bookmark)
        ("C-w" . dired-ranger-copy)
        ("C-y" . dired-ranger-paste)
        ("M-w" . dired-ranger-copy)
        ("M-y" . dired-ranger-move)
        ("C-c b" . diredp-byte-compile-this-file)
        ("C-c B" . dired-do-byte-compile)))

(use-package dired-sort
  :if (e:require-package 'dired-sort nil t)
  :bind
  (:map dired-mode-map
        ("s" . hydra-dired-sort/body))
  :config
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
  :if (e:require-package 'dired-subtree nil t)
  :bind
  (:map dired-mode-map
        ("i" . dired-subtree-toggle)))

(use-package dired-toggle-sudo
  :if (e:require-package 'dired-toggle-sudo nil t)
  :bind
  (:map dired-mode-map
        ("C-c s" . dired-toggle-sudo)))

(provide '60_dired)
;;; 60_dired.el ends here