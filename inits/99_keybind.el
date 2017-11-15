;;; 99_keybind.el --- キーバインド.
;;
;; -*- mode: Emacs-Lisp; coding: utf-8 -*-
;; Last updated: <2017/11/14 12:37:41>
;;

;;; Commentary:

;;; Code:

(e:define-prefix-command base-command-map    "他のコマンドへの派生元")
(e:define-prefix-command buffer-command-map  "バッファー関連のコマンド")
(e:define-prefix-command file-command-map    "ファイル関連のコマンド")
(e:define-prefix-command general-command-map "よく使ういろいろなコマンド")

;; for:`base-command-map'
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map base-command-map
   ("b" . buffer-command-map)
   ("f" . file-command-map)
   ("g" . general-command-map)
   ("t" . hydra-toggle/body)))
(use-package hydra
  :if (e:require-package 'hydra)
  :config
  (defhydra hydra-toggle (base-command-map "t")
    "toggle"
    ("h" hs-minor-mode         "hideshow")
    ("r" read-only-mode        "readonly")
    ("t" toggle-truncate-lines "truncate")
    ("w" whitespace-mode       "whitespace")))

;; for:`buffer-command-map'
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map buffer-command-map
   ("b" . switch-to-buffer)
   ("k" . kill-buffer)))

;; for:`file-command-map'
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map file-command-map
   ("f" . find-file)
   ("g" . helm-ghq)
   ("h" . helm-find-files)
   ("m" . magit-find-file)
   ("p" . helm-find-files-with-projectile)
   ("r" . helm-recentf)))

;; for:`general-command-map'
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map general-command-map
   ("," . helm-ag-pop-stack)
   ("." . helm-ag)
   ("/" . helm-ag-project-root)
   ("_" . helm-ag-this-file)
   ("b" . backup-walker-start)
   ("c" . helm-flycheck)
   ("d" . magit-diff-buffer-file-popup)
   ("e" . string-edit-at-point)
   ("g" . avy-goto-line)
   ("l" . magit-log-buffer-file-popup)
   ("m" . helm-switch-major-mode)
   ("s" . magit-status)))

;; for:`global-map'
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map global-map
   ("C-," . base-command-map)
   ("C-:" . avy-goto-char)
   ("C-;" . avy-goto-word-1)
   ("C-^" . ace-window)
   ("M-%" . vr/query-replace)
   ("M-/" . bbyac-expand-symbols)
   ("M-:" . helm-eval-expression-with-eldoc)
   ("M-g" . general-command-map)
   ("M-x" . helm-M-x)
   ("M-X" . lacarte-execute-command)
   ("M-y" . helm-show-kill-ring)
   ("M-z" . avy-zap-to-char-dwim)
   ("C-<" . er/contract-region)
   ("C->" . er/expand-region)
   ("C-M-¥"   . indent-region)))

(use-package bind-key
  :if (and (os-type-mac-p)
           (e:require-package 'bind-key))
  :config
  (defun scroll-down-with-lines ()
    (interactive)
    (scroll-down 3))
  (defun scroll-up-with-lines ()
    (interactive)
    (scroll-up 3))
  (bind-keys
   :map global-map
   ("<wheel-up>"          . scroll-down-with-lines)
   ("<wheel-down>"        . scroll-up-with-lines)
   ("<double-wheel-up>"   . scroll-down-with-lines)
   ("<double-wheel-down>" . scroll-up-with-lines)
   ("<triple-wheel-up>"   . scroll-down-with-lines)
   ("<triple-wheel-down>" . scroll-up-with-lines)))

(use-package hydra
  :if (e:require-package 'hydra)
  :config
  (defhydra hydra-jump (global-map "M-g")
    "jump"
    ("n" next-error               "next-error")
    ("p" previous-error           "prev-error")
    ("N" git-gutter:next-hunk     "next-hunk")
    ("P" git-gutter:previous-hunk "prev-hunk")))

(use-package hydra
  :if (e:require-package 'hydra)
  :config
  (defhydra hydra-mc (global-map "C-t")
    "mc"
    ("C-t" mc/mark-next-like-this          "next")
    ("n"   mc/mark-next-like-this          "next")
    (">"   mc/mark-next-like-this          "next")
    ("p"   mc/mark-previous-like-this      "prev")
    ("<"   mc/mark-previous-like-this      "prev")
    ("m"   mc/mark-more-like-this-extended "more")
    ("u"   mc/unmark-next-like-this        "unmark-next")
    ("U"   mc/unmark-previous-like-this    "unmark-prev")
    ("s"   mc/skip-to-next-like-this       "skip-next")
    ("S"   mc/skip-to-previous-like-this   "skip-prev")
    ("*"   mc/mark-all-like-this           "all")
    ("d"   mc/mark-all-like-this-dwim      "all-dwim")
    ("i"   mc/insert-numbers               "insert-numbers")
    ("o"   mc/sort-regions                 "sort")
    ("O"   mc/reverse-regions              "reverse")))

(use-package hydra
  :if (e:require-package 'hydra)
  :config
  (defhydra hydra-wc (global-map "C-c")
    "a"
    ("n" (lambda () (interactive) (scroll-other-window  1)))
    ("p" (lambda () (interactive) (scroll-other-window -1)))
    ("N" (lambda () (interactive) (scroll-other-window)))
    ("P" (lambda () (interactive) (scroll-other-window '-)))
    ("=" balance-windows)
    ("~" shrink-window)
    ("^" enlarge-window)
    ("{" shrink-window-horizontally)
    ("}" enlarge-window-horizontally)))

(use-package mykie
  :if (e:require-package 'mykie)
  :config
  (mykie:set-keys global-map
    "C-w"
    :default (kill-region (line-beginning-position) (line-end-position))
    :region kill-region
    "M-w"
    :default (kill-ring-save (line-beginning-position) (line-end-position))
    :region kill-ring-save))

 ;; for:`search-map' (M-s)
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map search-map
   ("g" . dumb-jump-go)
   ("b" . dumb-jump-back)
   ("q" . dumb-jump-quick-look)))

 ;; for:`ctl-x-map'
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map ctl-x-map
   ("f" . find-file)
   ("o" . ace-window)
   ("C-b" . helm-multi-files)
   ("C-c" . helm-M-x)
   ("C-f" . helm-find-files-with-projectile)))

;; for:`mode-specific-map' (C-c)
(use-package bind-key
  :if (e:require-package 'bind-key)
  :config
  (bind-keys
   :map mode-specific-map
   ("i" . imenu)
   ("t" . google-translate-enja-or-jaen)
   ("x" . shell-pop)
   ("z" . eshell)))

;; for:`dired-mode-map'
(with-eval-after-load "dired"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (bind-keys
     :map dired-mode-map
     ("r" . wdired-change-to-wdired-mode))))

;; for:`elscreen-map'
(with-eval-after-load "elscreen"
  (with-eval-after-load "helm-elscreen"
    (use-package bind-key
      :if (e:require-package 'bind-key)
      :config
      (bind-keys
       :map elscreen-map
       ("C-z" . helm-elscreen)))))

;; for:`eshell-mode-map'
(with-eval-after-load "eshell"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (add-hook
     'eshell-mode-hook
     (lambda ()
       (bind-keys
        :map eshell-mode-map
        ("M-p" . helm-eshell-history)
        ("M-n" . helm-esh-pcomplete))))))

;; for:`eww-mode-map'
(with-eval-after-load "eww"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (bind-keys
     :map eww-mode-map
     ("o" . ace-link-eww))))

;; for:`helm-map'
(with-eval-after-load "helm"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (bind-keys
     :map help-map
     ("a" . helm-apropos)
     ("b" . helm-descbinds))))

;; for:`isearch-mode-map'
(with-eval-after-load "isearch"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (bind-keys
     :map isearch-mode-map
     ("C-o" . helm-swoop-from-isearch))))

;; for:`term+char-map'
(with-eval-after-load "term+"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (bind-keys
     :map term+char-map
     ("C-^" . nil)
     ("C-z" . nil))))

;; for:`php-mode-map'
(with-eval-after-load "php-mode"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (with-eval-after-load 'php-mode
      (bind-keys
       :map php-mode-map
       ("C-]" . ac-php-find-symbol-at-point)
       ("C-}" . ac-php-location-stack-back)))))

;; for:`web-mode-map'
(with-eval-after-load "web-mode"
  (use-package bind-key
    :if (e:require-package 'bind-key)
    :config
    (with-eval-after-load 'web-mode
      (bind-keys
       :map web-mode-map
       ("C-]" . ac-php-find-symbol-at-point)
       ("C-}" . ac-php-location-stack-back)))))

(provide '99_keybind)
;;; 99_keybind.el ends here
