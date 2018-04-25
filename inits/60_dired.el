;;; 60_dired.el --- setup dired.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2018/04/26 13:52:36>
;;

;;; Commentary:

;;; Code:

(use-package dired
  :init
  (set-variable 'dired-use-ls-dired t)           ;; 'ls'に'--dired'をオプションとして渡す
  (set-variable 'ls-lisp-dirs-first t)           ;; ディレクトリを上に表示
  (set-variable 'dired-dwim-target t)            ;; 2つ開いてる場合にもう片方をデフォルトのターゲットに
  (set-variable 'dired-recursive-copies 'always) ;; ディレクトリを再帰的にコピーする
  (set-variable 'dired-isearch-filenames t)      ;; diredバッファでC-sした時にファイル名だけにマッチするように
  (set-variable 'dired-listing-switches "ahl")   ;; 'ls'に渡すオプション
  :config
  (defun dired-show-details ()
    (dired-hide-details-mode 0))
  (add-hook 'dired-mode-hook 'dired-show-details))

(use-package wdired
  :after (dired)
  :bind
  (:map dired-mode-map
        ("r" . wdired-change-to-wdired-mode)))

(use-package dired-x
  :after (dired))

(use-package dired+
  :after (dired)
  :config
  (bind-keys
   :map dired-mode-map
   ("M-g" . nil)))

(use-package dired-atool
  :bind
  (:map dired-mode-map
        ("z" . dired-atool-do-unpack-with-subdirectory)
        ("Z" . dired-atool-do-pack)))

(use-package dired-collapse
  :bind
  (:map dired-mode-map
        ("," . dired-collapse-mode))
  :config
  (add-hook 'dired-mode-hook 'dired-collapse-mode))

(use-package dired-filter
  :config
  (add-hook 'dired-mode-hook 'dired-filter-mode))

(use-package dired-hacks-utils
  :bind
  ([remap diredp-previous-line] . dired-hacks-previous-file)
  ([remap diredp-next-line] . dired-hacks-next-file))

(use-package dired-narrow
  :bind
  (:map dired-mode-map
        ("N" . dired-narrow-fuzzy)))

(use-package dired-ranger
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
  :bind
  (:map dired-mode-map
        ("i" . dired-subtree-toggle)))

(use-package dired-toggle-sudo
  :bind
  (:map dired-mode-map
        ("C-c s" . dired-toggle-sudo)))

(provide '60_dired)
;;; 60_dired.el ends here
